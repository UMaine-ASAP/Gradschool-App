//
//  GSCDAppDelegate.h
//  GradSchoolCD
//
//  Created by Will Hofacker on 11/27/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GSCDData.h"
#import "URLManager.h"


@interface GSCDAppDelegate : UIResponder <UIApplicationDelegate>{
    
    GSCDData *allInfo;
    Boolean new;
    Boolean mesagedisplay;
}

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic,strong) NSArray* studentInquries;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (void) passThrought:(int)tag:(NSString *)answer;
- (NSMutableArray *) passback;
- (void) send;
- (GSCDData *) getData;
- (Boolean)OK;
- (void)getButton:(UIButton *)b;
- (void)setNew:(Boolean)value;
- (Boolean)isNew;
- (void) clearData;
- (Boolean)displayMessage;
- (void)setMessageDisplay:(Boolean)value;
- (void)placeInfoInCoreData;
- (void)logCoreData;
- (void)antYear;

@end
