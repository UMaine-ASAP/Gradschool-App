//
//  WebsiteViewController.m
//  GradSchoolCD
//
//  Created by Mike Botieri on 5/8/13.
//  Copyright (c) 2013 UMO. All rights reserved.
//

#import "WebsiteViewController.h"

@interface WebsiteViewController ()

@end

@implementation WebsiteViewController

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
	
    NSURL *gradschoolsite = [NSURL URLWithString:@"http://www.umaine.edu/graduate/"];
    NSURLRequest *gradschoolsiteRequest = [NSURLRequest requestWithURL:gradschoolsite];
    [gradschoolWebView loadRequest: gradschoolsiteRequest];
    
                             
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
