//
//  EditAlarmTvC.m
//  MiReloj
//
//  Created by Alejandro on 21/08/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import "EditAlarmTVC.h"
#import "Alarm.h"

@interface EditAlarmTVC ()

@end

@implementation EditAlarmTVC

@synthesize nameAlarm=_nameAlarm;
@synthesize textNameAlarm=_textNameAlarm;
@synthesize textNameAlarmToShow=_textNameAlarmToShow;
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
@synthesize vibrationCellText=_vibrationCellText;
@synthesize soundName=_soundName;
@synthesize alarm=_alarm;


- (id)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"************************************************************** EditAlarmTvC");
    NSLog(@"****************************** viewDidLoad");
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.nameAlarm.text = self.alarm.name;
    
    NSArray *alarmaItems = [self.alarm.alarmTimeToParse componentsSeparatedByString:@"|"];
    _textHHAlarm = [alarmaItems objectAtIndex:1];
    _textMMAlarm = [alarmaItems objectAtIndex:2];
    _vibrationStatus = [alarmaItems objectAtIndex:4];

    self.hhAlarm.text = _textHHAlarm;
    self.mmAlarm.text = _textMMAlarm;
    
    /*Opciones formato AM/PM*/
    if((_textHHAlarm.intValue>11)&&(_textHHAlarm.intValue<24)){
        self.amPM.text=@"";
    }
    else{
        self.amPM.text=@" AM";
    }

    [self.activatedSwitch setOn:self.alarm.activated];
    [self.vibrationSwitch setOn:_vibrationStatus.boolValue];
    NSLog(self.activatedSwitch  ? @"self.activatedSwitch =Yes" : @"self.activatedSwitch =No");
    NSLog(self.alarm.vibrationOn ? @"self.alarm.vibrationOn=Yes" : @"self.alarm.vibrationOn=No");
    NSLog(_vibrationStatus.boolValue ? @"_vibrationStatus=Yes" : @"_vibrationStatus=No");

    
}
/*Cargamos la vibración de inicio como apagada (ahorramos así batería)*/
- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"************************************************************** EditAlarmTvC");
    NSLog(@"****************************** viewWillAppear");
    [super viewWillAppear:animated];
    
    NSLog(self.vibrationSwitch.isOn ? @"self.vibrationSwitch=Yes" : @"self.vibrationSwitch=No");
    NSLog(_vibrationStatus.boolValue ? @"_vibrationStatus.boolValue=Yes" : @"_vibrationStatus.boolValue=No");
    NSLog(@"self.nameAlarm.text: %@",self.nameAlarm.text);
    NSLog(@"_textHHAlarm: %@",_textHHAlarm);
    NSLog(@"_textMMAlarm: %@",_textMMAlarm);
    
    if (self.vibrationSwitch.isOn){
        self.vibrationCellText.text = [NSString stringWithFormat:@"\ue141 %@ %@",NSLocalizedString(@"_Vibracion",@"_Vibracion SONIDO EN/SP"), NSLocalizedString(@"_Activada",@"_ACTIVADA EN/SP")];
    }
    else{
        self.vibrationCellText.text = [NSString stringWithFormat:@"\U0001F507 %@ %@",NSLocalizedString(@"_Vibracion",@"_Vibracion SONIDO EN/SP"), NSLocalizedString(@"_Desactivada",@"_DESACTIVADA EN/SP")];
    }
}

- (void)didReceiveMemoryWarning{
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

#pragma mark - IBActions
-(IBAction)alarmDataChanged:(id)sender{
    NSLog(@"************************************************************** EditAlarmTvC");
    NSLog(@"****************************** alarmDataChanged");
    _textNameAlarm = self.nameAlarm.text;
    _textHHAlarm = self.hhAlarm.text;
    _textMMAlarm = self.mmAlarm.text;
    /*GUARDAMOS VALORES*/
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
    
    
    /*Opciones de control para la vibracion*/
    if(self.alarm.vibrationOn){
        _vibrationStatus=@"YES";
    }
    else{
        _vibrationStatus=@"NO";
    }
    
    /*Opciones de control para el sonido*/
    _soundName = @"Ninguno";
    
    
    
    NSString *sonidoTitleStatus=NSLocalizedString(@"_SONIDO",@"Titulo SONIDO EN/SP");
    NSString *borrarESTO =_soundName;
    sonidoTitleStatus = [_soundName isEqualToString:borrarESTO]?@"\uE325":@"\ue333";
    
    NSLog(@"_textNameAlarm: %@",_textNameAlarm);
    NSLog(@"_textHHAlarm: %@",_textHHAlarm);
    NSLog(@"_textMMAlarm: %@",_textMMAlarm);
    NSLog(self.alarm.activated ? @"self.alarm.activated=Yes" : @"self.alarm.activated=No");
    NSLog(self.alarm.vibrationOn ? @"self.alarm.vibrationOn=Yes" : @"self.alarm.vibrationOn=No");
    
    if (self.vibrationSwitch.isOn){
        self.vibrationCellText.text = [NSString stringWithFormat:@"\ue141 %@ %@",NSLocalizedString(@"_Vibracion",@"_Vibracion SONIDO EN/SP"), NSLocalizedString(@"_Activada",@"_ACTIVADA EN/SP")];
    }
    else{
        self.vibrationCellText.text = [NSString stringWithFormat:@"\U0001F507 %@ %@",NSLocalizedString(@"_Vibracion",@"_Vibracion SONIDO EN/SP"), NSLocalizedString(@"_Desactivada",@"_DESACTIVADA EN/SP")];
    }
    
    
    _textNameAlarmToShow = [NSString stringWithFormat:@"%@:%@%@ - %@",_textHHAlarm,_textMMAlarm,self.amPM.text,_textNameAlarm];
    _hhmmAlarmToShow  = [NSString stringWithFormat:@"%@ - %@%@",_vibrationStatus.boolValue?@"\ue141":@"\U0001F507",sonidoTitleStatus,_soundName];
    _hhmmAlarmToParse = [NSString stringWithFormat:@"%@|%@|%@|%@|%@|%@",_textNameAlarm,_textHHAlarm,_textMMAlarm,self.amPM.text,_vibrationStatus,_soundName];
    NSLog(@"_hhmmAlarmToShow: %@",_hhmmAlarmToShow);
    NSLog(@"_hhmmAlarmToParse: %@",_hhmmAlarmToParse);
    
    self.alarm.name=_textNameAlarm;
    self.alarm.nameToShow=_textNameAlarmToShow;
    self.alarm.alarmTimeToShow=_hhmmAlarmToShow;
    self.alarm.alarmTimeToParse=_hhmmAlarmToParse;
    
}
/*Hace desaparecer el teclado cuando pulsamos intro*/
-(IBAction)ReturnKeyButton:(id)sender{
    [sender resignFirstResponder];
}

-(IBAction)Vibrate{
    if(self.vibrationSwitch.isOn){
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"\ue141 %@ %@",NSLocalizedString(@"_Vibracion",@"_Vibracion SONIDO EN/SP"), NSLocalizedString(@"_Activada",@"_ACTIVADA EN/SP")]
                                                        message:@"\ue141"
                                                        delegate:nil
                                                        cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else{
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"\U0001F507 %@ %@",NSLocalizedString(@"_Vibracion",@"_Vibracion SONIDO EN/SP"), NSLocalizedString(@"_Desactivada",@"_DESACTIVADA EN/SP")]
                                                        message:@"\U0001F507"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

@end
