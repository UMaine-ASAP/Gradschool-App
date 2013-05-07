//
//  iPhoneFormViewController.m
//  GradSchoolCD
//
//  Created by Mike Botieri on 4/29/13.
//  Copyright (c) 2013 UMO. All rights reserved.
//

#import "iPhoneFormViewController.h"

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
    NSMutableArray *availableYears;
    NSMutableArray *availableTerms;

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

- (IBAction)updateAnticipatedYear:(UIStepper *)sender{
    CFGregorianDate currentDate = CFAbsoluteTimeGetGregorianDate(CFAbsoluteTimeGetCurrent(), CFTimeZoneCopySystem());
    int intYear = currentDate.year;
    int value = [sender value];
    value = intYear+value;
    NSString *valueText = [NSString stringWithFormat:@"%d",value];
    [year setText:valueText];
	
	//self.currentInquiry.anticipatedYear = [year text];
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

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification {
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
	float yPosition = scroller.contentOffset.y;
    if (activeField.frame.origin.y > yPosition + 216 - kbSize.height || activeView.frame.origin.y > yPosition + 216 - kbSize.height ) {
        
        
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.25];
        self.view.center = CGPointMake(originalCenter.x, originalCenter.y - kbSize.height);
        [UIView commitAnimations];
        return;
        
    }
}
// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
	self.view.center = originalCenter;
    [UIView commitAnimations];
}


/** Hide keyboard when dragging */
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [scrollView resignFirstResponder];
	[activeField resignFirstResponder];
	[textView resignFirstResponder];
    [scroller resignFirstResponder];
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)unwindToIphoneMainScreen:(UIStoryboardSegue *)segue{
    
}

@end
