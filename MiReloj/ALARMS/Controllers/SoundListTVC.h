//
//  SoundListTVC.h
//  MiReloj
//
//  Created by Alejandro on 24/08/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@class Sound;
/*Para la seleccion de sonidos*/
@class AddAlarmTVC;
@class EditAlarmTVC;


@interface SoundListTVC : UITableViewController{
    
    AVAudioPlayer *audioPlayer;
}


@property (nonatomic,strong) NSMutableArray *sounds;
@property (nonatomic,strong) Sound *sound;

-(IBAction)playAudio:(id)sender;
-(IBAction)stopTapped:(id)sender;

/*Para la seleccion de sonidos*/
//MAL @property (nonatomic,strong) IBOutlet UILabel *descripcionSonido;
@property (nonatomic,strong) AddAlarmTVC *addAlarmTVC;
@property (nonatomic,strong) EditAlarmTVC *editAlarmTVC;

@property (nonatomic, strong) IBOutlet UILabel *sonidoSeleccionado;
@property (nonatomic, strong) NSString *sonidoSeleccionadoString;
@property (nonatomic, strong) NSString *rutaSonidoSeleccionadoString;

@end
