//
//  AddAlarmTVC.h
//  MiReloj
//
//  Created by Alejandro on 19/08/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AudioToolbox/AudioToolbox.h"
#import "sqlite3.h"

@class AlarmListTVC;
@interface AddAlarmTVC : UITableViewController{
    sqlite3 *alarmsDB;
    NSString *alarmsDatabasePath;
}


/*Nombre de la alarma*/
@property (nonatomic,strong) IBOutlet UITextField *nameAlarm;
@property (nonatomic,strong) NSString *textNameAlarm;
@property (nonatomic,strong) NSString *textNameAlarmToShow;
/*Horas y minutos de la alarma*/
@property (nonatomic,strong) IBOutlet UITextField *hhAlarm;
@property (nonatomic,strong) IBOutlet UITextField *mmAlarm;
@property (nonatomic,strong) NSString *textHHAlarm;
@property (nonatomic,strong) NSString *textMMAlarm;
@property (nonatomic,strong) NSString *hhmmAlarmToShow;
@property (nonatomic,strong) NSString *hhmmAlarmToParse;
@property (nonatomic,strong) NSString *amPM;
/*Vibracion*/
@property (nonatomic,strong) IBOutlet UISwitch *vibrationSwitch;
@property (nonatomic,strong) NSString *vibrationStatus;
@property (nonatomic,strong) IBOutlet UILabel *vibrationCellText;
/*Sonido*/
@property (nonatomic,strong) IBOutlet UILabel *soundCellText;
@property (nonatomic,strong) NSString *soundName;
@property (nonatomic,strong) NSString *soundPath;
/*Para la seleccion de sonidos*/
@property (nonatomic,strong) NSMutableArray *sounds;
/*Para acceder a la BD de alarmas*/
@property (strong, nonatomic) NSString *statusDB;

@property (nonatomic,strong) AlarmListTVC *alarmListViewController;

/*Descarta las opciones pulsadas*/
-(IBAction)cancelButtonPressed:(id)sender;
/*Guarda las opciones pulsadas*/
-(IBAction)doneButtonPressed:(id)sender;
/*Hace desaparecer el teclado cuando pulsamos intro*/
-(IBAction)ReturnKeyButton:(id)sender;
/*Para la vibracion*/
-(IBAction)Vibrate;

@end
