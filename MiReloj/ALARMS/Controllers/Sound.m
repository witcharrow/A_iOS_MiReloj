//
//  Sound.m
//  MiReloj
//
//  Created by Alejandro on 24/08/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import "Sound.h"

@implementation Sound

@synthesize nameSound=_nameSound;
@synthesize pathSound=_pathSound;

-(id) initWithName:(NSString *)nameSound
      initWithPath:(NSString *)pathSound{
    
    self = [super init];
    
    if (self){
        self.nameSound=nameSound;
        self.pathSound=pathSound;
    }
    
    return self;
}

@end
