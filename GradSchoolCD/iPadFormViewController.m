//
//  GSCDEntryScreen.m
//  GradSchoolCD
//
//  Created by Will Hofacker on 11/27/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import "iPadFormViewController.h"

enum {
    anticipatedTermFall,
    anticipatedTermSpring,
    anticipatedTermSummer
} anticipatedTermValue;


@implementation iPadFormViewController {
    UITextField *name;
    IBOutlet UITextView *textView;
    IBOutlet UIScrollView *scroller;
    IBOutlet UILabel *year;
    NSMutableArray *selections;
    
    IBOutlet GSCDSelectionBox *boxOne;
    IBOutlet iPadReviewViewController *infoPage;
    
    
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


- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.


    [self registerForKeyboardNotifications];
	originalCenter = self.view.center;
	isKeyboardUp = false;
    
	// Get a pointer to the current data object
    appDelegate = [[UIApplication sharedApplication] delegate];
	_currentInquiry = appDelegate.currentInquiry;
    
    // creates the scroll view to display all the information
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(768, 1950)];
    
    // creates the box that contains the programs
    [boxOne setScrollEnabled:true];
	
	//Pass data
    [boxOne instatiate:_currentInquiry];
    [boxOne setContentSize:CGSizeMake(boxOne.frame.size.width, [boxOne getheight])];
    [boxOne drawlabels];
    
    //reset Data
    [self resetDataAndDisplay];
	
}


/**
 * Completely resets the inquiry data and the display
 */
-(void) resetDataAndDisplay
{
    [_currentInquiry resetValues];
    [self resetAnticipatedYear];
	[self updateViewWithData];
    

}

-(void)resetAnticipatedYear
{
    //resets anticipated year
    CFGregorianDate currentDate = CFAbsoluteTimeGetGregorianDate(CFAbsoluteTimeGetCurrent(), CFTimeZoneCopySystem());
    int intYear = currentDate.year;
    NSString *resetYear = [NSString stringWithFormat:@"%d",intYear];
    [year setText:resetYear];
}


# pragma mark - Adjust Keyboard

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    activeField = textField;
   
    
}

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


- (void)textViewDidBeginEditing:(UITextView *)textView
{
    activeView = textView;
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    activeView = nil;
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
    if (activeField.frame.origin.y > yPosition + 950 - kbSize.height || activeView.frame.origin.y > yPosition + 950 - kbSize.height ) {
        
    
        
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


/** why is this here? */
-(void)scrollViewWillBeginDraggin:(UIScrollView *)scrollView{
    [scrollView resignFirstResponder];
    [scroller resignFirstResponder];
}

/** why is this here? */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	[activeField resignFirstResponder];
	[textView resignFirstResponder];
	[scroller resignFirstResponder];	
}

// gets called when the anticapated year value changes, tell the data object trhough the app delagate
- (IBAction)updateAnticipatedYear:(UIStepper *)sender{
    CFGregorianDate currentDate = CFAbsoluteTimeGetGregorianDate(CFAbsoluteTimeGetCurrent(), CFTimeZoneCopySystem());
    int intYear = currentDate.year;
    int value = [sender value];
    value = intYear+value;
    NSString *valueText = [NSString stringWithFormat:@"%d",value];
    [year setText:valueText];
	
	self.currentInquiry.anticipatedYear = [year text];
}

// gets called when then one of the anticapted semester buttons is pressed, changes that value
- (IBAction)semesterSelect:(UISegmentedControl *)sender{
	_currentInquiry.anticipatedTerm = [sender titleForSegmentAtIndex:sender.selectedSegmentIndex];
}


// this event is called when the next button is pressed
- (IBAction)gotoReviewScreen:(id)sender {
	// @TODO: Save all data just in case we missed something
	if ([_currentInquiry requiredFieldsComplete]) {
		// Data is complete!
		
		// Open review page
		[self performSegueWithIdentifier:@"openReview" sender:self];
	} else {
		// Missing Data!

		// @TODO: Show which fields are missing
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Data" message:@"You Must Enter All Required fields" delegate: self cancelButtonTitle:@"Close" otherButtonTitles: nil];
        [alert show];
	}
	
}

-(void) closeDisplay
{
    [self dismissModalViewControllerAnimated:true];
}
    
// Places all data after edit is pressed in the ViewControllerDisplay so it can be changed
- (void) updateViewWithData
{
	Name.text         = _currentInquiry.name;
	BirthDate.text    = _currentInquiry.dateOfBirth;
	PhoneNum.text     = _currentInquiry.phoneNumber;
	Email.text        = _currentInquiry.email;
	Street.text       = _currentInquiry.street;
	AptNum.text       = _currentInquiry.aptNumber;
	Zip.text          = _currentInquiry.zip;
	City.text         = _currentInquiry.city;
	Country.text      = _currentInquiry.country;
	Intstitution.text = _currentInquiry.undergraduateInstitution;
	Major.text        = _currentInquiry.undergraduateMajor;
	Other.text        = _currentInquiry.otherProgram;
    State.text        = _currentInquiry.state;
    


	if ([_currentInquiry.anticipatedTerm isEqualToString:@"Fall"]) {
        [anticipatedTerm setSelectedSegmentIndex:anticipatedTermFall];
	} else if ([_currentInquiry.anticipatedTerm isEqualToString:@"Spring"]) {
        [anticipatedTerm setSelectedSegmentIndex:anticipatedTermSpring];
	} else if ([_currentInquiry.anticipatedTerm isEqualToString:@"Summer"]) {
        [anticipatedTerm setSelectedSegmentIndex:anticipatedTermSummer];
	} else {
       [anticipatedTerm setSelectedSegmentIndex:-1];
    }
	
	// @TODO: Which is this one?
    //textView.text = ;
    year.text = _currentInquiry.anticipatedYear;

}


- (IBAction)unwindFromDisplayToEntryScreenSubmit:(UIStoryboardSegue *)segue {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thank You!" message:@"Your information has been submitted!"delegate: self cancelButtonTitle:@"Close" otherButtonTitles: nil];
    [alert show];
    
    //scrolls to top
    [scroller scrollRectToVisible:CGRectMake(0, 0, 768, 1024) animated:NO];
    
	[self resetDataAndDisplay];
    
    //resets selection box
    [boxOne reset];

}


/**
 * Shift to review view
 */
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if( [segue.identifier isEqualToString:@"openReview"] ) {
        iPadReviewViewController* gsdcDisplay = (iPadReviewViewController *) [segue destinationViewController];
        gsdcDisplay.delegate = self;
    }
    
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return NO;
    }
}



@end