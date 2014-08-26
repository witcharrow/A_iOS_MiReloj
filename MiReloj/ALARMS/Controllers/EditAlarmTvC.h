//
//  EditAlarmTvC.h
//  MiReloj
//
//  Created by Alejandro on 21/08/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AudioToolbox/AudioToolbox.h"

@class Alarm;

@interface EditAlarmTVC : UITableViewController

@property (nonatomic,strong) IBOutlet UITextField *nameAlarm;
@property (nonatomic,strong) NSString *textNameAlarm;
@property (nonatomic,strong) NSString *textNameAlarmToShow;
@property (nonatomic,strong) IBOutlet UITextField *hhAlarm;
@property (nonatomic,strong) IBOutlet UITextField *mmAlarm;
@property (nonatomic,strong) NSString *textHHAlarm;
@property (nonatomic,strong) NSString *textMMAlarm;
@property (nonatomic,strong) NSString *hhmmAlarmToShow;
@property (nonatomic,strong) NSString *hhmmAlarmToParse;
@property (nonatomic,strong) IBOutlet UILabel *amPM;
@property (nonatomic,strong) IBOutlet UISwitch *activatedSwitch;
@property (nonatomic,strong) IBOutlet UISwitch *vibrationSwitch;
@property (nonatomic,strong) NSString *vibrationStatus;
@property (nonatomic,strong) IBOutlet UILabel *vibrationCellText;
@property (nonatomic,strong) NSString *soundName;


@property (nonatomic,strong) Alarm *alarm;

-(IBAction)alarmDataChanged:(id)sender;
-(IBAction)ReturnKeyButton:(id)sender;


/*Para la vibracion*/
-(IBAction)Vibrate;


@end
