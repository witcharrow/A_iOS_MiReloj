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
@property (nonatomic, strong) UILabel *sonidoSeleccionado;
@property (nonatomic, strong) NSString *sonidoSeleccionadoString;
@property (nonatomic, strong) NSString *rutaSonidoSeleccionadoString;
/*Para la seleccion de sonidos*/
@property (nonatomic,strong) AddAlarmTVC *addAlarmTVC;
@property (nonatomic,strong) EditAlarmTVC *editAlarmTVC;
/*Para el paso de información a la lista de alarmas*/
@property (nonatomic,strong) UITableViewCell *celdaActual;


-(IBAction)playAudio:(id)sender;
-(IBAction)stopTapped:(id)sender;
-(IBAction)soundSelected:(id)sender;
/*Guarda las opciones pulsadas*/
-(IBAction)saveButtonPressed:(id)sender;

@end
