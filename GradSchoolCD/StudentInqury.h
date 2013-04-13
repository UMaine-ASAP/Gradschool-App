//
//  StudentInqury.h
//  GradSchoolCD
//
//  Created by Will Hofacker on 12/4/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface StudentInqury : NSManagedObject

@property (nonatomic) Boolean isCompleted;


/* Basic Information */

@property (nonatomic, retain) NSString * name; // Required
@property (nonatomic, retain) NSString * dateOfBirth;
@property (nonatomic, retain) NSString * phoneNum; // Required
@property (nonatomic, retain) NSString * email; // Required


/* Mailing */

@property (nonatomic, retain) NSString * street; // Required
@property (nonatomic, retain) NSString * aptNum;
@property (nonatomic, retain) NSString * zip; // Required
@property (nonatomic, retain) NSString * city; // Required
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * country;


/* Undergraduate Program */

@property (nonatomic, retain) NSString * insitution; // Required
@property (nonatomic, retain) NSString * major; // Required


/* Program Information */

@property (nonatomic, retain) NSString * anticipatedTerm; // Required
@property (nonatomic, retain) NSString * anticipatedYear; // Required
@property (nonatomic, retain) NSString * programsIntrestedIn; // Required
@property (nonatomic, retain) NSString * otherProgram;
@property (nonatomic, retain) NSString * findOutAbout;


/**
 * Checks whether all required fields have correct values
 *
 * @return BOOL indicating if all required fields are set or not
 */
-(BOOL) isComplete;

@end
