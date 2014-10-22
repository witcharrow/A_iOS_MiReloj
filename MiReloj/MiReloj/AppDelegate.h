	//
//  AppDelegate.h
//  MiReloj
//
//  Created by user11394 on 27/04/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "sqlite3.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    sqlite3 *alarmsDB;
    NSString *alarmsDatabasePath;
    SystemSoundID _notificationSound; //para las notificaciones locales
}

@property (strong, nonatomic) UIAlertView *notificationAlert; // para las notificaciones locales

@property (strong, nonatomic) NSString *statusDB;
@property (strong, nonatomic) NSString *nameAlarmField;
@property (strong, nonatomic) NSString *hour;
@property (strong, nonatomic) NSString *minute;
@property (strong, nonatomic) NSString *soundAlarmField;


@property (strong, nonatomic) UIWindow *window;

@end
