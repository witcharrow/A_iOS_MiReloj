//
//  Option.m
//  MiReloj
//
//  Created by user11394 on 27/04/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import "Option.h"

@implementation Option

@synthesize optionName = _optionName;
@synthesize visible = _visible;
@synthesize optionExample = _optionExample;

-(id)initWithName:(NSString *)optionName
    optionExample:(NSString *)optionExample
          visible:(BOOL)visible{
    self = [super init];
    if (self){
        self.optionName=optionName;
        self.optionExample=optionExample;
        self.visible=visible;
    }
    return self;
}


@end

