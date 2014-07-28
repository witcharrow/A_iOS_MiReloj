//
//  Alarm.m
//  MiReloj
//
//  Created by user11394 on 29/04/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import "Alarm.h"

@implementation Alarm

@synthesize alarmHHMM = _alarmHHMM;
@synthesize alarmName=_alarmName;
@synthesize activated = _activated;

-(id)initWithName:(NSString *)alarmHHMM alarmName:(NSString *)alarmName activated:(BOOL)activated{
    self = [super init];
    if (self){
        self.alarmHHMM=alarmHHMM;
        self.alarmName=alarmName;
        self.activated=activated;
    }
    return self;
}


@end
