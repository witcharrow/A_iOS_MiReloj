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
@synthesize done=_done;

-(id) initWithName:(NSString *)name done:(BOOL)done{
    self = [super init];
    
    if (self){
        self.name=name;
        self.done=done;
    }
    
    return self;
}

@end
