//
//  RelojViewController.m
//  RelojDeOficina
//
//  Created by user11394 on 18/04/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import "RelojViewController.h"
#import "CellDetailRelojOptionTVC.h"

@interface RelojViewController ()

@end


@implementation RelojViewController

enum{RELOJ,ALARMAS};
@synthesize dateToShowEN;
@synthesize dateToShowSP;
@synthesize timerLabelDMA;
@synthesize idiomaInicialApp=_idiomaInicialApp;
@synthesize idiomaActualApp=_idiomaActualApp;

#pragma mark - View lifecycle
-(void)viewDidLoad {
    [super viewDidLoad];
    //NSLog(@"************************************************************** RelojViewController");
    //NSLog(@"****************************** viewDidLoad");
    
    self.title = NSLocalizedString(@"_miReloj",@"miRELOJ EN/SP");
    //Opciones para la hora
    timer = [NSTimer scheduledTimerWithTimeInterval:0.5
                                             target:self
                                           selector:@selector(updateTimer)
                                           userInfo:nil
                                            repeats:YES];
    
    //Opciones para la fecha
    NSUserDefaults *userPreferences=[NSUserDefaults standardUserDefaults];
    NSString *date=[userPreferences stringForKey:@"fechaModificada"];
    if (![date isEqualToString:@""]){
        //NSLog(@"la fecha del usuario o es nula, o esta vacia");
        if (date == NULL){
            //NSLog(@"la fecha del usuario es la fecha por defecto");
            NSDateFormatter *dateDMA = [[NSDateFormatter alloc]init];
            [dateDMA setDateFormat:@"EEEE,dd,MMMM,yyyy"];
            NSString *fecha=[dateDMA stringFromDate:[NSDate date]];
            //NSLog(@"%@",fecha);
            //Idioma Vista
            if (!self.idiomaActualIngles){
                [self setDateToShowSP:fecha];
                _idiomaInicialApp=@"es";
            }
            else{
                [self setDateToShowEN:fecha];
                _idiomaInicialApp=@"en";
            }
            
        }
        else{
            //NSLog(@"la fecha del usuario es: %@",date);
            if([_idiomaActualApp isEqualToString:_idiomaInicialApp]){
                self.timerLabelDMA.text=date;
            }
            else{
                //NSLog(@"El idioma ha cambiado, reiniciamos la fecha y los switch por defecto.");
                NSDateFormatter *dateDMA = [[NSDateFormatter alloc]init];
                [dateDMA setDateFormat:@"EEEE,dd,MMMM,yyyy"];
                NSString *fecha=[dateDMA stringFromDate:[NSDate date]];
                //NSLog(@"%@",fecha);
                //Idioma Vista
                if (!self.idiomaActualIngles){
                    [self setDateToShowSP:fecha];
                    _idiomaInicialApp=@"es";
                }
                else{
                    [self setDateToShowEN:fecha];
                    _idiomaInicialApp=@"en";
                }
            }
        }
    }
    
    //Transicion entre pestanas
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc]
                                           initWithTarget:self
                                           action:@selector(swipeRecognized:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc]
                                            initWithTarget:self
                                            action:@selector(swipeRecognized:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
}
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    //NSLog(@"************************************************************** RelojViewController");
    //NSLog(@"****************************** initWithNibName");
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)didReceiveMemoryWarning{
    //NSLog(@"************************************************************** RelojViewController");
    //NSLog(@"****************************** didReceiveMemoryWarning");
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    //NSLog(@"************************************************************** RelojViewController");
    //NSLog(@"****************************** viewWillDisappear");
    [super viewWillDisappear:animated];
    if (!self.idiomaActualIngles){
        _idiomaActualApp=@"es";
    }
    else{
        _idiomaActualApp=@"en";
    }
}
#pragma mark - Help Methods
/*Establece los labels para el reloj*/
-(void)updateTimer {
    ////NSLog(@"************************************************************** RelojViewController");
    ////NSLog(@"****************************** updateTimer");
    NSDateFormatter *formatterHH = [[NSDateFormatter alloc] init];
    NSDateFormatter *formatterMM = [[NSDateFormatter alloc] init];
    NSDateFormatter *formatterSS = [[NSDateFormatter alloc] init];
    [formatterHH setDateFormat:@"HH"];
    [formatterMM setDateFormat:@"MM"];
    [formatterSS setDateFormat:@"ss"];
    timerLabelHH.text = [formatterHH stringFromDate:[NSDate date]];
    timerLabelMM.text = [formatterMM stringFromDate:[NSDate date]];
    timerLabelSS.text = [formatterSS stringFromDate:[NSDate date]];
}
/*Reconoce el gesto de deslizar para moverse entre pestañas*/
-(void)swipeRecognized:(UISwipeGestureRecognizer *)swipe{
    //NSLog(@"************************************************************** RelojViewController");
    //NSLog(@"****************************** swipeRecognized");
    if(swipe.direction==UISwipeGestureRecognizerDirectionLeft){
        [(UITabBarController *)self.tabBarController setSelectedIndex:ALARMAS];
    }
    if(swipe.direction==UISwipeGestureRecognizerDirectionRight){
        [(UITabBarController *)self.tabBarController setSelectedIndex:ALARMAS];
    }
}
/*Detecta el idioma actual*/
-(BOOL) idiomaActualIngles{
    //NSLog(@"************************************************************** RelojViewController");
    //NSLog(@"****************************** ¿idiomaActualIngles?");
    //Obtener idioma actual
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
-(void) setDateToShowSP:(NSString *)fecha{
    //NSLog(@"************************************************************** RelojViewController");
    //NSLog(@"****************************** setDateToShowSP");
    NSArray *listFechaItems = [fecha componentsSeparatedByString:@","];
    NSString *weekDay = [listFechaItems objectAtIndex:0];
    NSString *day = [listFechaItems objectAtIndex:1];
    NSString *month = [listFechaItems objectAtIndex:2];
    NSString *year = [listFechaItems objectAtIndex:3];
    
    
    NSArray *spWeekDay = [NSArray arrayWithObjects: @"Lunes",@"Martes",@"Miércoles",@"Jueves",@"Viernes",@"Sábado",@"Domingo",
                          nil];
    NSArray *enWeekDay = [NSArray arrayWithObjects: @"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday",@"Saturday",@"Sunday",
                          nil];
    for (int i=0; i<[spWeekDay count]; i++) {
        weekDay=[weekDay stringByReplacingOccurrencesOfString:[enWeekDay objectAtIndex:i]
                                                   withString:[spWeekDay objectAtIndex:i]];
    }
    
    NSArray *spMonths = [NSArray arrayWithObjects: @"Enero",@"Febrero",@"Marzo",@"Abril",@"Mayo",@"Junio",@"Julio",@"Agosto",@"Septiembre",@"Octubre",@"Noviembre",@"Diciembre",
                         nil];
    NSArray *enMonths = [NSArray arrayWithObjects: @"January",@"February",@"March",@"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"December",
                         nil];
    for (int i=0; i<[spMonths count]; i++) {
        month=[month stringByReplacingOccurrencesOfString:[enMonths objectAtIndex:i]
                                               withString:[spMonths objectAtIndex:i]];
    }
    timerLabelDMA.text=[NSString stringWithFormat:@"%@, %@ de %@ de %@",weekDay,day,month,year];
}
/*Hace un split de la fecha y la muestra en ingles*/
-(void) setDateToShowEN:(NSString *)fecha{
    //NSLog(@"************************************************************** RelojViewController");
    //NSLog(@"****************************** setDateToShowEN");
    NSArray *listFechaItems = [fecha componentsSeparatedByString:@","];
    NSString *weekDay = [listFechaItems objectAtIndex:0];
    NSString *day = [listFechaItems objectAtIndex:1];
    NSString *month = [listFechaItems objectAtIndex:2];
    NSString *year = [listFechaItems objectAtIndex:3];
    timerLabelDMA.text=[NSString stringWithFormat:@"%@, %@ %@ %@",weekDay,day,month,year];
}

#pragma mark - View delegate
/*Enviamos a la pantalla de opciones la cadena de la fecha actual del reloj*/
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //NSLog(@"************************************************************** RelojViewController");
    //NSLog(@"****************************** prepareForSegue");
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"editLabelDate"]) {
        //NSLog(@"prepareForSegue-->editLabelDATE");
        UINavigationController *navCon = segue.destinationViewController;
        CellDetailRelojOptionTVC *labelDMA =[navCon.viewControllers objectAtIndex:0];
        labelDMA.fechaResultadoString=self.timerLabelDMA.text;
        //NSLog(@"prepareForSegue-->timerLabelDMA: %@",labelDMA.fechaResultadoString);
    }
}
#pragma mark - IBActions
/*Modificadas las opciones de la fecha, recogemos la cadena editada por el usuario*/
-(IBAction)unwindFromViewController:(UIStoryboardSegue *)sender {
    //NSLog(@"************************************************************** RelojViewController");
    //NSLog(@"****************************** unwindFromViewController");
    //NSLog(@"from segue CellDetailRelojOptionTVC");
    if ([sender.sourceViewController isKindOfClass:[CellDetailRelojOptionTVC class]]) {
        //NSLog(@"from view controller OPTIONS-->OK");
        CellDetailRelojOptionTVC *tvcOptions = sender.sourceViewController;
        self.timerLabelDMA.text=tvcOptions.fechaResultado.text;
        NSString *fechaModificada= self.timerLabelDMA.text;        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:fechaModificada
                     forKey:@"fechaModificada"];
        [defaults synchronize];
    }
}


@end
