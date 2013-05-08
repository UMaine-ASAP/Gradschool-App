//
//  iPhoneFormViewController.m
//  GradSchoolCD
//
//  Created by Mike Botieri on 4/29/13.
//  Copyright (c) 2013 UMO. All rights reserved.
//

#import "iPhoneFormViewController.h"

#define kAnticipatedYearPickerTag 1
#define kAnticipatedTermPickerTag 2
#define kStatePickerTag 3
#define kCountryPickerTag 4

@interface iPhoneFormViewController ()

@end

@implementation iPhoneFormViewController{
    UITextField *name;
    IBOutlet UITextView *textView;
    IBOutlet UIScrollView *scroller;
    IBOutlet UILabel *year;
    NSMutableArray *selections;

    IBOutlet iPhoneFormViewController *infoPage;


    __weak IBOutlet UISegmentedControl *anticipatedTerm;


    // all the textfeilds
    IBOutlet UITextField *Name;
    IBOutlet UITextField *BirthDate;
    IBOutlet UITextField *PhoneNum;
    IBOutlet UITextField *Email;
    IBOutlet UITextField *Street;
    IBOutlet UITextField *AptNum;
    IBOutlet UITextField *Zip;
    IBOutlet UITextField *City;
    IBOutlet UITextField *State;
    IBOutlet UITextField *Country;
    IBOutlet UITextField *Intstitution;
    IBOutlet UITextField *Major;
    IBOutlet UITextField *Other;
    CGPoint originalCenter;
    UITextField *activeField;
    UITextView *activeView;

    // Helper variables
    bool isKeyboardUp;
    CGPoint origin;
    CGPoint scrollPoint;

    GSCDAppDelegate *appDelegate;
    
    // Picker options
    NSMutableArray *availableYears;
    NSMutableArray *availableTerms;
    NSArray *availableStates;
    NSArray *availableCountries;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    switch (thePickerView.tag) {
        case kAnticipatedYearPickerTag:
            return [availableYears count];
            break;
        case kAnticipatedTermPickerTag:
            return [availableTerms count];
            break;
        case kStatePickerTag:
            return [availableStates count];
            break;
        case kCountryPickerTag:
            return [availableCountries count];
            break;
        default:
            return 0;
            break;
    }
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    switch (thePickerView.tag) {
        case kAnticipatedYearPickerTag:
            return [availableYears objectAtIndex:row];
            break;
        case kAnticipatedTermPickerTag:
            return [availableTerms objectAtIndex:row];
            break;
        case kStatePickerTag:
            return [availableStates objectAtIndex:row];
            break;
        case kCountryPickerTag:
            return [availableCountries objectAtIndex:row];
            break;
        default:
            return @"";
            break;
    }
}
// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    availableYears = [[NSMutableArray alloc] init];
    availableTerms = [[NSMutableArray alloc] initWithObjects:@"Fall", @"Spring", @"Summer", nil];

    CFGregorianDate currentDate = CFAbsoluteTimeGetGregorianDate(CFAbsoluteTimeGetCurrent(), CFTimeZoneCopySystem());
    int currentYear = currentDate.year;
    for (int i=0; i<5; i++) {
        [availableYears addObject:[NSString stringWithFormat:@"%i", currentYear+i]];
    }
    
    // Set available states
    availableStates = [[NSArray alloc] initWithObjects: @"N/A", @"Alabama", @"Alaska", @"Arizona", @"Arkansas", @"California", @"Colorado", @"Connecticut", @"District of Columbia", @"Delaware", @"Florida", @"Georgia", @"Hawaii", @"Idaho", @"Illinois", @"Indiana", @"Iowa", @"Kansas", @"Kentucky", @"Louisiana", @"Maine", @"Maryland", @"Massachusetts", @"Michigan", @"Minnesota", @"Mississippi", @"Missouri", @"Montana", @"Nebraska", @"Nevada", @"New Hampshire", @"New Jersey", @"New Mexico", @"New York", @"North Carolina", @"North Dakota", @"Ohio", @"Oklahoma", @"Oregon", @"Pennsylvania", @"Rhode Island", @"South Carolina", @"South Dakota", @"Tennessee", @"Texas", @"Utah", @"Vermont", @"Virginia", @"Washington", @"West Virginia", @"Wisconsin", @"Wyoming", @"Alberta", @"British Columbia", @"Manitoba", @"New Brunswick", @"Newfoundland and Labrador", @"Nova Scotia", @"Ontario", @"Prince Edward Island", @"Quebec", @"Saskatchewan", @"Northwest Territories", @"Nunavut", @"Yukon", nil];
    availableCountries = [[NSArray alloc] initWithObjects: @"United States", @"Afghanistan", @"Aland Islands", @"Albania", @"Algeria", @"American Samoa", @"Andorra", @"Angola", @"Anguilla", @"Antarctica", @"Antigua and Barbuda", @"Argentina", @"Armenia", @"Aruba", @"Australia", @"Austria", @"Azerbaijan", @"Bahamas", @"Bahrain", @"Bangladesh", @"Barbados", @"Belarus", @"Belgium", @"Belize", @"Benin", @"Bermuda", @"Bhutan", @"Bolivia", @"Bosnia and Herzegovina", @"Botswana", @"Bouvet Island", @"Brazil", @"British Indian Ocean Territory", @"Brunei Darussalam", @"Bulgaria", @"Burkina Faso", @"Burundi", @"Cambodia", @"Cameroon", @"Canada", @"Cape Verde", @"Cayman Islands", @"Central African Republic", @"Chad", @"Chile", @"China", @"Christmas Island", @"Cocos (Keeling) Islands", @"Colombia", @"Comoros", @"Congo", @"Cook Islands", @"Costa Rica", @"Cote D`Ivoire", @"Croatia", @"Cuba", @"Cyprus", @"Czech Republic", @"Denmark", @"Djibouti", @"Dominica", @"Dominican Republic", @"East Timor", @"Ecuador", @"Egypt", @"El Salvador", @"Equatorial Guinea", @"Eritrea", @"Estonia", @"Ethiopia", @"Falkland Islands (Malvinas)", @"Faroe Islands", @"Fiji", @"Finland", @"Fmr Yugoslav Rep of Macedonia", @"France", @"French Guiana", @"French Polynesia", @"French Southern Territories", @"Gabon", @"Gambia", @"Georgia", @"Germany", @"Ghana", @"Gibraltar", @"Greece", @"Greenland", @"Grenada", @"Guadeloupe", @"Guam", @"Guatemala", @"Guernsey", @"Guinea-Bissau", @"Guinea", @"Guyana", @"Haiti", @"Heard and McDonald Islands", @"Holy See (Vatican City State)", @"Honduras", @"Hong Kong", @"Hungary", @"Iceland", @"India", @"Indonesia", @"Iran (Islamic Republic Of)", @"Iraq", @"Ireland", @"Isle of Man", @"Israel", @"Italy", @"Jamaica", @"Japan", @"Jersey", @"Jordan", @"Kazakhstan", @"Kenya", @"Kiribati", @"Lao People's Democratic Republic", @"Korea Republic of", @"Kosovo", @"Kuwait", @"Kyrgyzstan", @"Korea Democratic People's Republic", @"Latvia", @"Lebanon", @"Lesotho", @"Liberia", @"Libyan Arab Jamahiriya", @"Liechtenstein", @"Lithuania", @"Luxembourg", @"Macao", @"Madagascar", @"Malawi", @"Malaysia", @"Maldives", @"Mali", @"Malta", @"Marshall Islands", @"Martinique", @"Mauritania", @"Mauritius", @"Mayotte", @"Mexico", @"Micronesia Federated States", @"Moldova Republic of", @"Monaco", @"Mongolia", @"Montserrat", @"Morocco", @"Mozambique", @"Myanmar", @"Namibia", @"Nauru", @"Nepal", @"Netherlands Antilles", @"Netherlands", @"New Caledonia", @"New Zealand", @"Nicaragua", @"Niger", @"Nigeria", @"Niue", @"Norfolk Island", @"Northern Mariana Islands", @"Norway", @"Oman", @"Pakistan", @"Palau", @"Palestinian Territory Occupie", @"Panama", @"Papua New Guinea", @"Paraguay", @"Peru", @"Philippines", @"Pitcairn", @"Poland", @"Portugal", @"Puerto Rico", @"Qatar", @"Republic of Montenegro", @"Republic of Serbia", @"Reunion", @"Romania", @"Russian Federation", @"Rwanda", @"Saint Barthelemy", @"Saint Helena", @"Saint Kitts and Nevis", @"Saint Lucia", @"Saint Martin", @"Saint Pierre and Miquelon", @"Samoa", @"San Marino", @"Sao Tome and Principe", @"Saudi Arabia", @"Senegal", @"Serbia and Montenegro", @"Seychelles", @"Sierra Leone", @"Singapore", @"Slovakia", @"Slovenia", @"Solomon Islands", @"Somalia", @"South Africa", @"Spain", @"Sri Lanka", @"St Vincent and the Grenadines", @"South Georgia & South Sandwich Islands", @"Sudan", @"Suriname", @"Svalbard and Jan Mayen", @"Swaziland", @"Sweden", @"Switzerland", @"Syrian Arab Republic", @"Taiwan Province of China", @"Tajikistan", @"Tanzania United Republic of", @"Thailand", @"Togo", @"Tokelau", @"Tonga", @"Trinidad and Tobago", @"Tunisia", @"Turkey", @"Turkmenistan", @"Turks and Caicos Islands", @"Tuvalu", @"Uganda", @"Ukraine", @"United Arab Emirates", @"United Kingdom", @"United States", @"Uruguay", @"US Minor Outlying Islands", @"Uzbekistan", @"Vanuatu", @"Venezuela", @"Viet Nam", @"Virgin Islands (British)", @"Virgin Islands (U.S.)", @"Wallis and Futuna Islands", @"Western Sahara", @"Yemen", @"Yugoslavia", @"Zambia", @"Zimbabwe", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)unwindToIphoneMainScreen:(UIStoryboardSegue *)segue{
    
}

@end
