//
//  GSCDSender.h
//  GradSchoolCD
//
//  Created by Will Hofacker on 12/7/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentInqury.h"

/**
 * Sends 
 *
 */
@interface URLManager : NSObject

// sends the data from the core data to the URL also tells if it was sucessful
+ (BOOL) sendToURL:(NSString *)url withData:(StudentInqury *)inquiry;

@end
