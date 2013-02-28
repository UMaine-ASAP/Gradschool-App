//
//  GSCDData.m
//  GradSchoolCD
//
//  Created by Will Hofacker on 11/27/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import "GSCDData.h"

@implementation GSCDData

// this method is called to setup the data object, also is called to rest it
- (void) instantiate:(UIButton *)b{
    hiddenNext = b;
    hiddenNext.hidden = FALSE;
    InfoCorrect = FALSE;
    programsFinal = [[NSMutableArray alloc]init];
    numOftextfields = 17;
    numeRequiredfields = 10;
    numOfprograms = 81;
    
//Adding year to this file as string "valueText"
    CFGregorianDate currentDate = CFAbsoluteTimeGetGregorianDate(CFAbsoluteTimeGetCurrent(), CFTimeZoneCopySystem());
    int intYear = currentDate.year;
    //int value = [sender value];
    int value = intYear;//+value-1;
    NSString *valueText = [NSString stringWithFormat:@"%d",value];
    for (int i = 0; i<numOftextfields; i++){
        if (i!=15){
            AllData[i] = [NSString stringWithFormat:@""];
        }
        else {
            AllData[i] = [NSString stringWithFormat:@"%d"]; //fill in year for it to automatically show up
        }
    }
    for (int i = 0; i<numOfprograms; i++){
        programs[i] = [NSString stringWithFormat:@""];
    }
    
    // all the required fields
    required[0] = 0;
    required[1] = 2;
    required[2] = 3;
    required[3] = 4;
    required[4] = 6;
    required[5] = 7;
    required[6] = 10;
    required[7] = 11;
    required[8] = 13;
    required[9] = 15;
    }



// the name of this is missleading, it resets the object not for starting over, but for editing
- (void)reset:(UIButton *)b{
    hiddenNext = b;
    hiddenNext.hidden = FALSE;
    InfoCorrect = FALSE;
    [self display];
    
    // all the required fields
    required[0] = 0;
    required[1] = 2;
    required[2] = 3;
    required[3] = 4;
    required[4] = 6;
    required[5] = 7;
    required[6] = 10;
    required[7] = 11;
    required[8] = 13;
    required[9] = 15;
}

// called by the appdelagte to put information in the "AllData"
- (void) AddData:(int)tag:(NSString *)info{
    AllData[tag] = info;
    [self display];
}

// checks to see if all the required feilds have been filled in
- (void) display{
    Boolean allrequired = TRUE;
    Boolean aProgram = FALSE;
    
    for (int i=0; i<numOfprograms; i++) {
        if (programs[i] != [NSString stringWithFormat:@""]){
            aProgram = TRUE;
        }
    }
    
    for (int i=0; i<numeRequiredfields; i++){
        if (AllData[required[i]] == [NSString stringWithFormat:@""]){
            allrequired = FALSE;
        }
    }
    
    if ((allrequired) && (aProgram)){
        InfoCorrect = TRUE;
        hiddenNext.hidden = TRUE;
    }
    else {
        InfoCorrect = FALSE;
        hiddenNext.hidden = FALSE;
    }
}

// gets a program and adds it to the total programs array
- (void) addProgram:(int)pos :(NSString *)program{
    programs[pos] = program;
    [self display];
}

// places all the data(not programs) into a mutable array and sends it to the object that calls for it
- (NSMutableArray *) getData{
    NSMutableArray *temp = [[NSMutableArray alloc]init];
    for (int i = 0; i<numOftextfields; i++){
        [temp addObject:AllData[i]];
        if (i == 16){
            NSLog(@"%@", AllData[16]);
        }
    }
    return temp;
}

// places all the programs into a program list and sends it to the object that calls it
- (NSMutableArray *) getProgramPlaces{
    NSMutableArray *temp = [[NSMutableArray alloc]init];
    for (int i = 0; i<numOfprograms; i++){
        [temp addObject:programs[i]];
    }
    return temp;
}

// can be called to see if all the required feilds are filled in
- (Boolean) isOk{
    return InfoCorrect;
}

// gets the program at the given index in th program array
- (NSString *)getProgram:(int)pos{
    return programs[pos];
}

- (NSString *)getListPrograms{
    NSString *combined = [NSString stringWithFormat:@""];
    for (int i = 0; i<numOfprograms; i++){
        if (programs[i] != [NSString stringWithFormat:@""]){
            combined = [NSString stringWithFormat:@"%@,%@", combined, programs[i]];
        }
    }
    return combined;
}

@end
