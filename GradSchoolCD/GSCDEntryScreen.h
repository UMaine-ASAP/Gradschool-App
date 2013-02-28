//
//  GSCDEntryScreen.h
//  GradSchoolCD
//
//  Created by Will Hofacker on 11/27/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GSCDSelectionBox.h"
#import "GSCDDisplay.h"

@interface GSCDEntryScreen : UIViewController{
    UITextField *name;
    IBOutlet UITextView *textView;
    IBOutlet UIScrollView *scroller;
    IBOutlet UILabel *year;
    NSMutableArray *selections;
    NSMutableArray *textViews;
    
    IBOutlet GSCDSelectionBox *boxOne;
    IBOutlet GSCDDisplay *infoPage;
    
    IBOutlet UIButton *fall;
    IBOutlet UIButton *spring;
    IBOutlet UIButton *summer;
    
    IBOutlet UIButton *fakeButton;
    
    // all the textfeilds
    IBOutlet UITextField *Name;
    IBOutlet UITextField *BrithDate;
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
}
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
@end
