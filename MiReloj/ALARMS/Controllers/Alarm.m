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
@synthesize activated=_activated;

-(id) initWithName:(NSString *)name activated:(BOOL)activated{
    self = [super init];
    
    if (self){
        self.name=name;
        self.activated=activated;
    }
    
    return self;
}

@end
