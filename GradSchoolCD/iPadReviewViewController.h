//
//  GSCDDisplay.h
//  GradSchoolCD
//
//  Created by Will Hofacker on 11/27/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * Used to set the parent view so that this can be closed
 */
@protocol GSDCDisplayDelegate

-(void) closeDisplay;

@end

@interface iPadReviewViewController : UIViewController
{
    IBOutlet UILabel *name;
    IBOutlet UILabel *birthDate;
    IBOutlet UILabel *phoneNum;
    IBOutlet UILabel *emailAdress;
    IBOutlet UILabel *street;
    IBOutlet UILabel *aptNum;
    IBOutlet UILabel *zip;
    IBOutlet UILabel *city;
    IBOutlet UILabel *state;
    IBOutlet UILabel *country;
    IBOutlet UILabel *institution;
    IBOutlet UILabel *major;
    IBOutlet UILabel *entryTerm;
    IBOutlet UILabel *anticipatedYear;
    IBOutlet UILabel *programsInterestedIn;
}

/**
 * Closes the current view and returns to the last view
 */
-(IBAction)previousView:(id)sender;

/**
 * Submits data to the server
 */
-(IBAction)submitData:(id)sender;


@property id<GSDCDisplayDelegate> delegate;

@end
