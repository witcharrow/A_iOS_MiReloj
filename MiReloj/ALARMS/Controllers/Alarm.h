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
@property (nonatomic,assign) BOOL done;

-(id) initWithName:(NSString *)name done:(BOOL)done;

@end
