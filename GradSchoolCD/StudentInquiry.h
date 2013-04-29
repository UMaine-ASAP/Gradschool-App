//
//  StudentInqury.h
//  GradSchoolCD
//
//  Created by Will Hofacker on 12/4/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface StudentInquiry : NSManagedObject

@property (nonatomic) Boolean isCompleted;
@property (nonatomic) Boolean isSent;

/* Basic Information */

@property (nonatomic, retain) NSString * name; // Required
@property (nonatomic, retain) NSString * dateOfBirth;
@property (nonatomic, retain) NSString * phoneNumber; // Required
@property (nonatomic, retain) NSString * email; // Required


/* Mailing */

@property (nonatomic, retain) NSString * street; // Required
@property (nonatomic, retain) NSString * aptNumber;
@property (nonatomic, retain) NSString * zip; // Required
@property (nonatomic, retain) NSString * city; // Required
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * country;


/* Undergraduate Program */

@property (nonatomic, retain) NSString * undergraduateInstitution; // Required
@property (nonatomic, retain) NSString * undergraduateMajor; // Required


/* Program Information */

@property (nonatomic, retain) NSString * anticipatedTerm; // Required
@property (nonatomic, retain) NSString * anticipatedYear; // Required

// Programs Interested In is a binary data object referencing an NSMutableArray. You don't use this directly, rather use addProgram and programs
@property (nonatomic, retain) NSData * programsInterestedIn; // Required
@property (nonatomic, retain) NSString * otherProgram;
@property (nonatomic, retain) NSString * howLearnedAboutUMaine;


/**
 * Resets all field values to their default states
 */
-(void) resetValues;

/**
 * Checks whether all required fields have correct values
 *
 * @return BOOL indicating if all required fields are set or not
 */
-(BOOL) requiredFieldsComplete;

/**
 * Inserts a new program into programsInterestedIn
 */
-(void) addProgram:(NSString *)program;

/**
 * Gets all programs interested in
 */
-(NSMutableArray *) programs;





@end
