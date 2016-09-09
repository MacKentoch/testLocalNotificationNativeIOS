//
//  AppDelegate.m
//  testLocalNotifications
//
//  Created by MacKentoch on 09/09/2016.
//  Copyright © 2016 Erwan DATIN. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  [self registerNotification];
  [self scheduleNotification];
  
  // Override point for customization after application launch.
  return YES;
}



- (void)registerNotification {
  UIUserNotificationType types =  UIUserNotificationTypeBadge |
                                  UIUserNotificationTypeSound |
                                  UIUserNotificationTypeAlert;

  UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types
                                                                             categories:nil];
  
  [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
}


-(void) scheduleNotification {
  UILocalNotification *notification = [[UILocalNotification alloc] init];
  
//  notification.fireDate = [[NSDate date] dateByAddingTimeInterval:60*60*24];
  notification.fireDate = [[NSDate date] dateByAddingTimeInterval:60];
  notification.alertBody = @"1 minute passed then this notification came";
  
  [[UIApplication sharedApplication] scheduleLocalNotification:notification];
  
  // this will schedule the notification to fire at the fire date
  [[UIApplication sharedApplication] scheduleLocalNotification:notification];
  
  // this will fire the notification right away, it will still also fire at the date we set
//  [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}

-(void) cancelAllLocalNotifications {
  [[UIApplication sharedApplication] cancelAllLocalNotifications];
}


- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
  [self showNotificationAlert:@"hello world"
                    withTitle:@"Test local notification"];
}

-(void)showNotificationAlert:(NSString*)message withTitle:(NSString *)title{
  dispatch_async(dispatch_get_main_queue(), ^{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nonnull action) {
      
    }]];
    
    [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:alertController
                                                                                     animated:YES completion:^{
    }];
  });
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  NSLog(@"%s", __PRETTY_FUNCTION__);
  
//  application.applicationIconBadgeNumber = 0;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  NSLog(@"%s", __PRETTY_FUNCTION__);
  
//  application.applicationIconBadgeNumber = 0;
  
//  [[UIApplication sharedApplication] cancelAllLocalNotifications];
}


@end
