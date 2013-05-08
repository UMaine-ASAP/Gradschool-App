//
//  AlphabeticalTableViewController.h
//  GradSchoolCD
//
//  Created by Tim Westbaker on 5/7/13.
//  Copyright (c) 2013 UMO. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AlphabeticalTableViewControllerDelegate <NSObject>
    @required
    -(void)closeModalView;
@end


@interface AlphabeticalTableViewController : UIViewController <UITableViewDataSource> {
    @protected
    NSMutableArray *items;
    NSMutableArray *sectionTitles;
    NSMutableArray *organizeItemsIntoSections;

}

@property id<AlphabeticalTableViewControllerDelegate> delegate;


@end
