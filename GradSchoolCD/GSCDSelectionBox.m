//
//  GSCDSelectionBox.m
//  GradSchoolCD
//
//  Created by Will Hofacker on 11/27/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import "GSCDSelectionBox.h"
#import "GSCDSelectLabel.h"
#import <QuartzCore/QuartzCore.h>

@implementation GSCDSelectionBox

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // not start up;
    }
    return self;
}

- (void) instatiate:(GSCDData *)mainData{
    Alldata = mainData;

    // all the programs in a list
    strings = [[NSMutableArray alloc]init];
    [strings addObject:@"Animal Sciences"];
    [strings addObject:@"Anthropology and Environmental Policy"];
    [strings addObject:@"Biochemistry and Molecular Biology"];
    [strings addObject:@"Bioinformatics (PSM)"];
    [strings addObject:@"Biological Engineering"];
    [strings addObject:@"Biological Science"];
    [strings addObject:@"Botany & Plant Pathology"];
    [strings addObject:@"Business Administration"];
    [strings addObject:@"Business & Engineering (PSM)"];
    [strings addObject:@"Chemical Engineering"];
    [strings addObject:@"Chemistry"];
    [strings addObject:@"Civil Engineering"];
    [strings addObject:@"Clinical Psychology"];
    [strings addObject:@"Communication Sciences & Disorders"];
    [strings addObject:@"Communication"];
    [strings addObject:@"Computer Engineering"];
    [strings addObject:@"Computer Science"];
    [strings addObject:@"Counselor Education"];
    [strings addObject:@"Curriculum and Instruction"];
    [strings addObject:@"Digital Curation"];
    [strings addObject:@"Earth Sciences"];
    [strings addObject:@"Ecology & Environmental Science"];
    [strings addObject:@"Economics"];
    [strings addObject:@"Educational Leadership"];
    [strings addObject:@"Electrical & Computer Engineering"];
    [strings addObject:@"Elementary Education"];
    [strings addObject:@"Engineering Physics"];
    [strings addObject:@"English"];
    [strings addObject:@"Entomology"];
    [strings addObject:@"Financial Economics"];
    [strings addObject:@"Food & Nutrition Science"];
    [strings addObject:@"Forest Resources"];
    [strings addObject:@"Forestry"];
    [strings addObject:@"French"];
    [strings addObject:@"Functional Genomics"];
    [strings addObject:@"Geographic Information Systems"];
    [strings addObject:@"Higher Education"];
    [strings addObject:@"History"];
    [strings addObject:@"Horticulture"];
    [strings addObject:@"Human Development"];
    [strings addObject:@"Individualized in Education"];
    [strings addObject:@"Information Systems"];
    [strings addObject:@"Innovation Engineering"];
    [strings addObject:@"Innovative Communication Design (ICD)"];
    [strings addObject:@"Instructional Technology"];
    [strings addObject:@"Interdisciplinary"];
    [strings addObject:@"Interdisciplinary"];
    [strings addObject:@"Kinesiology & Physical Education"];
    [strings addObject:@"Liberal Studies"];
    [strings addObject:@"Literacy Education"];
    [strings addObject:@"Marine Bio-Resources"];
    [strings addObject:@"Marine Biology"];
    [strings addObject:@"Marine Policy"];
    [strings addObject:@"Mathematics"];
    [strings addObject:@"Mechanical Engineering"];
    [strings addObject:@"Microbiology"];
    [strings addObject:@"Music Education"];
    [strings addObject:@"Music Performance"];
    [strings addObject:@"Nursing"];
    [strings addObject:@"Oceanography"];
    [strings addObject:@"Physics"];
    [strings addObject:@"Plant Science"];
    [strings addObject:@"Plant, Soil & Environmental Science"];
    [strings addObject:@"Psychology"];
    [strings addObject:@"Quaternary & Climate Studies"];
    [strings addObject:@"Resource Economics & Policy"];
    [strings addObject:@"Response to Intervention for Behavior"];
    [strings addObject:@"Science Education"];
    [strings addObject:@"Secondary Education"];
    [strings addObject:@"Social Studies Education"];
    [strings addObject:@"Social Work"];
    [strings addObject:@"Spanish"];
    [strings addObject:@"Spatial Information Science & Engineering"];
    [strings addObject:@"Special Education"];
    [strings addObject:@"MS in Teaching Science & Mathematics"];
    [strings addObject:@"Wildlife Conservation"];
    [strings addObject:@"Wildlife Ecology"];
    [strings addObject:@"Zoology"];
    [strings addObject:@"Other Department"];
    
    
    labels = [[NSMutableArray alloc]init];
    labelSize = 34;
    for (int i=0; i<strings.count;i++){
        GSCDSelectLabel *temp = [[GSCDSelectLabel alloc]initWithFrame:CGRectMake(0, labelSize*i, 636, labelSize)];
        [temp instatiate];
        temp.text = [strings objectAtIndex:i];
        temp.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:16];
        temp.textAlignment = UITextAlignmentCenter;
        temp.textColor = [[UIColor alloc]initWithRed:(27/255.0) green:(79/255.0) blue:(126/255.0) alpha:1];
        temp.layer.borderColor = [[UIColor alloc]initWithRed:(163/255.0) green:(187/255.0) blue:(193/255.0) alpha:1].CGColor;
        temp.layer.borderWidth = 1;
        temp.backgroundColor = [UIColor whiteColor];
        [labels addObject:temp];
    }
}

// when the selection box was touched it checks to see what label was touched and sets that labels state
- (IBAction)viewWasTouched:(UITapGestureRecognizer *)sender{
    for (int i=0; i<strings.count;i++){
        GSCDSelectLabel *temp = [labels objectAtIndex:i];
        if (sender.numberOfTouches == 1) {
            CGPoint touchPoint = [sender locationOfTouch:0 inView:temp];
            CGFloat touchX = touchPoint.x;
            CGFloat touchY = touchPoint.y;
            // is the touch in the bounds of the touchLabel?
            if (touchX >= 0 && touchY >= 0) {
                if (touchX <= temp.bounds.size.width && touchY <= temp.bounds.size.height) {
                    [temp wasTapped];
                }
            }
        }
        if ([temp isHightlighted]){
            [Alldata addProgram:i :[strings objectAtIndex:i]];
        }
        else {
            [Alldata addProgram:i :[NSString stringWithFormat:@""]];
        }
    }
}

// returns the size of the box required to fit all the labels into
- (double) getheight{
    return labelSize*strings.count;
    
}

// draws the labels into the scrollview/selction box
- (void) drawlabels{
    for (int i=0; i<strings.count;i++){
        GSCDSelectLabel *temp = [labels objectAtIndex:i];
        if ([Alldata getProgram:i] != [NSString stringWithFormat:@""]){
            [temp wasTapped];
        }
        [self addSubview:temp];
    }
}

@end
