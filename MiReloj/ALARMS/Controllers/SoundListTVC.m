//
//  SoundListTVC.m
//  MiReloj
//
//  Created by Alejandro on 24/08/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import "SoundListTVC.h"
#import "Sound.h"
@interface SoundListTVC ()

@end

@implementation SoundListTVC

@synthesize sounds=_sounds;
@synthesize sound=_sound;


- (id)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"_SelectSound",@"Select Sound EN/SP");
    
    //Creamos la lista de sonidos.
    self.sounds = [[NSMutableArray alloc] init];

    Sound *noSound = [[Sound alloc]initWithName: [NSString stringWithFormat:@"%@ %@", @"\ue333", NSLocalizedString(@"_NoneSound",@"Titulo SONIDO EN/SP")]
                                   initWithPath:@"."];
    Sound *sound1 = [[Sound alloc]initWithName:  [NSString stringWithFormat:@"%@ %@", @"\u23F0", NSLocalizedString(@"Clock_Ringing",@"Clock_Ringing SONIDO EN/SP")]
                                  initWithPath:@"."];
    Sound *sound2 = [[Sound alloc]initWithName:  [NSString stringWithFormat:@"%@ %@", @"\ue411",NSLocalizedString(@"Baby_Crying",@"Baby_Crying SONIDO EN/SP")]
                                  initWithPath:@"."];
    Sound *sound3 = [[Sound alloc]initWithName:  [NSString stringWithFormat:@"%@ %@", @"\ue154", NSLocalizedString(@"Card_Reader",@"Card_Reader SONIDO EN/SP")]
                                  initWithPath:@"."];
    Sound *sound4 = [[Sound alloc]initWithName:  [NSString stringWithFormat:@"%@ %@", @"\ue037", NSLocalizedString(@"Curch_Bells",@"Curch_Bells SONIDO EN/SP")]
                                  initWithPath:@"."];
    Sound *sound5 = [[Sound alloc]initWithName:  [NSString stringWithFormat:@"%@ %@", @"\ue432", NSLocalizedString(@"Police" ,@"Police SONIDO EN/SP")]
                                  initWithPath:@"."];
    
    [self.sounds addObject:noSound];
    [self.sounds addObject:sound1];
    [self.sounds addObject:sound2];
    [self.sounds addObject:sound3];
    [self.sounds addObject:sound4];
    [self.sounds addObject:sound5];
    
    [self.tableView reloadData];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // Return the number of rows in the section.
    return self.sounds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *soundCell=@"soundCell";
    Sound *currentSound = [self.sounds objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:soundCell];
    cell.textLabel.text = currentSound.nameSound;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
