//
//  AppDelegate.m
//  MiReloj
//
//  Created by user11394 on 27/04/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import "AppDelegate.h"
#import "RelojViewController.h"
#import "sqlite3.h"
@implementation AppDelegate

@synthesize notificationAlert = _notificationAlert;

enum{RELOJ,ALARMAS};

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
        UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
        splitViewController.delegate = (id)navigationController.topViewController;
    }
    
    // TAB_BAR_CONTROLLER
    //Assign tab bar item with titles
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    //Queremos que sea el reloj la pestana por defecto, para ello hacemos lo siguiente:
    tabBarController.selectedIndex = RELOJ;
    UITabBar *tabBar = tabBarController.tabBar;
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:RELOJ];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:ALARMAS];
    tabBarItem1.title = NSLocalizedString(@"_miReloj",@"miRELOJ EN/SP");
    tabBarItem2.title = NSLocalizedString(@"_alarmas",@"Alarmas EN/SP");
    
    //NOTIFICACION
    //Handle launching from a notification
    UILocalNotification *locationNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    if (locationNotification) {
        // Set icon badge number to zero
        application.applicationIconBadgeNumber = 1;
        [application cancelAllLocalNotifications];
    }
    
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}
- (void)applicationDidEnterBackground:(UIApplication *)application{
    NSLog(@"************************************************************** AppDelegate");
    NSLog(@"****************************** applicationDidEnterBackground");
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
 /*
    
    const char *dbpath = [alarmsDatabasePath UTF8String];
    sqlite3_stmt    *statement;
    if (sqlite3_open(dbpath, &alarmsDB) == SQLITE_OK){
        NSLog(@"Leemos base de datos");
        NSString *querySQL = [NSString stringWithFormat: @"SELECT ALARMNAME, HH, MM, SOUND FROM alarms"];
        
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(alarmsDB, query_stmt, -1, &statement, NULL) == SQLITE_OK){
            NSLog(@"OBTENEMOS DATOS base de datos");
            if (sqlite3_step(statement) == SQLITE_ROW){
                NSLog(@"OBTENEMOS FILA base de datos");
                _nameAlarmField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                _hour = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                _minute = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                _soundAlarmField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                NSLog(@"Name Alarm is %@ (%d:%d) -- %@", _nameAlarmField,
                      [_hour integerValue], [_minute integerValue],_soundAlarmField);
                _statusDB = @"Match found";
                    
            }
            else {
                _nameAlarmField= @"";
                _statusDB = @"Match not found";
                _hour=@"";
                _minute=@"";
                _soundAlarmField=@"";
            }
            sqlite3_finalize(statement);
            NSLog(@"_statusDB: %@",_statusDB );
        
            if ([_sta	tusDB isEqualToString:@"Match found"]){
                NSLog(@"Programamos Alarma %@ (%d:%d) -- %@", _nameAlarmField,
                      [_hour integerValue], [_minute integerValue],_soundAlarmField);*/
    /*
                NSCalendar *gregCalendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
                NSDateComponents *dateComponent = [gregCalendar components:NSYearCalendarUnit |
                                                   NSMonthCalendarUnit  |   NSDayCalendarUnit |
                                                   NSHourCalendarUnit   |   NSMinuteCalendarUnit fromDate:[NSDate date]];
                [dateComponent setYear:2014];
                [dateComponent setMonth:10];
                [dateComponent setDay:14];
                [dateComponent setHour:20];
                [dateComponent setMinute:22];
                UIDatePicker *HHMM = [[UIDatePicker alloc]init];
                [HHMM setDate:[gregCalendar dateFromComponents:dateComponent]];
                
                //enum{NSMinuteCalendarUnit=1};
                
                UILocalNotification *notification = [[UILocalNotification alloc]init];
                [notification setAlertBody:@"HOLA FEO APPDELEGATE"];
                [notification setFireDate:HHMM.date];
                [notification setTimeZone:[NSTimeZone defaultTimeZone]];
                //no veo que funcione...[notification setRepeatInterval:NSMinuteCalendarUnit];
                //FUNCIONA??
                [notification setSoundName:_soundAlarmField];
                //[notification setAlertLaunchImage:@"clockbird.gif"];
                //[notification setAlertAction:@"HOLA FEO"];
                [application setScheduledLocalNotifications:[NSArray arrayWithObject:notification]];
     */
     /*}
            
            
        }
       sqlite3_close(alarmsDB);
    }
    
    */
  
}
- (void)applicationWillEnterForeground:(UIApplication *)application{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}
- (void)applicationDidBecomeActive:(UIApplication *)application{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
- (void)applicationWillTerminate:(UIApplication *)application{
    NSLog(@"************************************************************** AppDelegate");
    NSLog(@"****************************** applicationWillTerminate");
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Dispose of the notification sound.
    if (_notificationSound) {
        AudioServicesDisposeSystemSoundID(_notificationSound);
    }
}
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    NSLog(@"************************************************************** AppDelegate");
    NSLog(@"****************************** didReceiveLocalNotification");
    // Play a sound and show an alert only if the application is active, to avoid doubly notifiying the user.
    if ([application applicationState] == UIApplicationStateActive) {
        // Initialize the alert view.
        if (!_notificationAlert) {
            _notificationAlert = [[UIAlertView alloc] initWithTitle:nil
                                                            message:nil
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [self setNotificationAlert:_notificationAlert];
        }
        
        // Load the notification sound.
        if (!_notificationSound) {
            NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"alarm_clock_ringing"
                                                                  ofType:@"caf"];
            NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
            AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &_notificationSound);
        }
        
        // Set the title of the alert with the notification's body.
        [_notificationAlert setTitle:[notification alertBody]];
        
        // Play the sound and show the alert.
        AudioServicesPlaySystemSound(_notificationSound);
        [_notificationAlert show];
    }
}
@end
