//
//  iPhoneGradPlansViewController.m
//  GradSchoolCD
//
//  Created by Mike Botieri on 5/3/13.
//  Copyright (c) 2013 UMO. All rights reserved.
//

#import "iPhoneGradPlansViewController.h"

@interface iPhoneGradPlansViewController ()

@end

@implementation iPhoneGradPlansViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 // gets called when the anticapated year value changes, tell the data object trhough the app delagate
- (IBAction)updateAnticipatedYear:(id)sender {
    CFGregorianDate currentDate = CFAbsoluteTimeGetGregorianDate(CFAbsoluteTimeGetCurrent(), CFTimeZoneCopySystem());
    int intYear = currentDate.year;
    int value = [sender value];
    value = intYear+value;
    NSString *valueText = [NSString stringWithFormat:@"%d",value];
    [year setText:valueText];
	
	self.currentInquiry.anticipatedYear = [year text];
}
 */

@end
