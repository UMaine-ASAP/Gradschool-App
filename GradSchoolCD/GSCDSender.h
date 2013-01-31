//
//  GSCDSender.h
//  GradSchoolCD
//
//  Created by Will Hofacker on 12/7/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentInqury.h"

@interface GSCDSender : NSObject

- (Boolean) sendToURl:(StudentInqury *)inquiry;
- (NSString *)urlEncodeValue:(NSString *)str;
- (NSString *)createPost:(StudentInqury *)inquiry;

@end
