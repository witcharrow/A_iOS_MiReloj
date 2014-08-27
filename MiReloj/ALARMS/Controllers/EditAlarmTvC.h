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
@property (nonatomic,strong) IBOutlet UILabel *amPM;
/*Vibracion*/
@property (nonatomic,strong) IBOutlet UISwitch *activatedSwitch;
@property (nonatomic,strong) IBOutlet UISwitch *vibrationSwitch;
@property (nonatomic,strong) NSString *vibrationStatus;
@property (nonatomic,strong) IBOutlet UILabel *vibrationCellText;
/*Sonido*/
@property (nonatomic,strong) IBOutlet UILabel *soundCellText;
@property (nonatomic,strong) NSString *soundName;

/*Para el paso de información a la lista de alarmas*/
@property (nonatomic,strong) Alarm *alarm;

-(IBAction)alarmDataChanged:(id)sender;
-(IBAction)ReturnKeyButton:(id)sender;


/*Para la vibracion*/
-(IBAction)Vibrate;

/********PRUEBAS***********/

/*Para la seleccion de sonidos*/
@property (nonatomic,strong) NSMutableArray *sounds;
//- (IBAction)unwindSoundForEdition:(UIStoryboardSegue*)sender;


@end
