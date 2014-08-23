//
//  Alarm.h
//  MiReloj
//
//  Created by Alejandro on 18/08/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Alarm : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *alarmTime;
@property (nonatomic,strong) NSString *sound;
@property (nonatomic,assign) BOOL activated;
@property (nonatomic,assign) BOOL vibrationOn;

-(id) initWithName:(NSString *)name
 initWithalarmTime:(NSString *)alarmTime
     initWithSound:(NSString *)sound
         activated:(BOOL)activated
       vibrationOn:(BOOL)vibrationOn;

@end
