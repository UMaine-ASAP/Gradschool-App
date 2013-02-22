//
//  GSCDDisplay.m
//  GradSchoolCD
//
//  Created by Will Hofacker on 11/27/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import "GSCDDisplay.h"
#import "GSCDAppDelegate.h"
#import "StudentInqury.h"
#import "GSCDEntryScreen.h"

@implementation GSCDDisplay
@synthesize managedObjectContext;
@synthesize studentInquries;

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
    [self placeInfo];
}

// gets the data and places it in next to the right label
-(void)placeInfo{
    GSCDAppDelegate *MyappDelegate = [[UIApplication sharedApplication] delegate];
    NSMutableArray *temp = [MyappDelegate passback];
    name.text = [NSString stringWithFormat:@"Name: %@", [temp objectAtIndex:0]];
    birthDate.text = [NSString stringWithFormat:@"Birth Date: %@", [temp objectAtIndex:1]];
    phoneNum.text = [NSString stringWithFormat:@"Phone Number: %@", [temp objectAtIndex:2]];
    emailAdress.text = [NSString stringWithFormat:@"Email Address: %@", [temp objectAtIndex:3]];
    street.text = [NSString stringWithFormat:@"Street: %@", [temp objectAtIndex:4]];
    aptNum.text = [NSString stringWithFormat:@"Apt#: %@", [temp objectAtIndex:5]];
    zip.text = [NSString stringWithFormat:@"Postal Code: %@", [temp objectAtIndex:6]];
    city.text = [NSString stringWithFormat:@"City: %@", [temp objectAtIndex:7]];
    state.text = [NSString stringWithFormat:@"State: %@", [temp objectAtIndex:8]];
    country.text = [NSString stringWithFormat:@"Country: %@", [temp objectAtIndex:9]];
    institution.text = [NSString stringWithFormat:@"Institution: %@", [temp objectAtIndex:10]];
    major.text = [NSString stringWithFormat:@"Major: %@", [temp objectAtIndex:11]];
    entryTerm.text = [NSString stringWithFormat:@"Anticipated Entry Term: %@", [temp objectAtIndex:13]];
    anticipatedYear.text = [NSString stringWithFormat:@"Anticipated Year: %@", [temp objectAtIndex:15]];
    NSLog(@"%@", [temp objectAtIndex:16]);
}

// this button is attached to the finish button, it resets the data 
- (IBAction)cleardata:(id)sender{
    GSCDAppDelegate *MyappDelegate = [[UIApplication sharedApplication] delegate];
    [MyappDelegate setNew:TRUE];
    [MyappDelegate setMessageDisplay:TRUE];
    [MyappDelegate placeInfoInCoreData];

}

// this action is attached to the edit button and tell the appadelaget to keep the data for edit
- (IBAction)keepData:(id)sender{
    GSCDAppDelegate *MyappDelegate = [[UIApplication sharedApplication] delegate];
    [MyappDelegate setNew:FALSE];

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
