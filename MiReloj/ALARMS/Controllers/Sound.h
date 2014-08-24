//
//  Sound.h
//  MiReloj
//
//  Created by Alejandro on 24/08/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sound : NSObject

@property (nonatomic,strong) NSString *nameSound;
@property (nonatomic,strong) NSString *pathSound;

-(id) initWithName:(NSString *)nameSound
      initWithPath:(NSString *)pathSound;

@end
