//
//  FacebookViewController.m
//  GradSchoolCD
//
//  Created by Mike Botieri on 5/8/13.
//  Copyright (c) 2013 UMO. All rights reserved.
//

#import "FacebookViewController.h"

@interface FacebookViewController ()

@end

@implementation FacebookViewController

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
    
    NSURL *facebookSite = [NSURL URLWithString:@"http://m.facebook.com/UMGradSchool/"];
    NSURLRequest *facebookSiteRequest = [NSURLRequest requestWithURL:facebookSite];
    [facebookWebView loadRequest: facebookSiteRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
