//
//  EditAlarmTvC.m
//  MiReloj
//
//  Created by Alejandro on 21/08/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import "EditAlarmTVC.h"
#import "Alarm.h"
#import "SoundListTVC.h"
#define kTimerNameKey @"kTimerNameKey"

@interface EditAlarmTVC ()

@end

@implementation EditAlarmTVC

@synthesize nameAlarm=_nameAlarm;
@synthesize textNameAlarm=_textNameAlarm;
@synthesize textNameAlarmToShow=_textNameAlarmToShow;
@synthesize textNameAlarmToShow_PREVIOUS=_textNameAlarmToShow_PREVIOUS;
@synthesize hhAlarm=_hhAlarm;
@synthesize mmAlarm=_mmAlarm;
@synthesize textHHAlarm=_textHHAlarm;
@synthesize textMMAlarm=_textMMAlarm;
@synthesize hhmmAlarmToShow=_hhmmAlarmToShow;
@synthesize hhmmAlarmToParse=_hhmmAlarmToParse;
@synthesize amPM=_amPM;
@synthesize activatedSwitch=_activatedSwitch;
@synthesize vibrationSwitch=_vibrationSwitch;
@synthesize vibrationStatus=_vibrationStatus;
@synthesize activationStatus=_activationStatus;
@synthesize vibrationCellText=_vibrationCellText;
@synthesize soundName=_soundName;
@synthesize soundPath=_soundPath;
@synthesize alarm=_alarm;
@synthesize statusDB=_statusDB;

-(id)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
/*Cargamos la información de la Alarma para ser parseada y mostrada*/
-(void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"************************************************************** EditAlarmTvC");
    NSLog(@"****************************** viewDidLoad");
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.nameAlarm.text = self.alarm.name;
    NSLog(@"alarmTimeToParse: %@",self.alarm.alarmTimeToParse);

    NSArray *alarmaItems = [self.alarm.alarmTimeToParse componentsSeparatedByString:@"|"];
    _textHHAlarm = [alarmaItems objectAtIndex:1];
    _textMMAlarm = [alarmaItems objectAtIndex:2];
    _vibrationStatus = [alarmaItems objectAtIndex:4];
    _soundName=[alarmaItems objectAtIndex:5];

    self.hhAlarm.text = _textHHAlarm;
    self.mmAlarm.text = _textMMAlarm;
    
    /*Opciones formato AM/PM*/
    if((_textHHAlarm.intValue>11)&&(_textHHAlarm.intValue<24)){
        self.amPM.text=@"";
    }
    else{
        self.amPM.text=@" AM";
    }
/*Alarma Activada/Desactivada*/
    [self.activatedSwitch setOn:self.alarm.activated];
/*Vibracion Activada/Desactivada*/
    [self.vibrationSwitch setOn:_vibrationStatus.boolValue];
    NSLog(self.activatedSwitch  ? @"self.activatedSwitch =Yes" : @"self.activatedSwitch =No");
    NSLog(self.alarm.vibrationOn ? @"self.alarm.vibrationOn=Yes" : @"self.alarm.vibrationOn=No");
    NSLog(_vibrationStatus.boolValue ? @"_vibrationStatus=Yes" : @"_vibrationStatus=No");
    if (self.vibrationSwitch.isOn){
        self.vibrationCellText.text = [NSString stringWithFormat:@"\ue141 %@ %@",NSLocalizedString(@"_Vibracion",@"_Vibracion SONIDO EN/SP"), NSLocalizedString(@"_Activada",@"_ACTIVADA EN/SP")];
    }
    else{
        self.vibrationCellText.text = [NSString stringWithFormat:@"\U0001F507 %@ %@",NSLocalizedString(@"_Vibracion",@"_Vibracion SONIDO EN/SP"), NSLocalizedString(@"_Desactivada",@"_DESACTIVADA EN/SP")];
    }
/*Sonido seleccionado*/
    self.soundCellText.text = _soundName;
    if (_soundName.length<1){
        self.soundCellText.text = [NSString stringWithFormat:@"%@ %@", @"\ue333", NSLocalizedString(@"_NoneSound",@"Titulo SONIDO EN/SP")];
    }
    

    NSLog(@"self.nameAlarm.text: %@",self.nameAlarm.text);
    NSLog(@"_textHHAlarm: %@",_textHHAlarm);
    NSLog(@"_textMMAlarm: %@",_textMMAlarm);
    NSLog(@"_soundName: %@",_soundName);
    NSLog(@"self.soundCellText.text: %@",self.soundCellText.text);
    
    /*Guardamos el valor de la alarma antes de ser editada*/
    _textNameAlarmToShow_PREVIOUS = [NSString stringWithFormat:@"%@:%@%@ - %@",_textHHAlarm,_textMMAlarm,self.amPM.text,self.nameAlarm.text];
    NSLog(@"_textNameAlarmToShow_PREVIOUS: %@",_textNameAlarmToShow_PREVIOUS);
}
/*Cargamos las filas de la tabla*/
-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"************************************************************** EditAlarmTvC");
    NSLog(@"****************************** viewWillAppear");
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}
/*Recargamos los datos en la lista de alarmas*/
-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"************************************************************** EditAlarmTvC");
    NSLog(@"****************************** viewWillDisappear");
    [super viewWillDisappear:animated];
    [self.parentViewController reloadInputViews];
/*Revisamos la información de la alarma*/
    NSLog(@"_textNameAlarmToShow: %@",_textNameAlarmToShow);
    NSLog(@"_hhmmAlarmToShow: %@",_hhmmAlarmToShow);
    NSLog(self.alarm.activated ? @"self.alarm.activated=Yes" : @"self.alarm.activated=No");
    NSLog(self.alarm.vibrationOn ? @"self.alarm.vibrationOn=Yes" : @"self.alarm.vibrationOn=No");
    NSLog(@"_soundName: %@",_soundName);
    NSLog(@"_soundPath: %@",_soundPath);
}
-(void)didReceiveMemoryWarning{
    NSLog(@"************************************************************** EditAlarmTvC");
    NSLog(@"****************************** didReceiveMemoryWarning");
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/************************************************************************************************************************************BORRAMOS ESTO POR AHORA, NO NECESARIO¿?****
 
 #pragma mark - Table view data source

 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
 // Return the number of sections.
     return 1;
 }
 
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 // Return the number of rows in the section.
     return self.sounds.count;
 }
 
 //COMENTADO POR DEFECTO

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *selectSoundCell=@"selectSoundCell";
    Sound *currentSound = [self.sounds objectAtIndex:indexPath.row];
    NSString *cellIdentifier = selectSoundCell;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.textLabel.text =
    cell.detailTextLabel.text = currentAlarm.alarmTimeToShow;
    
    return cell;
 }
 */
/*
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

#pragma mark - IBActions
/*Hace desaparecer el teclado cuando pulsamos intro*/
-(IBAction)ReturnKeyButton:(id)sender{
        NSLog(@"************************************************************** EditAlarmTvC");
        NSLog(@"****************************** ReturnKeyButton");
    [sender resignFirstResponder];
}
/*Hace que el dispositivo emita una vibración*/
-(IBAction)Vibrate{
    NSLog(@"************************************************************** EditAlarmTvC");
    NSLog(@"****************************** Vibrate");
    if(self.vibrationSwitch.isOn){
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@ %@",NSLocalizedString(@"_Vibracion",@"_Vibracion SONIDO EN/SP"), NSLocalizedString(@"_Activada",@"_ACTIVADA EN/SP")]
                                                        message:@"\ue141"
                                                        delegate:nil
                                                        cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else{
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@ %@",NSLocalizedString(@"_Vibracion",@"_Vibracion SONIDO EN/SP"), NSLocalizedString(@"_Desactivada",@"_DESACTIVADA EN/SP")]
                                                        message:@"\U0001F507"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}
/*Recoge el sonido seleccionado*/
-(IBAction)unwindSound:(UIStoryboardSegue*)sender{
    NSLog(@"************************************************************** EditAlarmTvC");
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
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:_soundName
                     forKey:@"sonidoSeleccionado"];
        [defaults synchronize];
        NSLog(@"_soundName=%@",_soundName);
    }
}
-(IBAction)saveAndCloseButton:(id)sender{
    NSLog(@"************************************************************** EditAlarmTvC");
    NSLog(@"****************************** saveAndCloseButton");
    /**Guardamos la información de la alarma.
    _textNameAlarmToShow=self.alarm.nameToShow;
    _hhmmAlarmToShow=self.alarm.alarmTimeToShow;
    
    self.alarm.nameToShow=_textNameAlarmToShow;
    self.alarm.alarmTimeToShow=_hhmmAlarmToShow;
    self.soundCellText.text=_soundName;
    _hhmmAlarmToShow  = [NSString stringWithFormat:@"%@ - %@",self.alarm.vibrationOn?@"\ue141":@"\U0001F507",_soundName];
    
    NSLog(@"_textNameAlarmToShow: %@",_textNameAlarmToShow);
    NSLog(@"_hhmmAlarmToShow: %@",_hhmmAlarmToShow);
    
    NSLog(self.alarm.activated ? @"self.alarm.activated=Yes" : @"self.alarm.activated=No");
    NSLog(self.alarm.vibrationOn ? @"self.alarm.vibrationOn=Yes" : @"self.alarm.vibrationOn=No");
    NSLog(@"_soundName: %@",_soundName);
     **/
    _textNameAlarm = self.nameAlarm.text;
    _textHHAlarm = self.hhAlarm.text;
    _textMMAlarm = self.mmAlarm.text;
/*GUARDAMOS VALORES de los SWITCH*/
    self.alarm.activated = self.activatedSwitch.isOn;
    self.alarm.vibrationOn=self.vibrationSwitch.isOn;
/*Opciones para el nombre de la alarma*/
    if ([_textNameAlarm isEqualToString:@""] || [_textNameAlarm isEqualToString:@" "]){
        _textNameAlarm=NSLocalizedString(@"_nuevaAlarma",@"Nueva Alarma EN/SP");
    }
/*Opciones del control de la hora*/
    if ([_textHHAlarm isEqualToString:@""] || [_textHHAlarm isEqualToString:@" "] || _textHHAlarm.length>2 || _textHHAlarm.intValue>23){
        _textHHAlarm= @"00";
    }
    if (_textHHAlarm.length<2) {
        _textHHAlarm = [NSString stringWithFormat:@"0%@",_textHHAlarm];
    }
/*Opciones del control de los minutos*/
    if ([_textMMAlarm isEqualToString:@""] || [_textMMAlarm isEqualToString:@" "] || _textMMAlarm.length>2 || _textMMAlarm.intValue>59){
        _textMMAlarm= @"00";
    }
    if (_textMMAlarm.length<2) {
        _textMMAlarm = [NSString stringWithFormat:@"0%@",_textMMAlarm];
    }
/*Opciones formato AM/PM*/
    if((_textHHAlarm.intValue>11)&&(_textHHAlarm.intValue<24)){
        self.amPM.text=@"";
    }
    else{
        self.amPM.text=@" AM";
    }
/*Opciones para la activación de la alarma*/
    if(self.alarm.activated){
        _activationStatus=@"YES";
    }
    else{
        _activationStatus=@"NO";
    }
/*Opciones de control para la vibracion*/
    if(self.alarm.vibrationOn){
        _vibrationStatus=@"YES";
    }
    else{
        _vibrationStatus=@"NO";
    }
    if (self.vibrationSwitch.isOn){
        self.vibrationCellText.text = [NSString stringWithFormat:@"\ue141 %@ %@",NSLocalizedString(@"_Vibracion",@"_Vibracion SONIDO EN/SP"), NSLocalizedString(@"_Activada",@"_ACTIVADA EN/SP")];
    }
    else{
        self.vibrationCellText.text = [NSString stringWithFormat:@"\U0001F507 %@ %@",NSLocalizedString(@"_Vibracion",@"_Vibracion SONIDO EN/SP"), NSLocalizedString(@"_Desactivada",@"_DESACTIVADA EN/SP")];
    }
/*Opciones de control para el sonido*/
    if([_soundName isEqualToString:[NSString stringWithFormat:@"\uE325 %@",NSLocalizedString(@"_elijaSonido",[@"_elijaSonido EN/SP"])]]){
        _soundName=[NSString stringWithFormat:@"%@ %@", @"\ue333", NSLocalizedString(@"_NoneSound",@"Titulo SONIDO EN/SP")];
        
    }
    NSLog(self.alarm.activated ? @"self.alarm.activated=Yes" : @"self.alarm.activated=No");
    NSLog(self.alarm.vibrationOn ? @"self.alarm.vibrationOn=Yes" : @"self.alarm.vibrationOn=No");
    NSLog(@"_textNameAlarm: %@",_textNameAlarm);
    NSLog(@"_textHHAlarm: %@",_textHHAlarm);
    NSLog(@"_textMMAlarm: %@",_textMMAlarm);
    NSLog(@"_soundName: %@",_soundName);
    NSLog(@"_soundPath: %@",_soundPath);
    
    _textNameAlarmToShow = [NSString stringWithFormat:@"%@:%@%@ - %@",_textHHAlarm,_textMMAlarm,self.amPM.text,_textNameAlarm];
    _hhmmAlarmToShow  = [NSString stringWithFormat:@"%@ - %@",_vibrationStatus.boolValue?@"\ue141":@"\U0001F507",_soundName];
    _hhmmAlarmToParse = [NSString stringWithFormat:@"%@|%@|%@|%@|%@|%@",_textNameAlarm,_textHHAlarm,_textMMAlarm,self.amPM.text,_vibrationStatus,_soundName];
    NSLog(@"_hhmmAlarmToShow: %@",_hhmmAlarmToShow);
    NSLog(@"_hhmmAlarmToParse: %@",_hhmmAlarmToParse);
    
    self.alarm.name=_textNameAlarm;
    self.alarm.nameToShow=_textNameAlarmToShow;
    self.alarm.alarmTimeToShow=_hhmmAlarmToShow;
    self.alarm.alarmTimeToParse=_hhmmAlarmToParse;
    
    Alarm *updatedAlarm = [[Alarm alloc] initWithName:_textNameAlarm
                               initWithNameToShow:_textNameAlarmToShow
                                initWithalarmTime:_hhmmAlarmToShow
                                   initWithString:_hhmmAlarmToParse
                                    initWithSound:_soundName
                                initWithSoundPath:_soundPath
                                        activated:_activationStatus.boolValue
                                      vibrationOn:_vibrationStatus.boolValue];
    
    [self alertAlarmUpdated:updatedAlarm];
    
    [self.navigationController popViewControllerAnimated:YES ];
}

#pragma mark - Help Methods
/*Muestra una alerta al usuario confirmando la creación de la alarma con los datos introducidos*/
-(void)alertAlarmUpdated:(Alarm *)newAlarmInfo{
    NSLog(@"************************************************************** EditAlarmTvC");
    NSLog(@"****************************** setAndSaveAlarm");
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"_AlarmaActualizada",@"_AlarmaActualizada EN/SP")
                                                        message:_textNameAlarmToShow
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
    //Borramos la alarma existente de la BD.
    [self deleteAlarm:_textNameAlarmToShow_PREVIOUS];
    //Guardamos la información de la alarma en la BD.
    [self saveDataInAlarmDB:self];
}
/*Guardamos la información de la alarma en la BD*/
-(void)saveDataInAlarmDB:(id)sender{
    NSLog(@"************************************************************** EditAlarmTvC");
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
            if (_activationStatus.boolValue){
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
            
                
                NSLog(@"Progamo ALARMA en AlarmListTVC");
                /*
                UILocalNotification *notification = [[UILocalNotification alloc]init];
                [notification setAlertBody:[NSString stringWithFormat: @"%@\n%@", _textNameAlarmToShow,_soundName]];
                [notification setFireDate:HHMM.date];
                [notification setTimeZone:[NSTimeZone defaultTimeZone]];
                [notification setSoundName:_soundPath];
                [notification setRepeatInterval:NSDayCalendarUnit];//la alarma se repite por defecto cada 24 horas
                [[UIApplication sharedApplication ] scheduleLocalNotification:notification];
                 */
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
            }
            ///--***********************************************************************************
        } else {
            NSLog(@"SQLITE_ERROR ");
            _statusDB = @"Failed to add alarm";
        }
        NSLog(@"_statusDB:%@",_statusDB);
        sqlite3_finalize(statement);
        sqlite3_close(alarmsDB);
    }
}
//delete the alarm from the database
-(BOOL)deleteAlarm:(NSString *)nameToShow{
    NSLog(@"************************************************************** EditAlarmTvC");
    NSLog(@"****************************** deleteAlarm");
    BOOL success = false;
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
    
    if (sqlite3_open(dbpath, &(alarmsDB)) == SQLITE_OK){
        NSString *deleteSQL = [NSString stringWithFormat:@"DELETE from ALARMS WHERE NAMETOSHOW = \"%@\"",nameToShow];
        NSLog(@"deleteSQL: %@",deleteSQL);
        const char *query_stmt = [deleteSQL UTF8String];
        
        if (sqlite3_prepare_v2(alarmsDB, query_stmt, -1, &statement, NULL) == SQLITE_OK){
            _statusDB = @"Resultados de la query obtenidos";
            const char *delete_stmt = [deleteSQL UTF8String];
            sqlite3_prepare_v2(alarmsDB, delete_stmt, -1, &statement, NULL );
            if (sqlite3_step(statement) == SQLITE_DONE){
                NSLog(@"success");
                success = true;
            }
            else{
                NSLog(@"NO success");
                success = false;
            }
            
        }else {
            _statusDB = @"error en la query";
        }
        sqlite3_finalize(statement);
        sqlite3_close(alarmsDB);
    }
    else {
        _statusDB = @"Failed to open/create database";
    }
    NSLog(@"_statusDB: %@",_statusDB);
    
    /*Desactivar la notificación
    NSArray *notifArray = [[UIApplication sharedApplication] scheduledLocalNotifications];
    for (int i = 0; i < [notifArray count]; i++){
        UILocalNotification *aEvent = [notifArray objectAtIndex:i];
        NSLog(@"aEvent.alertBody: %@",aEvent.alertBody);
        NSString *actualNotificationBody=nameToShow;
        if ([actualNotificationBody isEqualToString:aEvent.alertBody]){
            NSLog(@"FOUND!!");
            [[UIApplication sharedApplication] cancelLocalNotification:aEvent];
            break;
        }
        //NSDictionary *userInfo = aEvent.userInfo;
        //NSString *notifId=[NSString stringWithFormat:@"%@",[userInfo valueForKey:@"id"]];
        //NSLog(@"notifId: %@",notifId);
       // if ([id isEqualToString:cancelId]){
       //     [[UIApplication sharedApplication] cancelLocalNotification:aEvent];
       //     break;
      //  }
    }*/

    
    [self cancelAlarm]; //clear any previous alarms
    return success;
}

-(void)cancelAlarm{
    NSLog(@"************************************************************** AddAlarmTVC");
    NSLog(@"****************************** cancelAlarm");
    for (UILocalNotification *notification in [[[UIApplication sharedApplication] scheduledLocalNotifications] copy]){
        NSDictionary *userInfo = notification.userInfo;
        if ([_textNameAlarmToShow_PREVIOUS isEqualToString:[userInfo objectForKey:kTimerNameKey]]){
            NSLog(@"cancelamos la notificación: %@",_textNameAlarmToShow_PREVIOUS);
            [[UIApplication sharedApplication] cancelLocalNotification:notification];
        }
    }
}

@end
