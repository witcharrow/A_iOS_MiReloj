//
//  AlarmListTVC.m
//  MiReloj
//
//  Created by Alejandro on 18/08/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import "AlarmListTVC.h"
#import "Alarm.h"

@interface AlarmListTVC ()

@end

@implementation AlarmListTVC

@synthesize alarms=_alarms;

enum{RELOJ,ALARMAS};

#pragma mark - View lifecycle
- (id)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    
    //Creamos la lista de alarmas.
    self.alarms = [[NSMutableArray alloc] init];
    //Creamos una alarma para la lista.
    Alarm *alarmActivated = [[Alarm alloc]initWithName:@"Alarma ACTIVADA" done:NO];
    Alarm *alarmDeactivated = [[Alarm alloc]initWithName:@"Alarma DESACTIVADA" done:YES];

    [self.alarms addObject:alarmActivated];
    [self.alarms addObject:alarmDeactivated];
    [self.tableView reloadData];
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    self.title = NSLocalizedString(@"_alarmas",@"Alarmas EN/SP");
    
    //Transicion entre pestanas
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc]
                                           initWithTarget:self
                                           action:@selector(swipeRecognized:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc]
                                            initWithTarget:self
                                            action:@selector(swipeRecognized:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
/*Devuelve el numero de secciones*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
/*Devuelve el número de filas por seccion*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.alarms.count;
}
/*Establecemos los valores de las filas*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *activatedAlarmCell=@"activatedAlarmCell";
    static NSString *deactivatedAlarmCell=@"deactivatedAlarmCell";
    
    Alarm *currentAlarm = [self.alarms objectAtIndex:indexPath.row];
    NSString *cellIdentifier = currentAlarm.done? deactivatedAlarmCell : activatedAlarmCell;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.textLabel.text = currentAlarm.name;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Help Methods
/*Reconoce el gesto de deslizar para moverse entre pestañas*/
-(void)swipeRecognized:(UISwipeGestureRecognizer *)swipe{
    
    if(swipe.direction==UISwipeGestureRecognizerDirectionLeft){
        [(UITabBarController *)self.tabBarController setSelectedIndex:RELOJ];
        
    }
    if(swipe.direction==UISwipeGestureRecognizerDirectionRight){
        [(UITabBarController *)self.tabBarController setSelectedIndex:RELOJ];
    }
}

@end
