//
//  Option.h
//  MiReloj
//
//  Created by user11394 on 27/04/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Option : NSObject

@property (nonatomic, copy) NSString *optionName;
@property (nonatomic, copy) NSString *optionExample;
@property (nonatomic, assign) BOOL visible;

-(id)initWithName:(NSString *)optionName
    optionExample:(NSString *)optionExample
          visible:(BOOL)visible;



@end
