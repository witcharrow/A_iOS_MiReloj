//
//  AlarmaViewController.h
//  RelojDeOficina
//
//  Created by user11394 on 19/04/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlarmaViewController : UIViewController <UIAlertViewDelegate>{
    
    IBOutlet UIDatePicker *datePicker; //The picker to tell how much time till the notification is called
}

@property NSString *dateTimePickerString;
@property (readonly) BOOL idiomaActualIngles;

//Notificacion y Alerta
-(void)scheduleLocalNotificationWithDate: (NSDate *) fireDate;
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

//Transicion de pantallas
-(void)swipeRecognized:(UISwipeGestureRecognizer *)swipe;

//Idiomas
-(BOOL) idiomaActualIngles;

@end
