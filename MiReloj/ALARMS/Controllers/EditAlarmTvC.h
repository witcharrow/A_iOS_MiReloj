//
//  EditAlarmTvC.h
//  MiReloj
//
//  Created by Alejandro on 21/08/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Alarm;

@interface EditAlarmTVC : UITableViewController

@property (nonatomic,strong) IBOutlet UITextField *nameAlarm;
@property (nonatomic,strong) NSString *textNameAlarm;
@property (nonatomic,strong) IBOutlet UISwitch *activatedSwitch;
@property (nonatomic,strong) Alarm *alarm;

-(IBAction)alarmDataChanged:(id)sender;

@end
