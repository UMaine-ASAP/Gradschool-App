//
//  iPhoneFormViewController.h
//  GradSchoolCD
//
//  Created by Mike Botieri on 4/29/13.
//  Copyright (c) 2013 UMO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GSCDAppDelegate.h"
#import "StudentInquiry.h"
#import "iPadFormViewController.h"

@interface iPhoneFormViewController : UIViewController

-(IBAction)unwindToIphoneMainScreen:(UIStoryboardSegue *)segue;

/**
 * Sets all fields back to their default state
 */
-(void) reset;

@end
