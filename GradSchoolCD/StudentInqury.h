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

@property (nonatomic, retain) NSString * anticipatedTerm;
@property (nonatomic, retain) NSString * anticipatedYear;
@property (nonatomic, retain) NSString * aptNum;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSString * dateOfBirth;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * findOutAbout;
@property (nonatomic, retain) NSString * insitution;
@property (nonatomic, retain) NSString * major;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * otherProgram;
@property (nonatomic, retain) NSString * phoneNum;
@property (nonatomic, retain) NSString * programsIntrestedIn;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * street;
@property (nonatomic, retain) NSString * zip;

@end
