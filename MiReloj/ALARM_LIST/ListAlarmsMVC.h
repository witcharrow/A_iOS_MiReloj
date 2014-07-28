//
//  MasterViewController.h
//  MiReloj
//
//  Created by user11394 on 27/04/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Alarm;

@interface ListAlarmsMVC : UITableViewController

@property (nonatomic,strong) NSMutableArray *alarms;

//Etiquetas para las celdas
@property (strong,nonatomic) IBOutlet UILabel *titleLabelHHMM;
@property (strong,nonatomic) IBOutlet UILabel *titleLabelName;
@property (nonatomic, strong) NSString *alarmaResultadoString;
@property (strong,nonatomic) IBOutlet UISwitch *activatedAlarm;

//Alarma
@property (nonatomic, strong) Alarm *alarm;

//Estado de los switch
@property (assign) BOOL userHasActivatedAlarm;

-(IBAction)switchPressed:(UIBarButtonItem *)sender;
-(IBAction)cancelPressed:(UIBarButtonItem *)sender;


@end
