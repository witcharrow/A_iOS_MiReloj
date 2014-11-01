//
//  AddAlarmTVC.m
//  MiReloj
//
//  Created by Alejandro on 19/08/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//
	
#import "AddAlarmTVC.h"
#import "AlarmListTVC.h"
#import "Alarm.h"
#import "SoundListTVC.h"
#define kTimerNameKey @"kTimerNameKey"

@interface AddAlarmTVC ()

@end

@implementation AddAlarmTVC
/*Nombre de la alarma*/
@synthesize nameAlarm=_nameAlarm;
@synthesize textNameAlarm=_textNameAlarm;
@synthesize textNameAlarmToShow=_textNameAlarmToShow;
/*Horas y minutos de la alarma*/
@synthesize hhAlarm=_hhAlarm;
@synthesize mmAlarm=_mmAlarm;
@synthesize textHHAlarm=_textHHAlarm;
@synthesize textMMAlarm=_textMMAlarm;
@synthesize hhmmAlarmToShow=_hhmmAlarmToShow;
@synthesize hhmmAlarmToParse=_hhmmAlarmToParse;
@synthesize amPM=_amPM;
/*Vibracion*/
@synthesize vibrationSwitch=_vibrationSwitch;
@synthesize vibrationStatus=_vibrationStatus;
@synthesize vibrationCellText=_vibrationCellText;
/*Sonido*/
@synthesize soundCellText=_soundCellText;
@synthesize soundName=_soundName;
@synthesize soundPath=_soundPath;
/*Para la seleccion de sonidos*/
@synthesize sounds = _sounds;
/*Para acceder a la BD de alarmas*/
@synthesize statusDB = _statusDB;
/*Lista de alarmas*/
@synthesize alarmListViewController=_alarmListViewController;

-(id)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
/*Si no hay sonido asociado carga la vista de inicio con la opción "Elija sonido"*/
-(void)viewDidLoad{
    NSLog(@"************************************************************** AddAlarmTVC");
    NSLog(@"****************************** viewDidLoad");

    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSLog(@"_soundName: %@",_soundName);
    self.soundCellText.text = _soundName;
    if (_soundName.length<1){
        self.soundCellText.text = [NSString stringWithFormat:@"\uE325 %@",NSLocalizedString(@"_elijaSonido",@"_elijaSonido EN/SP")];
    }
    NSLog(@"self.soundCellText.text: %@",self.soundCellText.text);
}
/*Cargamos la vibración de inicio como apagada (ahorramos así batería)*/
-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"************************************************************** AddAlarmTVC");
    NSLog(@"****************************** viewWillAppear");
    [super viewWillAppear:animated];
    [self.vibrationSwitch setOn:NO];
    NSLog(self.vibrationSwitch.isOn ? @"self.vibrationSwitch=ACTIVADO" : @"self.vibrationSwitch=DESACTIVADO");

    self.vibrationCellText.text = NSLocalizedString(@"_Vibracion",@"_Vibracion SONIDO EN/SP");
    
    NSLog(@"_soundName: %@",_soundName);
    NSLog(@"_soundPath: %@",_soundPath);
    NSLog(@"self.soundCellText.text: %@",self.soundCellText.text);
    [self.tableView reloadData];
}
/*Sin acción, solo logs para comprobar la información de la alarma*/
-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"************************************************************** AddAlarmTVC");
    NSLog(@"****************************** viewWillDisappear");
    [super viewWillDisappear:animated];
    [self.parentViewController reloadInputViews];
    //Guardamos la información de la alarma.
    
    NSLog(@"_textNameAlarmToShow: %@",_textNameAlarmToShow);
    NSLog(@"_hhmmAlarmToShow: %@",_hhmmAlarmToShow);
    NSLog(self.vibrationSwitch.isOn ? @"self.vibrationSwitch.isOn=Yes" : @"self.vibrationSwitch.isOn=No");
    NSLog(@"_soundName: %@",_soundName);
    NSLog(@"_soundPath: %@",_soundPath);
    
}
-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/************************************************************************************************************************************BORRAMOS ESTO POR AHORA, NO NECESARIO¿?****

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

//COMENTADO POR DEFECTO
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


//COMENTADO POR DEFECTO
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

///COMENTADO POR DEFECTO
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


//COMENTADO POR DEFECTO
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}


//COMENTADO POR DEFECTO
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


//COMENTADO POR DEFECTO
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

************************************************************************************************************************************BORRAMOS ESTO POR AHORA, NO NECESARIO¿?****/
/*Para la seleccion de sonidos
-(void) prepareForSegueAddAlarm:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"************************************************************** AddAlarmTVC");
    NSLog(@"****************************** prepareForSegueAddAlarm");
    if([segue.identifier isEqualToString:@"selectSoundFromListToAdd"]){
        NSLog(@"-->selectSoundFromListToAdd");
        SoundListTVC *soundListTVC = segue.destinationViewController;
        soundListTVC.addAlarmTVC=[self.sounds objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        //soundListTVC = [self.sounds objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        //self.soundCellText.text=soundListTVC.sonidoSeleccionadoString;
        //_soundName = self.soundCellText.text;
        
        //NSLog(@"_soundName: %@", _soundName);
        
    }
}*/
#pragma mark - IBActions
/*Ocultamos la pantalla de añadir sonido sin guardar nada*/
-(IBAction)cancelButtonPressed:(id)sender{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
/*Guardamos la información recogida en la pantalla para añadir la alarma a la lista de alarmas*/
-(IBAction)doneButtonPressed:(id)sender{
    _textNameAlarm = self.nameAlarm.text;
    _textHHAlarm = self.hhAlarm.text;
    _textMMAlarm = self.mmAlarm.text;
/*Opciones para el texto de la alarma*/
    if ([_textNameAlarm isEqualToString:@""] || [_textNameAlarm isEqualToString:@" "]){
        _textNameAlarm=NSLocalizedString(@"_nuevaAlarma",@"Nueva Alarma EN/SP");
    }
/*Opciones del control de la hora*/
    if ([_textHHAlarm isEqualToString:@""] || [_textHHAlarm isEqualToString:@" "] || _textHHAlarm.length>2 || _textHHAlarm.intValue>23 || [_textHHAlarm isEqualToString:@"HH"]){
        _textHHAlarm= @"00";
    }
    if (_textHHAlarm.length<2) {
        _textHHAlarm = [NSString stringWithFormat:@"0%@",_textHHAlarm];
    }
/*Opciones del control de los minutos*/
    if ([_textMMAlarm isEqualToString:@""] || [_textMMAlarm isEqualToString:@" "] || _textMMAlarm.length>2 || _textMMAlarm.intValue>59 || [_textMMAlarm isEqualToString:@"MM"]){
        _textMMAlarm= @"00";
    }
    if (_textMMAlarm.length<2) {
        _textMMAlarm = [NSString stringWithFormat:@"0%@",_textMMAlarm];
    }
/*Opciones formato AM/PM*/
    if((_textHHAlarm.intValue>11)&&(_textHHAlarm.intValue<24)){
        self.amPM=@"";
    }
    else{
        self.amPM=@" AM";
    }
/*Opciones de control para la vibracion*/
    if(self.vibrationSwitch.isOn){
        _vibrationStatus=@"YES";
    }
    else{
        _vibrationStatus=@"NO";
    }
/*Opciones de control para el sonido*/
    if([_soundCellText.text isEqualToString:[NSString stringWithFormat:@"\uE325 %@",NSLocalizedString(@"_elijaSonido",[@"_elijaSonido EN/SP"])]]){
        _soundCellText.text=[NSString stringWithFormat:@"%@ %@", @"\ue333", NSLocalizedString(@"_NoneSound",@"Titulo SONIDO EN/SP")];
        
    }
    if(_soundName.length<1){
        _soundName= [NSString stringWithFormat:@"%@ %@", @"\ue333", NSLocalizedString(@"_NoneSound",@"Titulo SONIDO EN/SP")];
    }
    
    _textNameAlarmToShow = [NSString stringWithFormat:@"%@:%@%@ - %@",_textHHAlarm,_textMMAlarm,self.amPM,_textNameAlarm];
    _hhmmAlarmToShow  = [NSString stringWithFormat:@"%@ - %@",_vibrationStatus.boolValue?@"\ue141":@"\U0001F507",_soundCellText.text];
    _hhmmAlarmToParse = [NSString stringWithFormat:@"%@|%@|%@|%@|%@|%@",_textNameAlarm,_textHHAlarm,_textMMAlarm,self.amPM,_vibrationStatus,_soundName];
    
    NSLog(self.vibrationSwitch.isOn ? @"self.vibrationSwitch=Yes" : @"self.vibrationSwitch=No");
    NSLog(_vibrationStatus.boolValue ? @"_vibrationStatus.boolValue=Yes" : @"_vibrationStatus.boolValue=No");
    NSLog(@"_textNameAlarmToShow: %@",_textNameAlarmToShow);
    NSLog(@"_hhmmAlarmToShow: %@",_hhmmAlarmToShow);
    NSLog(@"_hhmmAlarmToParse: %@",_hhmmAlarmToParse);
    NSLog(@"_textNameAlarm: %@",_textNameAlarm);
    NSLog(@"_soundName: %@",_soundName);
    NSLog(@"_soundPath: %@",_soundPath);
    
    Alarm *newAlarm = [[Alarm alloc] initWithName:_textNameAlarm
                               initWithNameToShow:_textNameAlarmToShow
                                initWithalarmTime:_hhmmAlarmToShow
                                   initWithString:_hhmmAlarmToParse
                                    initWithSound:_soundName
                                initWithSoundPath:_soundPath
                                        activated:YES
                                      vibrationOn:_vibrationStatus.boolValue];
    
    [self.alarmListViewController.alarms addObject:newAlarm];
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    /*ELIMINADO[self.alarmListViewController.tableView reloadData]; *Necesario al ppio. para que el prepareForSegue funcione y actualice la vista de la lista de alarmas*/
    [self alertAlarmCreated:newAlarm];

}
/*Hace desaparecer el teclado cuando pulsamos intro*/
-(IBAction)ReturnKeyButton:(id)sender{
    [sender resignFirstResponder];
}
/*Si activamos la vibración, hace que el teléfono vibre mostrando una alerta*/
-(IBAction)Vibrate{
    if(self.vibrationSwitch.isOn){
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@ %@",NSLocalizedString(@"_Vibracion",@"_Vibracion SONIDO EN/SP"), NSLocalizedString(@"_Activada",@"_ACTIVADA EN/SP")]
                                                        message:@"\ue141"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        self.vibrationCellText.text = [NSString stringWithFormat:@"\ue141 %@ %@",NSLocalizedString(@"_Vibracion",@"_Vibracion SONIDO EN/SP"), NSLocalizedString(@"_Activada",@"_ACTIVADA EN/SP")];

    }
    else{
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@ %@",NSLocalizedString(@"_Vibracion",@"_Vibracion SONIDO EN/SP"), NSLocalizedString(@"_Desactivada",@"_DESACTIVADA EN/SP")]
                                                        message:@"\U0001F507"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        self.vibrationCellText.text = [NSString stringWithFormat:@"\U0001F507 %@ %@",NSLocalizedString(@"_Vibracion",@"_Vibracion SONIDO EN/SP"), NSLocalizedString(@"_Desactivada",@"_DESACTIVADA EN/SP")];

    }
}
/*Recoge el sonido seleccionado y su path. Si no se recoge sonido de la opción como "Elija Sonido"*/
-(IBAction)unwindSound:(UIStoryboardSegue*)sender{
    NSLog(@"************************************************************** AddAlarmTvC");
    NSLog(@"****************************** unwindSound");
    NSLog(@"from segue SoundListTVC");
    if ([sender.sourceViewController isKindOfClass:[SoundListTVC class]]) {
        NSLog(@"from view controller SOUNDS-->OK");
        SoundListTVC *soundListTVC = sender.sourceViewController;
        self.soundCellText.text=soundListTVC.sonidoSeleccionadoString;
        _soundName = self.soundCellText.text;
        _soundPath = soundListTVC.rutaSonidoSeleccionadoString;
        
        if (_soundName.length<1){
            self.soundCellText.text = [NSString stringWithFormat:@"\uE325 %@",NSLocalizedString(@"_elijaSonido",@"_elijaSonido EN/SP")];
        }
    }
}

#pragma mark - Help Methods
/*Muestra una alerta al usuario confirmando la creación de la alarma con los datos introducidos*/
-(void)alertAlarmCreated:(Alarm *)newAlarmInfo{
    NSLog(@"************************************************************** AddAlarmTvC");
    NSLog(@"****************************** setAndSaveAlarm");
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"_AlarmaCreada",@"_AlarmaCreada EN/SP")
                                                        message:_textNameAlarmToShow
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
    
    //Guardamos la información de la alarma en la BD.
    [self saveDataInAlarmDB:self];
}
/*Guardamos la información de la alarma en la BD*/
-(void)saveDataInAlarmDB:(id)sender{
    NSLog(@"************************************************************** AddAlarmTVC");
    NSLog(@"****************************** saveDataInAlarmDB");
    
    NSArray *alarmaItems = [_hhmmAlarmToParse componentsSeparatedByString:@"|"];
    NSString *nameAlarm=[alarmaItems objectAtIndex:0];
    int hour = [[alarmaItems objectAtIndex:1] integerValue];
    int minute = [[alarmaItems objectAtIndex:2] integerValue];
    
    NSLog(@"ALARMA Info: %@ (%d:%d) - [%@] - [%@]",nameAlarm,hour,minute,_soundName,_soundPath);
    //***********Accedemos a la BBDD de alarmas***********//
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    // Build the path to the database file
    alarmsDatabasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"alarmsDB.db"]];
    
    sqlite3_stmt    *statement;
    const char *dbpath = [alarmsDatabasePath UTF8String];
    
    if (sqlite3_open(dbpath, &alarmsDB) == SQLITE_OK){
        NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO ALARMS (ALARMNAME, HH, MM, SOUND, SOUNDPATH, ACTIVATED, VIBRATION_ON, NAMETOSHOW, ALARMTIMETOSHOW, ALARMTIMETOPARSE) VALUES (\"%@\", \"%d\", \"%d\", \"%@\", \"%@\", \"%d\", \"%d\", \"%@\", \"%@\", \"%@\")", nameAlarm,hour,minute,_soundName,_soundPath, 1, self.vibrationSwitch.isOn?1:0,_textNameAlarmToShow,_hhmmAlarmToShow,_hhmmAlarmToParse];
        NSLog(@"insertSQL: %@",insertSQL);
        const char *insert_stmt = [insertSQL UTF8String];
        
        sqlite3_prepare_v2(alarmsDB, insert_stmt, -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE){
            NSLog(@"SQLITE_DONE ");
            _statusDB = @"Alarm added";
            //--***********************************************************************************
            //NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
            //[userInfo setObject:_textNameAlarmToShow forKey:@"id"];
            
            NSLog(@"Programamos Alarma %@ (%d:%d) -- [%@]-[%@]", nameAlarm,
                  hour, minute ,_soundName,_soundPath);
            
            NSCalendar *gregCalendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
            NSDateComponents *dateComponent = [gregCalendar components:NSYearCalendarUnit |
                                               NSMonthCalendarUnit  |   NSDayCalendarUnit |
                                               NSHourCalendarUnit   |   NSMinuteCalendarUnit fromDate:[NSDate date]];
            [dateComponent setHour:hour];
            [dateComponent setMinute:minute];
            UIDatePicker *HHMM = [[UIDatePicker alloc]init];
            [HHMM setDate:[gregCalendar dateFromComponents:dateComponent]];
            
            NSLog(@"Progamo ALARMA en AlarmListTVC: %@",_textNameAlarmToShow);

            /*
            UILocalNotification *notification = [[UILocalNotification alloc]init];             
            [notification setAlertBody:[NSString stringWithFormat: @"%@\n%@", _textNameAlarmToShow,_soundName]];
            [notification setFireDate:HHMM.date];
            [notification setTimeZone:[NSTimeZone defaultTimeZone]];
            [notification setSoundName:_soundPath];
            [notification setRepeatInterval:NSDayCalendarUnit];//la alarma se repite por defecto cada 24 horas
            //[notification userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"setNotificationForEveryDay", @"key", nil]];
            [[UIApplication sharedApplication ] scheduleLocalNotification:notification];
             */
            ///--***********************************************************************************
            
            [self cancelAlarm]; //clear any previous alarms
            UILocalNotification *alarm = [[UILocalNotification alloc] init];
            alarm.alertBody=[NSString stringWithFormat: @"%@\n%@", _textNameAlarmToShow,_soundName];
            alarm.fireDate = HHMM.date;
            alarm.timeZone = [NSTimeZone defaultTimeZone];
            alarm.soundName=_soundPath;
            alarm.repeatInterval=NSDayCalendarUnit;//la alarma se repite por defecto cada 24 horas
            //alarm.alertBody = @"alert msg";
            //alarm.fireDate = [NSDate dateWithTimeInterval:alarmDuration sinceDate:startTime];
            //alarm.soundName = UILocalNotificationDefaultSoundName;
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:_textNameAlarmToShow forKey:kTimerNameKey];
            alarm.userInfo = userInfo;
            [[UIApplication sharedApplication] scheduleLocalNotification:alarm];
            
            
            
            
        } else {
            NSLog(@"SQLITE_ERROR ");
            _statusDB = @"Failed to add alarm";
        }
        NSLog(@"_statusDB:%@",_statusDB);
        sqlite3_finalize(statement);
        sqlite3_close(alarmsDB);
    }
}

-(void)cancelAlarm{
    NSLog(@"************************************************************** AddAlarmTVC");
    NSLog(@"****************************** cancelAlarm");
    for (UILocalNotification *notification in [[[UIApplication sharedApplication] scheduledLocalNotifications] copy]){
        NSDictionary *userInfo = notification.userInfo;
        if ([_textNameAlarmToShow isEqualToString:[userInfo objectForKey:kTimerNameKey]]){
            NSLog(@"cancelamos la notificación: %@",_textNameAlarmToShow);
            [[UIApplication sharedApplication] cancelLocalNotification:notification];
        }
    }
}

@end
