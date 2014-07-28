//
//  EditAlarmaTableViewController.h
//  MiReloj
//
//  Created by user11394 on 01/05/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Alarm;
@interface EditAlarmaTableViewController : UITableViewController

@property (nonatomic, strong) IBOutlet UITextField *nameField;
@property (nonatomic, strong) IBOutlet UISwitch *vibrationSwitch;
@property (nonatomic, strong) Alarm *alarm;

- (IBAction)alarmDataChanged:(id)sender;

@end
