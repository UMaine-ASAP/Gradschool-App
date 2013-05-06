//
//  iPhoneFormViewController.m
//  GradSchoolCD
//
//  Created by Mike Botieri on 4/29/13.
//  Copyright (c) 2013 UMO. All rights reserved.
//

#import "iPhoneFormViewController.h"

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
    IBOutlet UITextField *BirthDate;
    IBOutlet UITextField *PhoneNum;
    IBOutlet UITextField *Email;
    IBOutlet UITextField *Street;
    IBOutlet UITextField *AptNum;
    IBOutlet UITextField *Zip;
    IBOutlet UITextField *City;
    IBOutlet UITextField *State;
    IBOutlet UITextField *Country;
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
}
/*
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    activeField = nil;
	
	// Save changes
	// @TODO: maybe use tag or map tag to keyName?
	//[_currentInquiry setValue:textField.text forKey:textField];
    if(textField == Name) {
        _currentInquiry.name = textField.text;
    } else if (textField == BirthDate) {
        _currentInquiry.dateOfBirth = textField.text;
    } else if (textField == PhoneNum) {
        _currentInquiry.phoneNumber = textField.text;
    } else if (textField == Email) {
        _currentInquiry.email = textField.text;
    } else if (textField == Street) {
        _currentInquiry.street = textField.text;
    } else if (textField == AptNum) {
        _currentInquiry.aptNumber = textField.text;
    } else if (textField == Zip) {
        _currentInquiry.zip = textField.text;
    } else if (textField == City) {
        _currentInquiry.city = textField.text;
    } else if (textField == State) {
        _currentInquiry.state = textField.text;
    } else if (textField == Country) {
        _currentInquiry.country = textField.text;
    } else if (textField == Intstitution) {
        _currentInquiry.undergraduateInstitution = textField.text;
    } else if (textField == Major) {
        _currentInquiry.undergraduateMajor = textField.text;
    } else if (textField == Other) {
        _currentInquiry.otherProgram = textField.text;
    }
    
}
*/
- (IBAction)updateAnticipatedYear:(UIStepper *)sender{
    CFGregorianDate currentDate = CFAbsoluteTimeGetGregorianDate(CFAbsoluteTimeGetCurrent(), CFTimeZoneCopySystem());
    int intYear = currentDate.year;
    int value = [sender value];
    value = intYear+value;
    NSString *valueText = [NSString stringWithFormat:@"%d",value];
    [year setText:valueText];
	
	//self.currentInquiry.anticipatedYear = [year text];
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)unwindToIphoneMainScreen:(UIStoryboardSegue *)segue{
    
}

@end
