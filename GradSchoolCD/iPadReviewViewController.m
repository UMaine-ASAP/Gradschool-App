//
//  GSCDDisplay.m
//  GradSchoolCD
//
//  Created by Will Hofacker on 11/27/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import "iPadReviewViewController.h"
#import "GSCDAppDelegate.h"
#import "StudentInquiry.h"
#import "iPadFormViewController.h"

@implementation iPadReviewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	
	// Get inquiry object
    GSCDAppDelegate *MyappDelegate = [[UIApplication sharedApplication] delegate];
    StudentInquiry *inquiry = MyappDelegate.currentInquiry;

	// Place data
    name.text            = [NSString stringWithFormat:@"Name: %@", inquiry.name];
    birthDate.text       = [NSString stringWithFormat:@"Birth Date: %@", inquiry.dateOfBirth];
    phoneNum.text        = [NSString stringWithFormat:@"Phone Number: %@", inquiry.phoneNumber];
    emailAdress.text     = [NSString stringWithFormat:@"Email Address: %@", inquiry.email];
    street.text          = [NSString stringWithFormat:@"Street: %@", inquiry.street];
    aptNum.text          = [NSString stringWithFormat:@"Apt#: %@", inquiry.aptNumber];
    zip.text             = [NSString stringWithFormat:@"Postal Code: %@", inquiry.zip];
    city.text            = [NSString stringWithFormat:@"City: %@", inquiry.city];
    state.text           = [NSString stringWithFormat:@"State: %@", inquiry.state];
    country.text         = [NSString stringWithFormat:@"Country: %@", inquiry.country];
    institution.text     = [NSString stringWithFormat:@"Institution: %@", inquiry.undergraduateInstitution];
    major.text           = [NSString stringWithFormat:@"Major: %@", inquiry.undergraduateMajor];
    entryTerm.text       = [NSString stringWithFormat:@"Anticipated Entry Term: %@", inquiry.anticipatedTerm];
    anticipatedYear.text = [NSString stringWithFormat:@"Anticipated Year: %@", inquiry.anticipatedYear];


    NSMutableString *interestedPrograms = [[NSMutableString alloc] init];
    for (NSString *program in inquiry.programs) {
        if ([interestedPrograms length] > 0) {
            [interestedPrograms appendFormat:@", %@", program];
        } else {
            [interestedPrograms appendString:program];
        }
    }
    
    // Add other program
    if(inquiry.otherProgram != nil) {
        [interestedPrograms appendFormat:@", %@", inquiry.otherProgram];
    }
    
    programsInterestedIn.text = interestedPrograms;
}


// this button is attached to the finish button, it resets the data 
- (IBAction)submitData:(id)sender{

    // Ask the App delegate to send the data
	GSCDAppDelegate *myAppDelegate = [[UIApplication sharedApplication] delegate];

    [myAppDelegate submitInquiryToServer];
	
	[myAppDelegate restartForm];

}

// this action is attached to the edit button and tell the appadelaget to keep the data for edit
- (IBAction)previousView:(id)sender{
    [self.delegate closeDisplay];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
