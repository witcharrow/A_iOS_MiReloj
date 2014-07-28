//
//  MasterViewController.m
//  MiReloj
//
//  Created by user11394 on 27/04/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import "ListAlarmsMVC.h"
#import "Alarm.h"

@interface ListAlarmsMVC ()
@end

@implementation ListAlarmsMVC

@synthesize alarms = _alarms;
@synthesize titleLabelHHMM=_titleLabelHHMM;
@synthesize titleLabelName=_titleLabelName;
@synthesize activatedAlarm=_activatedAlarm;
@synthesize userHasActivatedAlarm=_userHasActivatedAlarm;

enum{ALARMAS,RELOJ};

- (void)awakeFromNib{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad{
    [super viewDidLoad];
	self.title = NSLocalizedString(@"_listaAlarmas",@"LISTA ALARMAS EN/SP");
    
    /*PARA PRUEBAS*/
    
    self.alarms = [[NSMutableArray alloc]init];
    Alarm *alarm = [[Alarm alloc] initWithName:@"12:00 16/03"
                                     alarmName:@"Mi Primera Alarma"
                                     activated:YES];
    
    self.titleLabelHHMM.text = self.alarm.alarmHHMM;
    self.titleLabelName.text = self.alarm.alarmName;
    self.alarmaResultadoString = self.titleLabelHHMM.text;
    
    [self.alarms addObject:alarm];
    [self.tableView reloadData];
    
    /*
    self.titleLabelHHMM.text = NSLocalizedString(@"_dayOfWeek",@"LUNES EN/SP");
    self.titleLabelName.text = NSLocalizedString(@"_monday",@"LUNES EN/SP");
    _titleLabelName.text=_alarmaResultadoString;*/
    
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
/*
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
*/    
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
/*- (void)insertNewObject:(id)sender{
    if (!_alarms) {
        _alarms = [[NSMutableArray alloc] init];
    }
    [_alarms insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
     
}*/

#pragma mark - Table View data source
/*Devuelve una unica seccion*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
/*Devuelve el numero de alarmas (filas) por seccion*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.alarms.count;
}
/*TODO*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier=@"alarmData";
    Alarm *currentAlarm = [self.alarms objectAtIndex:indexPath.row];
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.textLabel.text = currentAlarm.alarmName;
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
    }
    
    //??NSDate *dateAlarm = _alarms[indexPath.row];
    //??cell.textLabel.text = [dateAlarm description];
    
    return cell;
}
/*- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}*/
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_alarms removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
/*- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        NSDate *object = _alarms[indexPath.row];
        //self.detailViewController.detailItem = object;
    }
}*/
/*Permite mover las filas*/
/*- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}*/
/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = _alarms[indexPath.row];
        //[[segue destinationViewController] setDetailItem:object];
    }
}


-(void)swipeRecognized:(UISwipeGestureRecognizer *)swipe{
    if(swipe.direction==UISwipeGestureRecognizerDirectionLeft){
        [(UITabBarController *)self.tabBarController setSelectedIndex:RELOJ];
    }
    if(swipe.direction==UISwipeGestureRecognizerDirectionRight){
        [(UITabBarController *)self.tabBarController setSelectedIndex:RELOJ];
    }
}

#pragma mark - IBActions
/*Retorna a la vista del reloj sin modificar nada*/
-(IBAction)cancelPressed:(UIBarButtonItem *)sender {
    NSLog(@"Button Cancel ALARM pressed");
    /*
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    ([defaults boolForKey:@"userHasActivatedAlarm"])?[defaults setBool:NO forKey:@"userHasActivatedAlarm"]:[defaults setBool:NO forKey:@"userHasActivatedAlarm"];
    //Guardamos el estado de los switch
    [defaults synchronize];
     */
    [self dismissViewControllerAnimated:YES completion:NULL];
}
/*Detecta las opciones pulsadas para mostrar la fecha*/
-(IBAction)switchPressed:(UIBarButtonItem *)sender{
    NSString *formatoFecha =@"";
    /*Guardamos el estado del switch*/
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (_activatedAlarm.isOn) {
        NSLog(@"activatedAlarm ON");
        formatoFecha = [formatoFecha stringByAppendingString:@"HH,MM"];
        [defaults setBool:YES forKey:@"userHasActivatedAlarm"];
    }
    else{
        NSLog(@"activatedAlarm OFF");
        [defaults setBool:NO forKey:@"userHasActivatedAlarm"];
    }
    //Borramos el ultimo caracater de la cadena de formato (la coma).
    /*formatoFecha = [formatoFecha substringToIndex:formatoFecha.length-(formatoFecha.length>0)];
    (!self.idiomaActualIngles)?[self setDateToShowSP:formatoFecha]:[self setDateToShowEN:formatoFecha];
    */
    //Guardamos el estado de los switch
    [defaults synchronize];
}

@end
