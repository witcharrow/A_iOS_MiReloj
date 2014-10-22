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
@property (nonatomic,strong) NSString *nameToShow;
@property (nonatomic,strong) NSString *alarmTimeToShow;
@property (nonatomic,strong) NSString *alarmTimeToParse;
@property (nonatomic,strong) NSString *sound;
@property (nonatomic,strong) NSString *soundPath;
@property (nonatomic,assign) BOOL activated;
@property (nonatomic,assign) BOOL vibrationOn;

-(id) initWithName:(NSString *)name
initWithNameToShow:(NSString *)nameToShow
 initWithalarmTime:(NSString *)alarmTimeToShow
    initWithString:(NSString *)alarmTimeToParse
     initWithSound:(NSString *)sound
 initWithSoundPath:(NSString *)soundPath
         activated:(BOOL)activated
       vibrationOn:(BOOL)vibrationOn;

@end
