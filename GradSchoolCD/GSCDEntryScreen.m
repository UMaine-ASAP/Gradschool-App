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


- (void)viewDidLoad
{
    
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
    
    //intializes the data through the appdelagte
    if ([MyappDelegate displayMessage] == TRUE){
        [MyappDelegate setMessageDisplay:FALSE];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"IT WORKED!!!!" message:@"We should change what it says here"delegate: self cancelButtonTitle:@"Close" otherButtonTitles: nil];
        [alert show];
    }
    [MyappDelegate getButton:fakeButton];
    [self fillIn];
    
    // creates the scroll view to display all the information
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(768, 2164)];
    
    // creates the box that contains the programs
    [boxOne setScrollEnabled:true];
    [boxOne instatiate:[MyappDelegate getData]];
    [boxOne setContentSize:CGSizeMake(boxOne.frame.size.width, [boxOne getheight])];
    [boxOne drawlabels];
    
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
    double value = [sender value];
    value = intYear+value;
    [year setText:[NSString stringWithFormat:@"%d", (int)value]];
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
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Uh..." message:@"You Must Enter All Required fields"delegate: self cancelButtonTitle:@"Close" otherButtonTitles: nil];
        [alert show];
    }
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
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    // do something
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
