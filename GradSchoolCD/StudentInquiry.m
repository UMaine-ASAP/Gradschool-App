//
//  StudentInqury.m
//  GradSchoolCD
//
//  Created by Will Hofacker on 12/4/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import "StudentInquiry.h"


@implementation StudentInquiry

@dynamic isCompleted;
@dynamic isSent;

@dynamic name;
@dynamic dateOfBirth;
@dynamic phoneNumber;
@dynamic email;

@dynamic street;
@dynamic aptNumber;
@dynamic zip;
@dynamic city;
@dynamic state;
@dynamic country;

@dynamic undergraduateInstitution;
@dynamic undergraduateMajor;

@dynamic anticipatedTerm;
@dynamic anticipatedYear;
@dynamic programsInterestedIn;
@dynamic otherProgram;
@dynamic howLearnedAboutUMaine;


-(id) init
{
    if( self = [super init])
    {
        [self resetValues];
    }
    return self;
}

-(void) resetValues
{
	self.isCompleted = NO;
	self.isSent      = NO;
	
	self.name        = @"";
	self.dateOfBirth = @"";
	self.phoneNumber = @"";
	self.email       = @"";
	
	self.street    = @"";
	self.aptNumber = @"";
	self.zip       = @"";
	self.city      = @"";
	self.state     = @"";
	self.country   = @"";
	
	self.undergraduateInstitution = @"";
	self.undergraduateMajor       = @"";
	
	self.anticipatedTerm       = @"";
	self.anticipatedYear       = @"";
	self.programsInterestedIn  = [StudentInquiry archiveArray:[NSMutableArray arrayWithObjects:nil]];
	self.otherProgram          = @"";
	self.howLearnedAboutUMaine = @"";
}


-(BOOL) requiredFieldsComplete
{
	
	if ( ! [self checkFilledIn:self.name]
        || ! [self checkFilledIn:self.email]
        || ! [self checkFilledIn:self.street]
        || ! [self checkFilledIn:self.zip]
        || ! [self checkFilledIn:self.city]
        || ! [self checkFilledIn:self.undergraduateInstitution]
        || ! [self checkFilledIn:self.undergraduateMajor]
        || ! [self checkFilledIn:self.anticipatedTerm]
        || ! [self checkFilledIn:self.anticipatedYear]
        ) {
		return NO;
	}
	
	// Check if a program exists
	if([self.programsInterestedIn isEqualToData:
		[StudentInquiry archiveArray:[NSMutableArray arrayWithObjects:nil]]]) {
		return NO;
	}
	return YES;
}

-(BOOL) checkFilledIn:(NSString *)text
{
    return text != nil && ! [text isEqualToString:@""];
}


# pragma mark - Managing Interested Programs

-(void) addProgram:(NSString *)program
{
	// Get array from data
	NSMutableArray *programs = [self programs];

	// Add program only if it is unique
	if( [programs indexOfObject:program] == NSNotFound)
	{
		[programs addObject:program];
	}
	
	// save changes
	self.programsInterestedIn = [StudentInquiry archiveArray:programs];
}

-(NSMutableArray *) programs
{
    if  (self.programsInterestedIn == nil) {
        return [[NSMutableArray alloc] init];
    }
	return [StudentInquiry unarchiveArray:self.programsInterestedIn];
}


# pragma mark - NSData to NSMutableArray Conversions

+(NSMutableArray *) unarchiveArray:(NSData *)data {
	return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

+(NSData *) archiveArray:(NSMutableArray *)array {
	return [NSKeyedArchiver archivedDataWithRootObject:array];
}
		
		
@end
