//
//  AppDelegate.m
//  MiReloj
//
//  Created by user11394 on 27/04/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import "AppDelegate.h"
#import "RelojViewController.h"

@implementation AppDelegate

enum{RELOJ,ALARMAS};

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
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
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   NSCalendar *gregCalendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComponent = [gregCalendar components:NSYearCalendarUnit |
                                       NSMonthCalendarUnit |                                               NSDayCalendarUnit |
                                       NSHourCalendarUnit | NSMinuteCalendarUnit
                                                      fromDate:[NSDate date]];
    [dateComponent setYear:2014];
    [dateComponent setMonth:10];
    [dateComponent setDay:01];
    [dateComponent setHour:22];
    [dateComponent setMinute:00];
    UIDatePicker *HHMM = [[UIDatePicker alloc]init];
    [HHMM setDate:[gregCalendar dateFromComponents:dateComponent]];
    
    //enum{NSMinuteCalendarUnit=1};
    
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    [notification setAlertBody:@"ALARMA TO MOLONA DE PRUEBA"];
    [notification setFireDate:HHMM.date];
    [notification setTimeZone:[NSTimeZone defaultTimeZone]];
    //[notification setRepeatInterval:NSMinuteCalendarUnit];
    //[notification setSoundName:@"baby_crying"];
    //[notification setAlertLaunchImage:@"AppIcon29x29.png"];
    [application setScheduledLocalNotifications:[NSArray arrayWithObject:notification]];
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
