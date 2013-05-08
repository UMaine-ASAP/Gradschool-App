//
//  TwitterViewController.m
//  GradSchoolCD
//
//  Created by Mike Botieri on 5/8/13.
//  Copyright (c) 2013 UMO. All rights reserved.
//

#import "TwitterViewController.h"

@interface TwitterViewController ()

@end

@implementation TwitterViewController

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
    
    NSURL *twitterSite = [NSURL URLWithString:@"https://mobile.twitter.com/UMAINEGRADSKL/"];
    NSURLRequest *twitterSiteRequest = [NSURLRequest requestWithURL:twitterSite];
    [twitterWebView loadRequest: twitterSiteRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
