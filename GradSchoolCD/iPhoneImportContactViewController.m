//
//  iPhoneImportContactViewController.m
//  GradSchoolCD
//
//  Created by Mike Botieri on 5/6/13.
//  Copyright (c) 2013 UMO. All rights reserved.
//

#import "iPhoneImportContactViewController.h"
#import "Person.h"
#import <AddressBook/AddressBook.h>

@interface iPhoneImportContactViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *contactData;

@end

@implementation iPhoneImportContactViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Contacts";
    
    self.contactData = [[NSMutableArray alloc] init];
    
    [self getPersonOutOfAddressBook];
}

- (void)getPersonOutOfAddressBook
{
    CFErrorRef error = NULL;
    
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, &error);
    
    if (addressBook != nil)
    {
        NSLog(@"Succesful.");
        
        NSArray *allContacts = (__bridge_transfer NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBook);
        
        NSUInteger i = 0;
        for (i = 0; i < [allContacts count]; i++)
        {
            Person *person = [[Person alloc] init];
            
            ABRecordRef contactPerson = (__bridge ABRecordRef)allContacts[i];
            
            //name
            NSString *firstName = (__bridge_transfer NSString *)ABRecordCopyValue(contactPerson, kABPersonFirstNameProperty);
            NSString *lastName =  (__bridge_transfer NSString *)ABRecordCopyValue(contactPerson, kABPersonLastNameProperty);
            NSString *fullName = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
            
            person.fullName = fullName;
            
            //email
            ABMultiValueRef emails = ABRecordCopyValue(contactPerson, kABPersonEmailProperty);
            
            NSUInteger j = 0;
            for (j = 0; j < ABMultiValueGetCount(emails); j++)
            {
                NSString *email = (__bridge_transfer NSString *)ABMultiValueCopyValueAtIndex(emails, j);
                if (j == 0)
                {
                    person.homeEmail = email;
                    NSLog(@"person.homeEmail = %@ ", person.homeEmail);
                }
                
                else if (j==1)
                    person.homeEmail = email;
            }
            
            //address
            NSString *homeStreetName = (__bridge_transfer NSString *)ABRecordCopyValue(contactPerson, kABPersonAddressStreetKey);
            person.homeStreetName = homeStreetName;
            //NSString *homeStreetName = (__bridge_transfer NSString *)ABRecordCopyValue(contactPerson, kABPersonAddressStreetKey);
            //person.homeStreetName = homeStreetName;
            NSString *city = (__bridge_transfer NSString *)ABRecordCopyValue(contactPerson, kABPersonAddressCityKey);
            person.city = city;
            NSString *state = (__bridge_transfer NSString *)ABRecordCopyValue(contactPerson, kABPersonAddressStateKey);
            person.state = state;
            NSString *zip = (__bridge_transfer NSString *)ABRecordCopyValue(contactPerson, kABPersonAddressZIPKey);
            person.zip = zip;
            NSString *country = (__bridge_transfer NSString *)ABRecordCopyValue(contactPerson, kABPersonAddressCountryKey);
            person.country = country;
            
            //phone
            NSString *phone = (__bridge_transfer NSString *)ABRecordCopyValue(contactPerson, kABPersonPhoneIPhoneLabel);
            person.phone = phone;
            
            //DoB
            NSString *birthDate = (__bridge_transfer NSString *)ABRecordCopyValue(contactPerson, kABPersonBirthdayProperty);
            person.birthDate = birthDate;
            
            [self.contactData addObject:person];
        }
    }
    
    CFRelease(addressBook);
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
