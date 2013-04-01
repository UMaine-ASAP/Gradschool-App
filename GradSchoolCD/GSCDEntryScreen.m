//
//  GSCDEntryScreen.m
//  GradSchoolCD
//
//  Created by Will Hofacker on 11/27/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import "GSCDEntryScreen.h"
#import "GSCDAppDelegate.h"

@implementation GSCDEntryScreen
@synthesize managedObjectContext;

bool isKeyboardUp = false;
CGPoint origin;
CGPoint scrollPoint;

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    activeField = textField;
   
     
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    activeField = nil;
  
}


- (void)textViewDidBeginEditing:(UITextView *)textView
{
    activeView = textView;
    
    
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    activeView = nil;
}
-(void)scrollViewWillBeginDraggin:(UIScrollView *)scrollView{
    [scrollView resignFirstResponder];
    [scroller resignFirstResponder];
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	[activeField resignFirstResponder];
	[textView resignFirstResponder];
	[scroller resignFirstResponder];	
}

- (void)viewDidLoad
{
    [self registerForKeyboardNotifications ];
	originalCenter = self.view.center;
    
    GSCDAppDelegate *MyappDelegate = [[UIApplication sharedApplication] delegate];
    
    //makes an array with all the textviews
    textViews = [[NSMutableArray alloc]init];
    [textViews addObject:Name];
    [textViews addObject:BrithDate];
    [textViews addObject:PhoneNum];
    [textViews addObject:Email];
    [textViews addObject:Street];
    [textViews addObject:AptNum];
    [textViews addObject:Zip];
    [textViews addObject:City];
    [textViews addObject:State];
    [textViews addObject:Country];
    [textViews addObject:Intstitution];
    [textViews addObject:Major];
    [textViews addObject:Other];
    

    [MyappDelegate getButton:fakeButton];
    [self fillIn];
    
    // creates the scroll view to display all the information
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(768, 1950)];
    
    // creates the box that contains the programs
    [boxOne setScrollEnabled:true];
    [boxOne instatiate:[MyappDelegate getData]];
    [boxOne setContentSize:CGSizeMake(boxOne.frame.size.width, [boxOne getheight])];
    [boxOne drawlabels];
    
    //resets anticipated year
    [self resetAnticipatedYear];

    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


// gets the information from a textfeild and sends it to the data object through the app delagate
- (IBAction)getInfo:(id)sender{
    name = (UITextField *)sender;
    GSCDAppDelegate *MyappDelegate = [[UIApplication sharedApplication] delegate];
    [MyappDelegate passThrought:name.tag:[NSString stringWithFormat:@"%@",[name text]]];
}

// gets called when the anticapated year value cahnges, tell the data object trhough the app delagate
- (IBAction)valueChange:(UIStepper *)sender{
    CFGregorianDate currentDate = CFAbsoluteTimeGetGregorianDate(CFAbsoluteTimeGetCurrent(), CFTimeZoneCopySystem());
    int intYear = currentDate.year;
    int value = [sender value];
    value = intYear+value;
    NSString *valueText = [NSString stringWithFormat:@"%d",value];
    [year setText:valueText];
    GSCDAppDelegate *MyappDelegate = [[UIApplication sharedApplication] delegate];
    [MyappDelegate passThrought:sender.tag:[NSString stringWithFormat:@"%@",[year text]]];
}

// gets called when then one of the anticapted semester buttons is pressed, changes that value
- (IBAction)semesterSelect:(UIButton *)sender{
    GSCDAppDelegate *MyappDelegate = [[UIApplication sharedApplication] delegate];
    if (sender == fall){
        [self performSelector:@selector(doHighlight:) withObject:fall afterDelay:0];
        [spring setHighlighted:NO];
        [summer setHighlighted:NO];
        [MyappDelegate passThrought:13:[NSString stringWithFormat:@"Fall"]];
    }
    if (sender == spring){
        [fall setHighlighted:NO];
        [self performSelector:@selector(doHighlight:) withObject:spring afterDelay:0];
        [summer setHighlighted:NO];
        [MyappDelegate passThrought:13:[NSString stringWithFormat:@"Spring"]];
    }
    if (sender == summer){
        [fall setHighlighted:NO];
        [spring setHighlighted:NO];
        [self performSelector:@selector(doHighlight:) withObject:summer afterDelay:0];
        [MyappDelegate passThrought:13:[NSString stringWithFormat:@"Summer"]];
    }
}

// this function is called to keep the last anticapated button highlighted
- (void)doHighlight:(UIButton*)b {
    [b setHighlighted:YES];
}

// this event is called when the next button is pressed, also sets the textview's value in the data object
- (IBAction)display:(id)sender{
    GSCDAppDelegate *MyappDelegate = [[UIApplication sharedApplication] delegate];
    [MyappDelegate passThrought:14:[NSString stringWithFormat:@"%@",[textView text]]];
}

// This button is placed over the real next button until all required feilds are entered, tells you what to do
- (IBAction)fakeButton:(id)sender{
    GSCDAppDelegate *MyappDelegate = [[UIApplication sharedApplication] delegate];
    if (![MyappDelegate OK]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"You Must Enter All Required fields"delegate: self cancelButtonTitle:@"Close" otherButtonTitles: nil];
        [alert show];}
    //[MyappDelegate logCoreData];

}

-(void) closeDisplay
{
    [self dismissModalViewControllerAnimated:true];
}
    
// Places all data after edit is pressed in the ViewControllerDisplay so it can be changed
- (void)fillIn{
    GSCDAppDelegate *MyappDelegate = [[UIApplication sharedApplication] delegate];
    NSMutableArray *temp = [MyappDelegate passback];
    for (int i = 0; i<textViews.count; i++){
        UITextField *tempText = [textViews objectAtIndex:i];
        tempText.text = [temp objectAtIndex:i];
    }
    textView.text = [temp objectAtIndex:14];
    year.text = [temp objectAtIndex:15];
}


- (IBAction)unwindFromDisplayToEntryScreenSubmit:(UIStoryboardSegue *)segue {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thank You!" message:@"Your information has been submitted!"delegate: self cancelButtonTitle:@"Close" otherButtonTitles: nil];
    [alert show];
    GSCDAppDelegate *MyappDelegate = [[UIApplication sharedApplication] delegate];
    [MyappDelegate setNew:TRUE];
    
    //scrolls to top
    [scroller scrollRectToVisible:CGRectMake(0, 0, 768, 1024) animated:NO];
    
    // reset text in textfields
    Name.text = @"";
    BrithDate.text = @"";
    PhoneNum.text = @"";
    Email.text = @"";
    Street.text = @"";
    AptNum.text = @"";
    Zip.text = @"";
    City.text = @"";
    State.text = @"";
    Country.text = @"";
    Intstitution.text = @"";
    Major.text = @"";
    Other.text = @"";
    textView.text = @"";
    [fall setHighlighted:NO];
    [spring setHighlighted:NO];
    [summer setHighlighted:NO];
    
    //resets data entered
    [MyappDelegate clearData];
    
    //resets anticipated year
    [self resetAnticipatedYear];
    
    //resets selection box
    [boxOne reset];

}

-(void)resetAnticipatedYear
{
    //resets anticipated year
    CFGregorianDate currentDate = CFAbsoluteTimeGetGregorianDate(CFAbsoluteTimeGetCurrent(), CFTimeZoneCopySystem());
    int intYear = currentDate.year;
    NSString *resetYear = [NSString stringWithFormat:@"%d",intYear];
    [year setText:resetYear];
}

- (IBAction)unwindFromDisplayToEntryScreenEdit:(UIStoryboardSegue *)segue {

}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if( [segue.identifier isEqualToString:@"openDisplay"] ) {
        GSCDDisplay* gsdcDisplay = (GSCDDisplay *) [segue destinationViewController];
        gsdcDisplay.delegate = self;
    }
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
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