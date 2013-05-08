//
//  SelectCountryTableViewController.m
//  GradSchoolCD
//
//  Created by Tim Westbaker on 5/8/13.
//  Copyright (c) 2013 UMO. All rights reserved.
//

#import "SelectCountryTableViewController.h"

@interface SelectCountryTableViewController ()

@end

@implementation SelectCountryTableViewController


- (void)viewDidLoad
{

        items = [[NSMutableArray alloc] initWithObjects: @"Afghanistan", @"Aland Islands", @"Albania", @"Algeria", @"American Samoa", @"Andorra", @"Angola", @"Anguilla", @"Antarctica", @"Antigua and Barbuda", @"Argentina", @"Armenia", @"Aruba", @"Australia", @"Austria", @"Azerbaijan", @"Bahamas", @"Bahrain", @"Bangladesh", @"Barbados", @"Belarus", @"Belgium", @"Belize", @"Benin", @"Bermuda", @"Bhutan", @"Bolivia", @"Bosnia and Herzegovina", @"Botswana", @"Bouvet Island", @"Brazil", @"British Indian Ocean Territory", @"Brunei Darussalam", @"Bulgaria", @"Burkina Faso", @"Burundi", @"Cambodia", @"Cameroon", @"Canada", @"Cape Verde", @"Cayman Islands", @"Central African Republic", @"Chad", @"Chile", @"China", @"Christmas Island", @"Cocos (Keeling) Islands", @"Colombia", @"Comoros", @"Congo", @"Cook Islands", @"Costa Rica", @"Cote D`Ivoire", @"Croatia", @"Cuba", @"Cyprus", @"Czech Republic", @"Denmark", @"Djibouti", @"Dominica", @"Dominican Republic", @"East Timor", @"Ecuador", @"Egypt", @"El Salvador", @"Equatorial Guinea", @"Eritrea", @"Estonia", @"Ethiopia", @"Falkland Islands (Malvinas)", @"Faroe Islands", @"Fiji", @"Finland", @"Fmr Yugoslav Rep of Macedonia", @"France", @"French Guiana", @"French Polynesia", @"French Southern Territories", @"Gabon", @"Gambia", @"Georgia", @"Germany", @"Ghana", @"Gibraltar", @"Greece", @"Greenland", @"Grenada", @"Guadeloupe", @"Guam", @"Guatemala", @"Guernsey", @"Guinea-Bissau", @"Guinea", @"Guyana", @"Haiti", @"Heard and McDonald Islands", @"Holy See (Vatican City State)", @"Honduras", @"Hong Kong", @"Hungary", @"Iceland", @"India", @"Indonesia", @"Iran (Islamic Republic Of)", @"Iraq", @"Ireland", @"Isle of Man", @"Israel", @"Italy", @"Jamaica", @"Japan", @"Jersey", @"Jordan", @"Kazakhstan", @"Kenya", @"Kiribati", @"Lao People's Democratic Republic", @"Korea Republic of", @"Kosovo", @"Kuwait", @"Kyrgyzstan", @"Korea Democratic People's Republic", @"Latvia", @"Lebanon", @"Lesotho", @"Liberia", @"Libyan Arab Jamahiriya", @"Liechtenstein", @"Lithuania", @"Luxembourg", @"Macao", @"Madagascar", @"Malawi", @"Malaysia", @"Maldives", @"Mali", @"Malta", @"Marshall Islands", @"Martinique", @"Mauritania", @"Mauritius", @"Mayotte", @"Mexico", @"Micronesia Federated States", @"Moldova Republic of", @"Monaco", @"Mongolia", @"Montserrat", @"Morocco", @"Mozambique", @"Myanmar", @"Namibia", @"Nauru", @"Nepal", @"Netherlands Antilles", @"Netherlands", @"New Caledonia", @"New Zealand", @"Nicaragua", @"Niger", @"Nigeria", @"Niue", @"Norfolk Island", @"Northern Mariana Islands", @"Norway", @"Oman", @"Pakistan", @"Palau", @"Palestinian Territory Occupie", @"Panama", @"Papua New Guinea", @"Paraguay", @"Peru", @"Philippines", @"Pitcairn", @"Poland", @"Portugal", @"Puerto Rico", @"Qatar", @"Republic of Montenegro", @"Republic of Serbia", @"Reunion", @"Romania", @"Russian Federation", @"Rwanda", @"Saint Barthelemy", @"Saint Helena", @"Saint Kitts and Nevis", @"Saint Lucia", @"Saint Martin", @"Saint Pierre and Miquelon", @"Samoa", @"San Marino", @"Sao Tome and Principe", @"Saudi Arabia", @"Senegal", @"Serbia and Montenegro", @"Seychelles", @"Sierra Leone", @"Singapore", @"Slovakia", @"Slovenia", @"Solomon Islands", @"Somalia", @"South Africa", @"Spain", @"Sri Lanka", @"St Vincent and the Grenadines", @"South Georgia & South Sandwich Islands", @"Sudan", @"Suriname", @"Svalbard and Jan Mayen", @"Swaziland", @"Sweden", @"Switzerland", @"Syrian Arab Republic", @"Taiwan Province of China", @"Tajikistan", @"Tanzania United Republic of", @"Thailand", @"Togo", @"Tokelau", @"Tonga", @"Trinidad and Tobago", @"Tunisia", @"Turkey", @"Turkmenistan", @"Turks and Caicos Islands", @"Tuvalu", @"Uganda", @"Ukraine", @"United Arab Emirates", @"United Kingdom", @"United States", @"Uruguay", @"US Minor Outlying Islands", @"Uzbekistan", @"Vanuatu", @"Venezuela", @"Viet Nam", @"Virgin Islands (British)", @"Virgin Islands (U.S.)", @"Wallis and Futuna Islands", @"Western Sahara", @"Yemen", @"Yugoslavia", @"Zambia", @"Zimbabwe", nil];
    [super viewDidLoad];
    [sectionTitles insertObject:@"" atIndex:0];
    [organizeItemsIntoSections insertObject:[[NSMutableArray alloc] initWithObjects:@"United States", @"Canada", nil] atIndex:0];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate closeModalView];
}


@end
