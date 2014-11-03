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


//********** MOTION BEGAN **********
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    NSLog(@"************************************************************** AppDelegate");
    NSLog(@"****************************** motionBegan");
	if (motion == UIEventSubtypeMotionShake){
		NSLog(@"shake started");
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
	}
}

//********** MOTION ENDED **********
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    NSLog(@"************************************************************** AppDelegate");
    NSLog(@"****************************** motionEnded");
}

//********** MOTION CANCELLED **********
//(Triggered when a shake is interrupted (e.g. by an incoming call)
- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    NSLog(@"************************************************************** AppDelegate");
    NSLog(@"****************************** motionCancelled");
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
}
- (void)applicationWillEnterForeground:(UIApplication *)application{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}
- (void)applicationDidBecomeActive:(UIApplication *)application{
    NSLog(@"************************************************************** AppDelegate");
    NSLog(@"****************************** applicationDidBecomeActive");
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [self becomeFirstResponder];
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
        [self becomeFirstResponder];
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
