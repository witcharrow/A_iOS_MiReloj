//
//  AddAlarmaTableViewController.h
//  MiReloj
//
//  Created by user11394 on 29/04/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ListaAlarmasViewController;

@interface AddAlarmaTableViewController : UITableViewController

- (IBAction)addButtonPressed:(id)sender;
- (IBAction)cancelButtonPressed:(id)sender;

@property (nonatomic, strong) ListaAlarmasViewController *listaAlarmasLVC;
@property (nonatomic, strong) IBOutlet UITextField *descriptionAlarmTextView;

@end