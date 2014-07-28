//
//  ListaAlarmasViewController.h
//  MiReloj
//
//  Created by user11394 on 29/04/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListaAlarmasViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *alarms;

- (void)refreshList;

@end
