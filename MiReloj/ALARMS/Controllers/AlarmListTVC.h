//
//  AlarmListTVC.h
//  MiReloj
//
//  Created by Alejandro on 18/08/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlarmListTVC : UITableViewController

@property (nonatomic,strong) NSMutableArray *alarms;

-(IBAction)editButtonPressed:(id)sender;

@end
