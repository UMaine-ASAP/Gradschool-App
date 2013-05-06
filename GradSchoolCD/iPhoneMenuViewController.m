//
//  iPhoneMenuViewController.m
//  GradSchoolCD
//
//  Created by Mike Botieri on 5/6/13.
//  Copyright (c) 2013 UMO. All rights reserved.
//

#import "iPhoneMenuViewController.h"

@interface iPhoneMenuViewController ()

@end

@implementation iPhoneMenuViewController

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
    UIAlertView *addContact = [[UIAlertView alloc] initWithTitle:@"Import Contact?"
                                                         message:@"Would you like to import your contact from the Contacts App?"
                                                        delegate:nil
                                               cancelButtonTitle:@"No thanks"
                                               otherButtonTitles:@"Yes", nil];
    [addContact show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
