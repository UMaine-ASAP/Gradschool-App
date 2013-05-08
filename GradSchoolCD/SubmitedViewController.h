//
//  SubmitedViewController.h
//  GradSchoolCD
//
//  Created by Mike Botieri on 5/8/13.
//  Copyright (c) 2013 UMO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubmitedViewController : UIViewController
{

    IBOutlet UIButton *visitGradSite;

}
- (IBAction)unwindToSubmitScreen:(UIStoryboardSegue *)segue;
@end
