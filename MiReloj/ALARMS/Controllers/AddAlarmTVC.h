//
//  AddAlarmTVC.h
//  MiReloj
//
//  Created by Alejandro on 19/08/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AlarmListTVC;
@interface AddAlarmTVC : UITableViewController

-(IBAction)cancelButtonPressed:(id)sender;
-(IBAction)doneButtonPressed:(id)sender;

@property (nonatomic,strong) IBOutlet UITextField *nameAlarm;

@property (nonatomic,strong) AlarmListTVC *alarmListViewController;

@end
