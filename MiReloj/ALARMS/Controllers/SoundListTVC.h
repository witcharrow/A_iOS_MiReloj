//
//  SoundListTVC.h
//  MiReloj
//
//  Created by Alejandro on 24/08/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Sound;

@interface SoundListTVC : UITableViewController


@property (nonatomic,strong) NSMutableArray *sounds;
@property (nonatomic,strong) Sound *sound;



@end
