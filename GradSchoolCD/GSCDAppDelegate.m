//
//  GSCDAppDelegate.m
//  GradSchoolCD
//
//  Created by Will Hofacker on 11/27/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import "GSCDAppDelegate.h"

@implementation GSCDAppDelegate

@synthesize window = _window;
@synthesize managedObjectContext = __managedObjectContext;
@synthesize managedObjectModel = __managedObjectModel;
@synthesize persistentStoreCoordinator = __persistentStoreCoordinator;



# pragma mark - App Delegate Functionality

/**
 * Sends any unsent data in the database (Internal Function)
 */
-(void) submitAllUnsentInquiriesToServer
{
    
    // Get all unsent inquiries from core data
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSManagedObjectContext *context = [self managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"StudentInquiry" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *studentInquries = [context executeFetchRequest:fetchRequest error:&error];
	
	// Send the inquiries
    for (StudentInquiry *inquiry in studentInquries){
		[self submitInquiryToServer:inquiry];
	}
}

-(BOOL) submitInquiryToServer
{
	return [self submitInquiryToServer:self.currentInquiry];
}

/*
//Checks if URL has been changed from Settings page
-(BOOL)urlToUse{
//    if (NSBundle * == [NSDictionary dictionaryWithObject:@"YES"
 //                                                               forKey:@"useDefaultURL"])
//        return [NSString stringWithFormat:@"http://kenai.asap.um.maine.edu/gradapp/save.php"];
//    else
//        return[NSString * == [NSDictionary dictionaryWithObject:@"%d"
//                                                         forKey:@"altUrl"]];
}
*/

/**
 * Send a specific inquiry to the server (Internal Function)
 */
-(BOOL) submitInquiryToServer:(StudentInquiry *)inquiry
{
	if ( [URLManager sendToURL:@"http://kenai.asap.um.maine.edu/gradapp/save.php" withData:inquiry] )
	{
		[[self managedObjectContext] deleteObject:inquiry];
		return YES;
	}
	inquiry.isSent = NO;
	
	return NO;
}

-(void) startForm
{
	// Create a new inquiry
	_currentInquiry = [NSEntityDescription
						insertNewObjectForEntityForName:@"StudentInquiry"
						inManagedObjectContext:self.managedObjectContext];
	[self restartForm];
}


-(void) restartForm
{
	[_currentInquiry resetValues];
}

# pragma mark - App States

/**
 * App starting for the first time
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self submitAllUnsentInquiriesToServer];
	
	[self startForm];
    return NO;
/*
    // Set the application defaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *appDefaults = [NSDictionary dictionaryWithObject:@"YES"
                                                            forKey:@"enableRotation"];
    [defaults registerDefaults:appDefaults];
    [defaults synchronize];
 */
}

/**
 * App was reactivated
 */
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [self submitAllUnsentInquiriesToServer];
}

/**
 * App is about to quit
 */
- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


/* ========================================= */
/* = Core Data = */
/* ========================================= */


#pragma mark - Core Data stack

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
			// Replace this implementation with code to handle the error appropriately.
			// abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}


// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (__managedObjectContext != nil) {
        return __managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        __managedObjectContext = [[NSManagedObjectContext alloc] init];
        [__managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return __managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (__managedObjectModel != nil) {
        return __managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"GradSchoolCD" withExtension:@"momd"];
    __managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return __managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (__persistentStoreCoordinator != nil) {
        return __persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"GradSchoolCD.sqlite"];
	
	// uncomment and run once to delete incompatible core data model
	[[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil];
    
    NSError *error = nil;
    __persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return __persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


#pragma mark - Unused Methods

/* ========================================= */
/* = Unused methods = */
/* ========================================= */


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}



@end
