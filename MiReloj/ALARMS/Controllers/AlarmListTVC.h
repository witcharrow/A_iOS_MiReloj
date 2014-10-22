//
//  AlarmListTVC.h
//  MiReloj
//
//  Created by Alejandro on 18/08/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"

@interface AlarmListTVC : UITableViewController{
    sqlite3 *alarmsDB;
    NSString *alarmsDatabasePath;
}

@property (nonatomic,strong)  NSMutableArray *alarms;

@property (strong, nonatomic) NSString *statusDB;

@property (strong, nonatomic) NSString *alarmToParse;
@property (strong, nonatomic) NSString *nameAlarm;
@property (strong, nonatomic) NSString *hour;
@property (strong, nonatomic) NSString *minute;
@property (strong, nonatomic) NSString *soundAlarm;
/*TODO para seguir...*/
@property (strong, nonatomic) NSString *soundAlarmPath;

-(IBAction)editButtonPressed:(id)sender;

@end
