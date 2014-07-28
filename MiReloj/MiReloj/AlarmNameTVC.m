//
//  AlarmNameTVC.m
//  MiReloj
//
//  Created by user11394 on 16/05/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import "AlarmNameTVC.h"
#import "AddAlarmDetailsTVC.h"
#import "Alarm.h"

@implementation AlarmNameTVC

@synthesize alarmName=_alarmName;
@synthesize alarmTaskLlistVC=_alarmTaskLlistVC;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions
-(IBAction)doneButton:(id)sender{
}

#pragma mark - View delegate
/*Enviamos a la pantalla de opciones la cadena de la fecha actual del reloj*/
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"editLabelDate"]) {
        NSLog(@"editLabelDATE");
        UINavigationController *navCon = segue.destinationViewController;
        AddAlarmDetailsTVC *labelAlarmName =[navCon.viewControllers objectAtIndex:0];
        //NSLog(@"timerLabelDMA: %@:",self.timerLabelDMA.text);
    }
}

@end
