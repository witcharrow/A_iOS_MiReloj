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
@synthesize nameToShow=_nameToShow;
@synthesize alarmTimeToShow=_alarmTimeToShow;
@synthesize alarmTimeToParse=_alarmTimeToParse;
@synthesize sound=_sound;
@synthesize activated=_activated;
@synthesize vibrationOn=_vibrationOn;

-(id) initWithName:(NSString *)name
initWithNameToShow:(NSString *)nameToShow
 initWithalarmTime:(NSString *)alarmTimeToShow
    initWithString:(NSString *)alarmTimeToParse
     initWithSound:(NSString *)sound
         activated:(BOOL)activated
       vibrationOn:(BOOL)vibrationOn{
    
    self = [super init];
    
    if (self){
        self.name=name;
        self.nameToShow=nameToShow;
        self.alarmTimeToShow=alarmTimeToShow;
        self.alarmTimeToParse=alarmTimeToParse;
        self.sound=sound;
        self.activated=activated;
    }
    
    return self;
}

@end
