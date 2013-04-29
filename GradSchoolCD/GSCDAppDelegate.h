//
//  GSCDAppDelegate.h
//  GradSchoolCD
//
//  Created by Will Hofacker on 11/27/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "URLManager.h"
#import "StudentInquiry.h"


@interface GSCDAppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;

/** Core data stuff */
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

/** The data object with the current form information */
@property (strong, nonatomic) StudentInquiry *currentInquiry;



-(void) startForm;

-(void) restartForm;

/**
 * Submit information to server
 *
 * If submission is successful, deletes data, otherwise stores for processing at another time.
 *
 * @param    Inquiry    The data object
 *
 * @return    BOOL    whether the operation was successful or not
 */
-(BOOL) submitInquiryToServer;


@end
