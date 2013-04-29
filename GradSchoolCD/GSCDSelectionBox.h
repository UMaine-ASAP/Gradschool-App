//
//  GSCDSelectionBox.h
//  GradSchoolCD
//
//  Created by Will Hofacker on 11/27/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentInquiry.h"

@interface GSCDSelectionBox : UIScrollView{
    
    NSMutableArray *strings;
    NSMutableArray *labels;
    int labelSize;
	
	StudentInquiry *inquiry;
}

-(void) reset;
- (void) instatiate:(StudentInquiry *)anInquiry;
- (double)getheight;
- (void) drawlabels;
- (IBAction)viewWasTouched:(UITapGestureRecognizer *)sender;

@end
