//
//  AlarmNameTVC.h
//  MiReloj
//
//  Created by user11394 on 16/05/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AddAlarmDetailsTVC;
@interface AlarmNameTVC : UITableViewController

-(IBAction)doneButton:(id)sender;

@property (nonatomic, strong) IBOutlet UITextField *alarmName;
@property (nonatomic, strong) AddAlarmDetailsTVC *alarmTaskLlistVC;

@end
