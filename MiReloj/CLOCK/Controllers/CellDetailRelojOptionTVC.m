//
//  CellDetailRelojOptionTVC.m
//  MiReloj
//
//  Created by user11394 on 27/04/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import "CellDetailRelojOptionTVC.h"
#import "RelojViewController.h"

@interface CellDetailRelojOptionTVC ()
@end

@implementation CellDetailRelojOptionTVC

//Etiquetas de las 4 celdas
@synthesize  titleLabelDOW = _titleLabelDOW;
@synthesize exampleLabelDOW = _exampleLabelDOW;
@synthesize activatedDOW = _activatedDOW;
@synthesize  titleLabelDOM = _titleLabelDOM;
@synthesize exampleLabelDOM = _exampleLabelDOM;
@synthesize activatedDOM = _activatedDOM;
@synthesize  titleLabelMM = _titleLabelMM;
@synthesize exampleLabelMM = _exampleLabelMM;
@synthesize activatedMM = _activatedMM;
@synthesize  titleLabelYY = _titleLabelYY;
@synthesize exampleLabelYY = _exampleLabelYY;
@synthesize activatedYY = _activatedYY;

//Etiqueta para la fecha
@synthesize fechaResultado=_fechaResultado;
@synthesize stringDate=_stringDate;

//Estado de los switch
@synthesize userHasActivatedDOW=_userHasActivatedDOW;
@synthesize userHasActivatedDOM=_userHasActivatedDOM;
@synthesize userHasActivatedMM=_userHasActivatedMM;
@synthesize userHasActivatedYY=_userHasActivatedYY;
@synthesize cancelButtonPressed=_cancelButtonPressed;

- (id)initWithStyle:(UITableViewStyle)style{
    //NSLog(@"************************************************************** CellDetailRelojOption");
    //NSLog(@"****************************** initWithStyle");
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)didReceiveMemoryWarning{
    //NSLog(@"************************************************************** CellDetailRelojOption");
    //NSLog(@"****************************** didReceiveMemoryWarning");
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
/*Cargamos las etiquetas por idioma*/
- (void)viewDidLoad{
    [super viewDidLoad];
    //NSLog(@"************************************************************** CellDetailRelojOption");
    //NSLog(@"****************************** viewDidLoad");

    self.title = NSLocalizedString(@"_opcionesReloj",@"OPCIONES EN/SP");
    self.titleLabelDOW.text = NSLocalizedString(@"_dayOfWeek",@"LUNES EN/SP");
    self.exampleLabelDOW.text = NSLocalizedString(@"_monday",@"LUNES EN/SP");
    self.titleLabelDOM.text = NSLocalizedString(@"_dayOfMonth",@"25 EN/SP");
    self.exampleLabelDOM.text = NSLocalizedString(@"_DD",@"25 EN/SP");
    self.titleLabelMM.text = NSLocalizedString(@"_month",@"MAYO EN/SP");
    self.exampleLabelMM.text = NSLocalizedString(@"_MM",@"MAYO EN/SP");
    self.titleLabelYY.text = NSLocalizedString(@"_YEAR",@"2014 EN/SP");
    self.exampleLabelYY.text = NSLocalizedString(@"_YY",@"2014 EN/SP");
    _fechaResultado.text=_fechaResultadoString;
}
/*Cargamos la cadena de texto de la fecha del reloj y si los switchs estan activos*/
- (void)viewWillAppear:(BOOL)animated{
    //NSLog(@"************************************************************** CellDetailRelojOption");
    //NSLog(@"****************************** viewWillAppear");
    [super viewWillAppear:animated];
    
    //NSLog(_cancelButtonPressed ? @"_cancelButtonPressed=Yes" : @"_cancelButtonPressed=No");
    if(!_cancelButtonPressed){
        NSUserDefaults *userPreferences=[NSUserDefaults standardUserDefaults];
        _userHasActivatedDOW=[userPreferences boolForKey:@"userHasActivatedDOW"];
        _userHasActivatedDOM=[userPreferences boolForKey:@"userHasActivatedDOM"];
        _userHasActivatedMM = [userPreferences boolForKey:@"userHasActivatedMM"];
        _userHasActivatedYY = [userPreferences boolForKey:@"userHasActivatedYY"];
    
        //NSLog(_userHasActivatedDOW ? @"_userHasActivatedDOW=Yes" : @"_userHasActivatedDOW=No");
        //NSLog(_userHasActivatedDOM ? @"_userHasActivatedDOM=Yes" : @"_userHasActivatedDOM=No");
        //NSLog(_userHasActivatedMM ? @"_userHasActivatedMM=Yes" : @"_userHasActivatedMM=No");
        //NSLog(_userHasActivatedYY ? @"_userHasActivatedYY=Yes" : @"_userHasActivatedYY=No");
    
        [self.activatedDOW setOn:_userHasActivatedDOW];
        [self.activatedDOM setOn:_userHasActivatedDOM];
        [self.activatedMM setOn:_userHasActivatedMM];
        [self.activatedYY setOn:_userHasActivatedYY];
    }
}
/*Comprobamos los switch que se han modificado y almacenamos su estado, si no se ha pulsado la opción cancelar*/
- (void)viewWillDisappear:(BOOL)animated{
    //NSLog(@"************************************************************** CellDetailRelojOption");
    //NSLog(@"****************************** viewWillDisappear");
    [super viewWillDisappear:animated];
    
    //NSLog(_cancelButtonPressed ? @"_cancelButtonPressed=Yes" : @"_cancelButtonPressed=No");
    
    if(!_cancelButtonPressed){
        
        NSUserDefaults *userPreferences=[NSUserDefaults standardUserDefaults];
        
        _activatedDOW.isOn? ([userPreferences setBool:YES forKey:@"userHasActivatedDOW"]):([userPreferences setBool:NO forKey:@"userHasActivatedDOW"]);
        _activatedDOM.isOn? ([userPreferences setBool:YES forKey:@"userHasActivatedDOM"]):([userPreferences setBool:NO forKey:@"userHasActivatedDOM"]);
        _activatedMM.isOn? ([userPreferences setBool:YES forKey:@"userHasActivatedMM"]):([userPreferences setBool:NO forKey:@"userHasActivatedMM"]);
        _activatedYY.isOn? ([userPreferences setBool:YES forKey:@"userHasActivatedYY"]):([userPreferences setBool:NO forKey:@"userHasActivatedYY"]);
        
        _userHasActivatedDOW=[userPreferences boolForKey:@"userHasActivatedDOW"];
        _userHasActivatedDOM=[userPreferences boolForKey:@"userHasActivatedDOM"];
        _userHasActivatedMM = [userPreferences boolForKey:@"userHasActivatedMM"];
        _userHasActivatedYY = [userPreferences boolForKey:@"userHasActivatedYY"];
        
        //NSLog(_userHasActivatedDOW ? @"_userHasActivatedDOW=Yes" : @"_userHasActivatedDOW=No");
        //NSLog(_userHasActivatedDOM ? @"_userHasActivatedDOM=Yes" : @"_userHasActivatedDOM=No");
        //NSLog(_userHasActivatedMM ? @"_userHasActivatedMM=Yes" : @"_userHasActivatedMM=No");
        //NSLog(_userHasActivatedYY ? @"_userHasActivatedYY=Yes" : @"_userHasActivatedYY=No");
        
        [self.activatedDOW setOn:_userHasActivatedDOW];
        [self.activatedDOM setOn:_userHasActivatedDOM];
        [self.activatedMM setOn:_userHasActivatedMM];
        [self.activatedYY setOn:_userHasActivatedYY];
    
    
        //Guardamos el estado de los switch para el siguiente inicio de la aplicacion.
        [userPreferences synchronize];
    }
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    //NSLog(@"************************************************************** CellDetailRelojOption");
    //NSLog(@"****************************** shouldAutorotateToInterfaceOrientation");
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Help Methods
/*Detecta el idioma actual*/
-(BOOL) idiomaActualIngles{
    //NSLog(@"************************************************************** CellDetailRelojOption");
    //NSLog(@"****************************** idiomaActualIngles");
    BOOL idiomaEN=NO;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *idiomas = [defaults objectForKey:@"AppleLanguages"];
    NSString *idiomaActual = [idiomas objectAtIndex:0];
    //NSLog(@"lenguaje actual: %@",idiomaActual);
    if([idiomaActual isEqualToString:@"en"]){
        idiomaEN=YES;
    }
    return idiomaEN;
}
/*Hace un split de los datos de la fecha, y lo traduce de ingles a español*/
-(void) setDateToShowSP:(NSString *)formatoFecha{
    //NSLog(@"************************************************************** CellDetailRelojOption");
    //NSLog(@"****************************** setDateToShowSP");
    //NSLog(@"formato fecha es %@",formatoFecha);
    NSDateFormatter *dateDMA = [[NSDateFormatter alloc]init];
    NSDateFormatter *currentDateDMA = [[NSDateFormatter alloc]init];
    
    [dateDMA setDateFormat:formatoFecha];
    [currentDateDMA setDateFormat:@"EEEE,dd,MMMM,yyyy"];
    
    NSString *fechaConFormato=[dateDMA stringFromDate:[NSDate date]];
    NSString *fechaSinFormato=[currentDateDMA stringFromDate:[NSDate date]];
    //NSLog(@"%@",fechaConFormato);
    //NSLog(@"%@",fechaSinFormato);
    
    NSArray *listFechaItems = [fechaSinFormato componentsSeparatedByString:@","];
    NSString *weekDay =[listFechaItems objectAtIndex:0];
    NSString *day =[listFechaItems objectAtIndex:1];
    NSString *month =[listFechaItems objectAtIndex:2];
    NSString *year =[listFechaItems objectAtIndex:3];
    
    NSString *weekDayF =@"";
    NSString *dayF =@"";
    NSString *monthF =@"";
    NSString *yearF =@"";
    
    
    NSArray *listFormats = [formatoFecha componentsSeparatedByString:@","];
    
    for (NSString *f in listFormats) {
        if([f isEqualToString:@"EEEE"]){
            weekDayF =weekDay;
        }
        if([f isEqualToString:@"dd"]){
            dayF =day;
        }
        if([f isEqualToString:@"MMMM"]){
            monthF =month;
        }
        if([f isEqualToString:@"yyyy"]){
            yearF =year;
        }
    };
    
    NSArray *spWeekDay = [NSArray arrayWithObjects: @"Lunes",@"Martes",@"Miércoles",@"Jueves",@"Viernes",@"Sábado",@"Domingo",
                          nil];
    NSArray *enWeekDay = [NSArray arrayWithObjects: @"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday",@"Saturday",@"Sunday",
                          nil];
    for (int i=0; i<[spWeekDay count]; i++) {
        weekDayF=[weekDayF stringByReplacingOccurrencesOfString:[enWeekDay objectAtIndex:i]
                                                     withString:[spWeekDay objectAtIndex:i]];
    }
    
    NSArray *spMonths = [NSArray arrayWithObjects: @"Enero",@"Febrero",@"Marzo",@"Abril",@"Mayo",@"Junio",@"Julio",@"Agosto",@"Septiembre",@"Octubre",@"Noviembre",@"Diciembre",
                         nil];
    NSArray *enMonths = [NSArray arrayWithObjects: @"January",@"February",@"March",@"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"December",
                         nil];
    for (int i=0; i<[spMonths count]; i++) {
        monthF=[monthF stringByReplacingOccurrencesOfString:[enMonths objectAtIndex:i]
                                                 withString:[spMonths objectAtIndex:i]];
    }
    
    //NSLog(@"listFormats = %d",[listFormats count]);
    //NSLog(@"weekDayF = %@",weekDayF);
    //NSLog(@"dayF = %@",dayF);
    //NSLog(@"monthF = %@",monthF);
    //NSLog(@"yearF = %@",yearF);
    if([listFormats count]<=1 || [monthF isEqualToString:@""] || [yearF isEqualToString:@""]){
        _fechaResultado.text=[NSString stringWithFormat:@"%@ %@ %@ %@",weekDayF,dayF,monthF,yearF];
    }
    else{
        if([monthF isEqualToString:@""]){
            _fechaResultado.text=[NSString stringWithFormat:@"%@, %@ %@ de %@",weekDayF,dayF,monthF,yearF];
            
        }
        if ([yearF isEqualToString:@""]){
            _fechaResultado.text=[NSString stringWithFormat:@"%@, %@ de %@ %@",weekDayF,dayF,monthF,yearF];
        }
        else{
            if([weekDayF isEqualToString:@""]){
                _fechaResultado.text=[NSString stringWithFormat:@"%@ %@ de %@ de %@",weekDayF,dayF,monthF,yearF];
            }
            else{
                _fechaResultado.text=[NSString stringWithFormat:@"%@, %@ de %@ de %@",weekDayF,dayF,monthF,yearF];
            }
        }
    }
}
/*Hace un split de la fecha y la muestra en ingles*/
-(void) setDateToShowEN:(NSString *)formatoFecha{
    //NSLog(@"************************************************************** CellDetailRelojOption");
    //NSLog(@"****************************** setDateToShowEN");
    //NSLog(@"setDateToShowEN");
    //NSLog(@"formato fecha EN: %@",formatoFecha);
    NSDateFormatter *dateDMA = [[NSDateFormatter alloc]init];
    NSDateFormatter *currentDateDMA = [[NSDateFormatter alloc]init];
    
    [dateDMA setDateFormat:formatoFecha];
    [currentDateDMA setDateFormat:@"EEEE,dd,MMMM,yyyy"];
    
    NSString *fechaConFormato=[dateDMA stringFromDate:[NSDate date]];
    NSString *fechaSinFormato=[currentDateDMA stringFromDate:[NSDate date]];
    //NSLog(@"%@",fechaConFormato);
    //NSLog(@"%@",fechaSinFormato);
    
    NSArray *listFechaItems = [fechaSinFormato componentsSeparatedByString:@","];
    NSString *weekDay =[listFechaItems objectAtIndex:0];
    NSString *day =[listFechaItems objectAtIndex:1];
    NSString *month =[listFechaItems objectAtIndex:2];
    NSString *year =[listFechaItems objectAtIndex:3];
    
    NSString *weekDayF =@"";
    NSString *dayF =@"";
    NSString *monthF =@"";
    NSString *yearF =@"";
    
    
    NSArray *listFormats = [formatoFecha componentsSeparatedByString:@","];
    
    for (NSString *f in listFormats) {
        if([f isEqualToString:@"EEEE"]){
            weekDayF =weekDay;
        }
        if([f isEqualToString:@"dd"]){
            dayF =day;
        }
        if([f isEqualToString:@"MMMM"]){
            monthF =month;
        }
        if([f isEqualToString:@"yyyy"]){
            yearF =year;
        }
    };
    if([listFormats count]<=1){
        _fechaResultado.text=[NSString stringWithFormat:@"%@ %@ %@ %@",weekDayF,dayF,monthF,yearF];
    }
    else{
        if([weekDayF isEqualToString:@""]){
            _fechaResultado.text=[NSString stringWithFormat:@"%@ %@ %@ %@",weekDayF,dayF,monthF,yearF];
        }
        else{
            _fechaResultado.text=[NSString stringWithFormat:@"%@, %@ %@ %@",weekDayF,dayF,monthF,yearF];
        }
    }
}
/*Guardamos el estado del switch, modificando el string de la fecha en función de los que estén seleccionados*/
-(void) saveDateStringWithSwitchState:(NSString *)formatoFecha{
    //NSLog(@"************************************************************** CellDetailRelojOption");
    //NSLog(@"****************************** saveDateStringWithSwitchState");
    
    if (_activatedDOW.isOn) {
        //NSLog(@"activatedDOW ON");
        formatoFecha = [formatoFecha stringByAppendingString:@"EEEE,"];
    }
    else{
        //NSLog(@"activatedDOW OFF");
    }
    if (_activatedDOM.isOn) {
        //NSLog(@"activatedDOM ON");
        formatoFecha = [formatoFecha stringByAppendingString:@"dd,"];
    }
    else{
        //NSLog(@"activatedDOM OFF");
    }
    if (_activatedMM.isOn) {
        //NSLog(@"activatedMM ON");
        formatoFecha = [formatoFecha stringByAppendingString:@"MMMM,"];
    }
    else{
        //NSLog(@"activatedMM OFF");
    }
    if (_activatedYY.isOn) {
        //NSLog(@"activatedYY ON");
        formatoFecha = [formatoFecha stringByAppendingString:@"yyyy,"];
    }
    else{
        //NSLog(@"activatedYY OFF");
        
    }
    //Borramos el ultimo caracater de la cadena de formato (la coma).
    formatoFecha = [formatoFecha substringToIndex:formatoFecha.length-(formatoFecha.length>0)];
    (!self.idiomaActualIngles)?[self setDateToShowSP:formatoFecha]:[self setDateToShowEN:formatoFecha];
}

#pragma mark - IBActions
/*Retorna a la vista del reloj sin modificar nada*/
-(IBAction)cancelPressed:(UIBarButtonItem *)sender {
    //NSLog(@"************************************************************** CellDetailRelojOption");
    //NSLog(@"****************************** cancelPressed");
    //NSLog(@"Button Cancel CLOCK pressed");
    _cancelButtonPressed=YES;
    [self dismissViewControllerAnimated:YES completion:NULL];
}
/*Detecta las opciones pulsadas para mostrar la fecha*/
-(IBAction)switchPressed:(UIBarButtonItem *)sender{
    //NSLog(@"************************************************************** CellDetailRelojOption");
    //NSLog(@"****************************** switchPressed");
    _cancelButtonPressed=NO;
    NSString *formatoFecha =@"";
    [self saveDateStringWithSwitchState:formatoFecha];
}

@end
