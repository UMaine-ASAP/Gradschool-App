//
//  GSCDData.h
//  GradSchoolCD
//
//  Created by Will Hofacker on 11/27/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSCDData : NSObject{
    int numOftextfields;
    NSString *AllData[17];
    int numOfprograms;
    NSString *programs[81];
    NSMutableArray *programsFinal;
    int numeRequiredfields;
    int required[10];
    Boolean InfoCorrect;
    UIButton *hiddenNext;
}

- (void) instantiate:(UIButton *)b;
- (void) reset:(UIButton *)b;
- (void) AddData:(int)tag:(NSString *)info;
- (void) checkRequiredFields;
- (void) addProgram:(int)pos:(NSString *)program;
- (NSMutableArray *) getData;
- (NSMutableArray *) getProgramPlaces;
- (NSString *) getProgram:(int)pos;
- (Boolean)isOk;
- (NSString *)getListPrograms;
- (void) clearData;

@end
