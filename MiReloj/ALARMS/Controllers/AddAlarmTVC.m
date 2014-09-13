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

@synthesize alarmListViewController=_alarmListViewController;

@synthesize sounds = _sounds;

- (id)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad{
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
- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"************************************************************** AddAlarmTVC");
    NSLog(@"****************************** viewWillAppear");
    [super viewWillAppear:animated];
    [self.vibrationSwitch setOn:NO];
    NSLog(self.vibrationSwitch.isOn ? @"self.vibrationSwitch=ACTIVADO" : @"self.vibrationSwitch=DESACTIVADO");

    self.vibrationCellText.text = NSLocalizedString(@"_Vibracion",@"_Vibracion SONIDO EN/SP");
    
    NSLog(@"_soundName: %@",_soundName);
    NSLog(@"self.soundCellText.text: %@",self.soundCellText.text);
    [self.tableView reloadData];
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

/**NO CHUSCA*/
- (IBAction)unwindSoundForAddition:(UIStoryboardSegue*)sender{
    NSLog(@"************************************************************** AddAlarmTvC");
    NSLog(@"****************************** unwindSoundForEdition");
    NSLog(@"from segue SoundListTVC");
    if ([sender.sourceViewController isKindOfClass:[SoundListTVC class]]) {
        NSLog(@"from view controller SOUNDS-->OK");
        SoundListTVC *soundListTVC = sender.sourceViewController;
        self.soundCellText.text=soundListTVC.sonidoSeleccionadoString;
        _soundName = self.soundCellText.text;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:_soundName
                     forKey:@"sonidoSeleccionado"];
        [defaults synchronize];
    }
}

#pragma mark - IBActions
-(IBAction)cancelButtonPressed:(id)sender{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
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
    //_soundName = @"Ninguno";
    //NSString *sonidoTitleStatus=NSLocalizedString(@"_SONIDO",@"Titulo SONIDO EN/SP");
    //NSString *borrarESTO =_soundName;
    //sonidoTitleStatus = [_soundName isEqualToString:borrarESTO]?@"\uE325":@"\ue333";
    
    _textNameAlarmToShow = [NSString stringWithFormat:@"%@:%@%@ - %@",_textHHAlarm,_textMMAlarm,self.amPM,_textNameAlarm];
    //_hhmmAlarmToShow  = [NSString stringWithFormat:@"%@ - %@%@",_vibrationStatus.boolValue?@"\ue141":@"\U0001F507",sonidoTitleStatus,_soundCellText.text];
    _hhmmAlarmToShow  = [NSString stringWithFormat:@"%@ - %@",_vibrationStatus.boolValue?@"\ue141":@"\U0001F507",_soundCellText.text];
    _hhmmAlarmToParse = [NSString stringWithFormat:@"%@|%@|%@|%@|%@|%@",_textNameAlarm,_textHHAlarm,_textMMAlarm,self.amPM,_vibrationStatus,_soundName];
    
    NSLog(self.vibrationSwitch.isOn ? @"self.vibrationSwitch=Yes" : @"self.vibrationSwitch=No");
    NSLog(_vibrationStatus.boolValue ? @"_vibrationStatus.boolValue=Yes" : @"_vibrationStatus.boolValue=No");
    NSLog(@"_textNameAlarmToShow: %@",_textNameAlarmToShow);
    NSLog(@"_hhmmAlarmToShow: %@",_hhmmAlarmToShow);
    NSLog(@"_hhmmAlarmToParse: %@",_hhmmAlarmToParse);
    NSLog(@"_textNameAlarm: %@",_textNameAlarm);
    NSLog(@"_soundName: %@",_soundName);
    
    Alarm *newAlarm = [[Alarm alloc] initWithName:_textNameAlarm
                               initWithNameToShow:_textNameAlarmToShow
                                initWithalarmTime:_hhmmAlarmToShow
                                   initWithString:_hhmmAlarmToParse
                                    initWithSound:_soundName
                                        activated:YES
                                      vibrationOn:_vibrationStatus.boolValue];
    
    [self.alarmListViewController.alarms addObject:newAlarm];
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    /*ELIMINADO[self.alarmListViewController.tableView reloadData]; *Necesario al ppio. para que el prepareForSegue funcione y actualice la vista de la lista de alarmas*/
    

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


/********PRUEBAS***********/




@end
