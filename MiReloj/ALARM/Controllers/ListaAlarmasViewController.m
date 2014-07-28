//
//  ListaAlarmasViewController.m
//  MiReloj
//
//  Created by user11394 on 29/04/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import "ListaAlarmasViewController.h"
#import "Alarm.h"
#import "AddAlarmaTableViewController.h"
#import "EditAlarmaTableViewController.h"

@interface ListaAlarmasViewController ()

@end

@implementation ListaAlarmasViewController

enum{ALARMAS,RELOJ};

@synthesize alarms = _alarms;

- (id)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View lifecycle
-(void)viewDidLoad{
    [super viewDidLoad];
    self.alarms = [[NSMutableArray alloc]init];
    /*PARA PRUEBAS ANTES DE EDICION
    self.alarms = [[NSMutableArray alloc]init];
    Alarm *alarm = [[Alarm alloc] initWithName:@"_MyFIRSTALARM" done: NO];
    [self.alarms addObject:alarm];
    Alarm *doneAlarm = [[Alarm alloc] initWithName:@"_MYFIRSTDONEALARM" done:YES];
    [self.alarms addObject:doneAlarm];
    [self.tableView reloadData];*/
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
-(void)viewDidUnload{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
/*NECESARIO hacemos que la vista se actualice al editar*/
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source
/*La tabla solo tienes 1 seccion*/
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
/*Devuelve el numero de filas en la seccion*/
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.alarms.count;
}
/*Realiza operaciones en funcion del identificador de alarma*/
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"cellForRowAtIndexPath");
    static NSString *activatedCellIdentifier = @"activatedAlarmCell";
    static NSString *deactivatedCellIdentifier = @"deactivatedAlarmCell";
    Alarm *currentAlarm = [self.alarms objectAtIndex:indexPath.row];
    NSString *cellIdentifier = currentAlarm.activated?deactivatedCellIdentifier:activatedCellIdentifier;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:activatedCellIdentifier];
    }
    cell.textLabel.text=currentAlarm.alarmHHMM;
    return cell;
}


/*Las celdas son editables*/
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
//##TODO: modificar esta parte para que se puedan borrar las filas de las alarmas.
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.alarms removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
// Override to support rearranging the table view.
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath{
}
// Override to support conditional rearranging of the table view.
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

#pragma mark - Table view delegate
// In a storyboard-based application, you will often want to do a little preparation before navigation
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"AddAlarmSegue"]) {
        UINavigationController *navCon = segue.destinationViewController;
        AddAlarmaTableViewController *addAlarmaTaskVC = [navCon.viewControllers objectAtIndex:0];
        addAlarmaTaskVC.listaAlarmasLVC = self;
    }
    else if ([segue.identifier isEqualToString:@"EditActivatedAlarmSegue"] || [segue.identifier isEqualToString:@"EditDeactivatedAlarmSegue"]){
        EditAlarmaTableViewController *editAlarmVC = segue.destinationViewController;
        editAlarmVC.alarm = [self.alarms objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    }
}

#pragma mark - Help Methods
/*Desplazamiento horizontal entre pesatañas	*/
-(void)swipeRecognized:(UISwipeGestureRecognizer *)swipe{
    if(swipe.direction==UISwipeGestureRecognizerDirectionLeft){
        [(UITabBarController *)self.tabBarController setSelectedIndex:RELOJ];
    }
    if(swipe.direction==UISwipeGestureRecognizerDirectionRight){
        [(UITabBarController *)self.tabBarController  setSelectedIndex:RELOJ];
    }
}
-(void)refreshList {
    [self.tableView reloadData];
}
@end
