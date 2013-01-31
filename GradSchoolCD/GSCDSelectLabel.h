//
//  GSCDSelectLabel.h
//  GradSchoolCD
//
//  Created by Will Hofacker on 11/27/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GSCDSelectLabel : UILabel{
    Boolean selected;
}

- (void)instatiate;
- (void)wasTapped;
- (Boolean)isHightlighted;

@end
