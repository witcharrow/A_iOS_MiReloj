//
//  RelojViewController.h
//  RelojDeOficina
//
//  Created by user11394 on 18/04/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RelojViewController : UIViewController{    
    //Horas, minutos y segundos
    IBOutlet UILabel *timerLabelHH;
    IBOutlet UILabel *timerLabelMM;
    IBOutlet UILabel *timerLabelSS;
    NSTimer *timer;
    
}

@property (readonly) BOOL idiomaActualIngles;
@property (strong,nonatomic) NSString *dateToShowEN;
@property (strong,nonatomic) NSString *dateToShowSP;
@property (strong,nonatomic) IBOutlet UILabel *timerLabelDMA;
@property (strong,nonatomic) NSString *idiomaInicialApp;
@property (strong,nonatomic) NSString *idiomaActualApp;

-(IBAction)unwindFromViewController:(UIStoryboardSegue *)sender;

@end
