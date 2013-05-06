//
//  Person.h
//  GradSchoolCD
//
//  Created by Mike Botieri on 5/6/13.
//  Copyright (c) 2013 UMO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Person : UIViewController

@property (nonatomic, strong) Person *person;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *homeEmail;
@property (nonatomic, strong) NSString *homeStreetName;
@property (nonatomic, strong) NSString *homeApt;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *zip;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *birthDate;

- (id)initWithPerson:(Person *)person;

@end
