//
//  GSCDEntryScreen.h
//  GradSchoolCD
//
//  Created by Will Hofacker on 11/27/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GSCDSelectionBox.h"
#import "iPadReviewViewController.h"
#import "GSCDAppDelegate.h"
#import "StudentInquiry.h"

@interface iPadFormViewController : UIViewController<GSDCDisplayDelegate, UIScrollViewDelegate>

@property (nonatomic, weak) StudentInquiry *currentInquiry;


- (IBAction)gotoReviewScreen:(id)sender;
- (IBAction)updateAnticipatedYear:(UIStepper *)sender;
- (IBAction)semesterSelect:(UISegmentedControl *)sender;

- (IBAction)prevField:(id)sender;
- (IBAction)nextField:(id)sender;
- (IBAction)closeKeyboard:(id)sender;


/**
 * Sets all fields back to their default state
 */
-(void) reset;

@end

