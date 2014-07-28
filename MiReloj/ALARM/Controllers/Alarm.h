//
//  Alarm.h
//  MiReloj
//
//  Created by user11394 on 29/04/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Alarm : NSObject

@property (nonatomic, copy) NSString *alarmHHMM;
@property (nonatomic, copy) NSString *alarmName;
@property (nonatomic, assign) BOOL activated;

-(id)initWithName:(NSString *)alarmHHMM
        alarmName:(NSString *)alarmName
        activated:(BOOL)activated;



@end
