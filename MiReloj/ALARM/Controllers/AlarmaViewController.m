//
//  AlarmaViewController.m
//  RelojDeOficina
//
//  Created by user11394 on 19/04/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import "AlarmaViewController.h"


@interface AlarmaViewController ()

@end

@implementation AlarmaViewController

enum{ALARMAS,RELOJ};

@synthesize dateTimePickerString;

- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
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
    
    //Boton para establecer Alarma
    UIButton *setAlarm = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    setAlarm.frame = CGRectMake(40,272,245,30);
    [setAlarm setTitle:NSLocalizedString(@"_setAlarm",@"Establecer Alarmas EN/SP") forState:UIControlStateNormal];
    [setAlarm addTarget:self
                 action:@selector(alarmSetButtonTapped)
       forControlEvents:UIControlEventTouchUpInside];
    [setAlarm addTarget:self
                 action:@selector(mostrarMensaje)
       forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:setAlarm];
    
    //IDIOMA DATE_PICKER
    //UIDatePicker *datePickerLanguage = (UIDatePicker *)self.window.rootViewController;
    NSLocale *english =[[NSLocale alloc] initWithLocaleIdentifier:@"en"];
    NSLocale *spanish =[[NSLocale alloc] initWithLocaleIdentifier:@"es"];
    if(self.idiomaActualIngles){
        [datePicker setLocale:english];
        NSLog(@"picker en ingles)");
    }
    else{
        [datePicker setLocale:spanish];
        NSLog(@"picker en español)");
    }
}

-(void)alarmSetButtonTapped{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    if(self.idiomaActualIngles){
        dateFormatter.timeZone = [NSTimeZone defaultTimeZone];
        dateFormatter.timeStyle = NSDateFormatterShortStyle;
        dateFormatter.dateStyle = NSDateFormatterShortStyle;
    }
    else{
        [dateFormatter setDateFormat:@"dd/MM/yyyy HH:MM"];
    }
    NSString *dateTimeString = [dateFormatter stringFromDate: datePicker.date];
    dateTimePickerString = dateTimeString;
    
    
    NSLog(@"Alarm Set Button Tapped:%@",dateTimeString);
}

-(void) scheduleLocalNotificationWithDate: (NSDate *) fireDate{
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    notification.fireDate = fireDate;
    notification.alertBody = NSLocalizedString(@"_Timetowakeup",@"ARRIBA! EN/SP");
    notification.alertAction = NSLocalizedString(@"_Snooze",@"ARRIBA! EN/SP");
    //notification.soundName = @"alarm-clock-bell.caf";
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
    NSLog(@"createNotification");
}

-(void)mostrarMensaje{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"_pregunta",@"pregunta EN/SP")
                                                    message:dateTimePickerString
                                                   delegate:self
                                          cancelButtonTitle:NSLocalizedString(@"_maybeNot",@"cancel EN/SP")
                                          otherButtonTitles:NSLocalizedString(@"_go",@"go! EN/SP")
                          , nil];
    
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"GO!"] |
       [title isEqualToString:@"¡ADELANTE!"])
    {
        NSLog(@"Button OK was selected.");
        [self scheduleLocalNotificationWithDate:datePicker.date];
    }
    else if([title isEqualToString:@"Maybe not..."] |
            [title isEqualToString:@"Quizás no..."])
    {
        NSLog(@"Button Later was selected.");
    }
}

-(void)swipeRecognized:(UISwipeGestureRecognizer *)swipe{
    
    if(swipe.direction==UISwipeGestureRecognizerDirectionLeft){
        [(UITabBarController *)self.tabBarController setSelectedIndex:RELOJ];
        
    }
    if(swipe.direction==UISwipeGestureRecognizerDirectionRight){
        [(UITabBarController *)self.tabBarController setSelectedIndex:RELOJ];
    }
}

-(BOOL) idiomaActualIngles{
    //Obtener idioma actual
    BOOL idiomaEN=NO;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *idiomas = [defaults objectForKey:@"AppleLanguages"];
    NSString *idiomaActual = [idiomas objectAtIndex:0];
    NSLog(@"lenguaje actual: %@",idiomaActual);
    if([idiomaActual isEqualToString:@"en"]){
        idiomaEN=YES;
    }
    return idiomaEN;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
