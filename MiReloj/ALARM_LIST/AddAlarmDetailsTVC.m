//
//  AddAlarmDetailsTVC.m
//  MiReloj
//
//  Created by user11394 on 16/05/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import "AddAlarmDetailsTVC.h"

@interface AddAlarmDetailsTVC ()

@end

@implementation AddAlarmDetailsTVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBActions
/*Retorna a la vista del reloj sin modificar nada*/
-(IBAction)cancelPressed:(UIBarButtonItem *)sender {
    NSLog(@"Button Cancel ALARM pressed");
    /*
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
     ([defaults boolForKey:@"userHasActivatedAlarm"])?[defaults setBool:NO forKey:@"userHasActivatedAlarm"]:[defaults setBool:NO forKey:@"userHasActivatedAlarm"];
     //Guardamos el estado de los switch
     [defaults synchronize];
     */
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
