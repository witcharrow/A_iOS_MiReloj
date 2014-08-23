//
//  Alarm.m
//  MiReloj
//
//  Created by Alejandro on 18/08/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import "Alarm.h"

@implementation Alarm

@synthesize name=_name;
@synthesize alarmTime=_alarmTime;
@synthesize sound=_sound;
@synthesize activated=_activated;
@synthesize vibrationOn=_vibrationOn;

-(id) initWithName:(NSString *)name
 initWithalarmTime:(NSString *)alarmTime
     initWithSound:(NSString *)sound
         activated:(BOOL)activated
       vibrationOn:(BOOL)vibrationOn{
    
    self = [super init];
    
    if (self){
        self.name=name;
        self.alarmTime=alarmTime;
        self.sound=sound;
        self.activated=activated;
    }
    
    return self;
}

@end
