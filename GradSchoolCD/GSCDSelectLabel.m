//
//  GSCDSelectLabel.m
//  GradSchoolCD
//
//  Created by Will Hofacker on 11/27/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import "GSCDSelectLabel.h"

@implementation GSCDSelectLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// is called when created
- (void) instatiate{
    selected = FALSE;
}

// is called when tapped (selectionbox calls this)
- (void) wasTapped{
    if (selected){
        self.backgroundColor = [UIColor whiteColor];
        selected = FALSE;
    }
    else {
        self.backgroundColor = [[UIColor alloc]initWithRed:(216/255.0) green:(211/255.0) blue:(199/255.0) alpha:1];
        selected = TRUE;
    }
}

// returns whether or not it is highlighted
-(Boolean)isHightlighted{
    return selected;
}

@end
