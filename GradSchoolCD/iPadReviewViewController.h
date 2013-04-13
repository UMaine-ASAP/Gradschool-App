//
//  GSCDDisplay.h
//  GradSchoolCD
//
//  Created by Will Hofacker on 11/27/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GSDCDisplayDelegate

-(void) closeDisplay;

@end

@interface iPadReviewViewController : UIViewController{
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
}

-(void)placeInfo; 
-(IBAction)cleardata:(id)sender;
-(IBAction)keepData:(id)sender;
- (IBAction)closeView:(id)sender;

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@property (nonatomic,strong) NSArray* studentInquries;
@property id<GSDCDisplayDelegate> delegate;

@end
