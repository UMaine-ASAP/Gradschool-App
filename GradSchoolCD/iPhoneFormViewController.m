//
//  iPhoneFormViewController.m
//  GradSchoolCD
//
//  Created by Mike Botieri on 4/29/13.
//  Copyright (c) 2013 UMO. All rights reserved.
//

#import "iPhoneFormViewController.h"
#import "SelectStateTableViewController.h"
#import "SelectCountryTableViewController.h"

#define kAnticipatedYearPickerTag 1
#define kAnticipatedTermPickerTag 2

@interface iPhoneFormViewController ()

@end

@implementation iPhoneFormViewController{
    UITextField *name;
    IBOutlet UITextView *textView;
    IBOutlet UIScrollView *scroller;
    IBOutlet UILabel *year;
    NSMutableArray *selections;

    IBOutlet iPhoneFormViewController *infoPage;


    __weak IBOutlet UISegmentedControl *anticipatedTerm;


    // all the textfeilds
    IBOutlet UITextField *Name;
    //IBOutlet UITextField *BirthDate;
    IBOutletCollection(UIDatePicker) NSArray *BirthDate;
    IBOutlet UITextField *PhoneNum;
    IBOutlet UITextField *Email;
    IBOutlet UITextField *Street;
    IBOutlet UITextField *AptNum;
    IBOutlet UITextField *Zip;
    IBOutlet UITextField *City;
    IBOutlet UITextField *State;
    //IBOutlet UITextField *Country;
    IBOutletCollection(UIPickerView) NSArray *Country;
    IBOutlet UITextField *Intstitution;
    IBOutlet UITextField *Major;
    IBOutlet UITextField *Other;
    CGPoint originalCenter;
    UITextField *activeField;
    UITextView *activeView;

    // Helper variables
    bool isKeyboardUp;
    CGPoint origin;
    CGPoint scrollPoint;

    GSCDAppDelegate *appDelegate;
    
    // Picker options
    NSMutableArray *availableYears;
    NSMutableArray *availableTerms;
    
    // Modal views
    SelectStateTableViewController *sstvc;
    SelectCountryTableViewController *sctvc;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    switch (thePickerView.tag) {
        case kAnticipatedYearPickerTag:
            return [availableYears count];
            break;
        case kAnticipatedTermPickerTag:
            return [availableTerms count];
            break;
        default:
            return 0;
            break;
    }
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    switch (thePickerView.tag) {
        case kAnticipatedYearPickerTag:
            return [availableYears objectAtIndex:row];
            break;
        case kAnticipatedTermPickerTag:
            return [availableTerms objectAtIndex:row];
            break;
        default:
            return @"";
            break;
    }
}
// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}



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
    availableYears = [[NSMutableArray alloc] init];
    availableTerms = [[NSMutableArray alloc] initWithObjects:@"Fall", @"Spring", @"Summer", nil];

    CFGregorianDate currentDate = CFAbsoluteTimeGetGregorianDate(CFAbsoluteTimeGetCurrent(), CFTimeZoneCopySystem());
    int currentYear = currentDate.year;
    for (int i=0; i<5; i++) {
        [availableYears addObject:[NSString stringWithFormat:@"%i", currentYear+i]];
    }

    
    sstvc = nil;
    sctvc = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) closeModalView
{
    // close state
    if(sstvc != nil) {
        [sstvc dismissViewControllerAnimated:YES completion:^{
        sstvc = nil;
        }];
    }
    // close country
    if(sctvc != nil) {
        [sctvc dismissViewControllerAnimated:YES completion:^{
            sctvc = nil;
        }];
    }

}

-(IBAction)unwindToIphoneMainScreen:(UIStoryboardSegue *)segue{
    
}

- (IBAction)openSelectStateModal:(id)sender {
    UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"iPhoneStoryboard"
                                                  bundle:nil];
    sstvc = [sb instantiateViewControllerWithIdentifier:@"selectState"];
    
    sstvc.delegate = self;
    [[self navigationController] presentViewController:sstvc animated:YES completion:^{
    }];
}

- (IBAction)openSelectCountryModal:(id)sender {
    UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"iPhoneStoryboard"
                                                  bundle:nil];
    sctvc = [sb instantiateViewControllerWithIdentifier:@"selectCountry"];
    
    sctvc.delegate = self;
    [[self navigationController] presentViewController:sctvc animated:YES completion:^{
    }];

}

@end
