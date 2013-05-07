//
//  iPhoneProgramsTableViewController.m
//  GradSchoolCD
//
//  Created by Mike Botieri on 4/29/13.
//  Copyright (c) 2013 UMO. All rights reserved.
//

#import "iPhoneProgramsTableViewController.h"

@interface iPhoneProgramsTableViewController ()

@end

@implementation iPhoneProgramsTableViewController {
    NSMutableArray *programs;
    NSMutableArray *sectionTitles;
    NSMutableArray *organizeProgramsIntoSections;
    
    NSMutableArray *selectedPrograms; // user selected indices into programs array
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIAlertView *addPrograms = [[UIAlertView alloc] initWithTitle:@"Program Selection"
                                                         message:@"Please select the programs you're interested in. You may select as many as you like."
                                                        delegate:nil
                                               cancelButtonTitle:@"Okay"
                                                otherButtonTitles: nil];
    [addPrograms show];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    programs = [[NSMutableArray alloc]init];
    [programs addObject:@"Animal Sciences"];
    [programs addObject:@"Anthropology and Environmental Policy"];
    [programs addObject:@"Biochemistry and Molecular Biology"];
    [programs addObject:@"Bioinformatics (PSM)"];
    [programs addObject:@"Biological Engineering"];
    [programs addObject:@"Biological Science"];
    [programs addObject:@"Botany & Plant Pathology"];
    [programs addObject:@"Business Administration"];
    [programs addObject:@"Business & Engineering (PSM)"];
    [programs addObject:@"Chemical Engineering"];
    [programs addObject:@"Chemistry"];
    [programs addObject:@"Civil Engineering"];
    [programs addObject:@"Clinical Psychology"];
    [programs addObject:@"Communication Sciences & Disorders"];
    [programs addObject:@"Communication"];
    [programs addObject:@"Computer Engineering"];
    [programs addObject:@"Computer Science"];
    [programs addObject:@"Counselor Education"];
    [programs addObject:@"Curriculum and Instruction"];
    [programs addObject:@"Digital Curation"];
    [programs addObject:@"Earth Sciences"];
    [programs addObject:@"Ecology & Environmental Science"];
    [programs addObject:@"Economics"];
    [programs addObject:@"Educational Leadership"];
    [programs addObject:@"Electrical & Computer Engineering"];
    [programs addObject:@"Elementary Education"];
    [programs addObject:@"Engineering Physics"];
    [programs addObject:@"English"];
    [programs addObject:@"Entomology"];
    [programs addObject:@"Financial Economics"];
    [programs addObject:@"Food & Nutrition Science"];
    [programs addObject:@"Forest Resources"];
    [programs addObject:@"Forestry"];
    [programs addObject:@"French"];
    [programs addObject:@"Functional Genomics"];
    [programs addObject:@"Geographic Information Systems"];
    [programs addObject:@"Higher Education"];
    [programs addObject:@"History"];
    [programs addObject:@"Horticulture"];
    [programs addObject:@"Human Development"];
    [programs addObject:@"Individualized in Education"];
    [programs addObject:@"Information Systems"];
    [programs addObject:@"Innovation Engineering"];
    [programs addObject:@"Innovative Communication Design (ICD)"];
    [programs addObject:@"Instructional Technology"];
    [programs addObject:@"Interdisciplinary"];
    [programs addObject:@"Intermedia"];
    [programs addObject:@"Kinesiology & Physical Education"];
    [programs addObject:@"Liberal Studies"];
    [programs addObject:@"Literacy Education"];
    [programs addObject:@"Marine Bio-Resources"];
    [programs addObject:@"Marine Biology"];
    [programs addObject:@"Marine Policy"];
    [programs addObject:@"Mathematics"];
    [programs addObject:@"Mechanical Engineering"];
    [programs addObject:@"Microbiology"];
    [programs addObject:@"Music Education"];
    [programs addObject:@"Music Performance"];
    [programs addObject:@"Nursing"];
    [programs addObject:@"Oceanography"];
    [programs addObject:@"Physics"];
    [programs addObject:@"Plant Science"];
    [programs addObject:@"Plant, Soil & Environmental Science"];
    [programs addObject:@"Psychology"];
    [programs addObject:@"Quaternary & Climate Studies"];
    [programs addObject:@"Resource Economics & Policy"];
    [programs addObject:@"Response to Intervention for Behavior"];
    [programs addObject:@"Science Education"];
    [programs addObject:@"Secondary Education"];
    [programs addObject:@"Social Studies Education"];
    [programs addObject:@"Social Work"];
    [programs addObject:@"Spanish"];
    [programs addObject:@"Spatial Information Science & Engineering"];
    [programs addObject:@"Special Education"];
    [programs addObject:@"MS in Teaching Science & Mathematics"];
    [programs addObject:@"Wildlife Conservation"];
    [programs addObject:@"Wildlife Ecology"];
    [programs addObject:@"Zoology"];
    [programs addObject:@"Other Department"];

    
    // Get section titles (the start letter of each program)
    sectionTitles = [[NSMutableArray alloc] init];
    for (NSString *program in programs) {
        NSString *letter = [program substringToIndex:1];
        if( ! [sectionTitles containsObject:letter] )
        {
            [sectionTitles addObject:letter];
        }
    }
    
    // Organize programs into sections
    organizeProgramsIntoSections = [[NSMutableArray alloc] init];

    // Create a section for each letter
    for (NSString *letter in sectionTitles)
    {
        NSMutableArray *programsInSection = [[NSMutableArray alloc] init];
    
        // Find the programs with the given letter
        for (NSString *program in programs)
        {
            // Check if the program matches
            if( [letter isEqualToString:[program substringToIndex:1]] )
            {
                [programsInSection addObject:program];
            }
        }
        
        // Add programs to list
        [organizeProgramsIntoSections addObject:programsInSection];

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

// Return the number of sections.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [sectionTitles count];
}

// Return the number of rows in the section.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[organizeProgramsIntoSections objectAtIndex:section] count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [[organizeProgramsIntoSections objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    return cell;
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
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [sectionTitles objectAtIndex:section];
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    // Go through programs and get
    return sectionTitles;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return index;
}
-(IBAction)unwindToIphoneTableScreen:(UIStoryboardSegue *)segue{
    
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    // Add program to selected programs
    // keep previous rows highlighted
    [selectedPrograms addObject:[NSNumber numberWithInt:indexPath.row]];
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
        [selectedPrograms removeObjectAtIndex:[NSNumber numberWithInt:indexPath.row]];
}

@end
