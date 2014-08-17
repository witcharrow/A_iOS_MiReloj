//
//  CellDetailRelojOptionTVC.h
//  MiReloj
//
//  Created by user11394 on 27/04/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RelojViewController;

@interface CellDetailRelojOptionTVC : UITableViewController

//Etiquetas de las 4 celdas
@property (strong,nonatomic) IBOutlet UILabel *titleLabelDOW;
@property (strong,nonatomic) IBOutlet UILabel *exampleLabelDOW;
@property (strong,nonatomic) IBOutlet UISwitch *activatedDOW;
@property (strong,nonatomic) IBOutlet UILabel *titleLabelDOM;
@property (strong,nonatomic) IBOutlet UILabel *exampleLabelDOM;
@property (strong,nonatomic) IBOutlet UISwitch *activatedDOM;
@property (strong,nonatomic) IBOutlet UILabel *titleLabelMM;
@property (strong,nonatomic) IBOutlet UILabel *exampleLabelMM;
@property (strong,nonatomic) IBOutlet UISwitch *activatedMM;
@property (strong,nonatomic) IBOutlet UILabel *titleLabelYY;
@property (strong,nonatomic) IBOutlet UILabel *exampleLabelYY;
@property (strong,nonatomic) IBOutlet UISwitch *activatedYY;

//Etiqueta para la fecha
@property (nonatomic, strong) IBOutlet UILabel *fechaResultado;
@property (nonatomic, strong) NSString *fechaResultadoString;
@property (nonatomic, readwrite) RelojViewController *fechaToShow;
@property (nonatomic, strong) NSMutableString *stringDate;

//Estado de los switch
@property (assign) BOOL userHasActivatedDOW;
@property (assign) BOOL userHasActivatedDOM;
@property (assign) BOOL userHasActivatedMM;
@property (assign) BOOL userHasActivatedYY;

@property (assign) BOOL cancelButtonPressed;

-(IBAction)switchPressed:(UIBarButtonItem *)sender;
-(IBAction)cancelPressed:(UIBarButtonItem *)sender;

@end
