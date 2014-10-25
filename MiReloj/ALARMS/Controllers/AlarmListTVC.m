//
//  AlarmListTVC.m
//  MiReloj
//
//  Created by Alejandro on 18/08/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import "EditAlarmTVC.h"
#import "AddAlarmTVC.h"
#import "AlarmListTVC.h"
#import "Alarm.h"

@interface AlarmListTVC ()

@end

@implementation AlarmListTVC

@synthesize alarms=_alarms;
@synthesize statusDB=_statusDB;
@synthesize alarmToParse=_alarmToParse;
@synthesize nameAlarm=_nameAlarm;
@synthesize hour=_hour;
@synthesize minute=_minute;
@synthesize soundAlarm=_soundAlarm;
@synthesize soundAlarmPath=_soundAlarmPath;

enum{RELOJ,ALARMAS};

#pragma mark - View lifecycle
- (id)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
/*Array de Alarmas, Transición entre pestañas y Creación de la Base de datos para las alarmas*/
- (void)viewDidLoad{
    NSLog(@"************************************************************** AlarmListTVC");
    NSLog(@"****************************** viewDidLoad");
    [super viewDidLoad];
    
    //Creamos la lista de alarmas.
    self.alarms = [[NSMutableArray alloc] init];
                    /*************************************PRUEBAS__BORRAR********************************
                    //Creamos una alarma para la lista.
                    Alarm *alarmActivated = [[Alarm alloc]initWithName:@"Alarma ACTIVADA" done:NO];
                    Alarm *alarmDeactivated = [[Alarm alloc]initWithName:@"Alarma DESACTIVADA" done:YES];

                    [self.alarms addObject:alarmActivated];
                    [self.alarms addObject:alarmDeactivated];
                    [self.tableView reloadData];
                    **************************************+++++++++++++++********************************/
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
    
    //***********Creamos la BBDD de alarmas***********//
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    // Build the path to the database file
    alarmsDatabasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"alarmsDB_20141025_1.db"]];
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: alarmsDatabasePath ] == NO){
        NSLog(@"Creamos DB: %@",alarmsDatabasePath);
        const char *dbpath = [alarmsDatabasePath UTF8String];
        if (sqlite3_open(dbpath, &alarmsDB) == SQLITE_OK){
            char *errMsg;
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS ALARMS (ID INTEGER PRIMARY KEY AUTOINCREMENT, ALARMNAME TEXT, HH int, MM int, SOUND TEXT, SOUNDPATH TEXT)";
            if (sqlite3_exec(alarmsDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK){
                _statusDB = @"Failed to create table";
            }
            sqlite3_close(alarmsDB);
            
        } else {
            _statusDB = @"Failed to open/create database";
        }
        _statusDB = @"Success creating database";
        NSLog(@"CREADA DB con _statusDB: %@",_statusDB);
    }
    else {
        _statusDB = [NSString stringWithFormat:@"Ya existe la DB: %@",alarmsDatabasePath];
        NSLog(@"EXISTE DB con _statusDB: %@",_statusDB);
    }
    [super viewDidLoad];
}
/*Actualiza la vista de la lista de alarmas*/
- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"************************************************************** AlarmListTVC");
    NSLog(@"****************************** viewWillAppear");
    [super viewWillAppear:animated];
    [self.tableView reloadData];/*Necesario para que el prepareForSegue funcione y actualice la vista de la lista de alarmas*/
}
- (void)didReceiveMemoryWarning{
    NSLog(@"************************************************************** AlarmListTVC");
    NSLog(@"****************************** didReceiveMemoryWarning");
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
/*Devuelve el numero de secciones*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"************************************************************** AlarmListTVC");
    NSLog(@"****************************** numberOfSectionsInTableView");
    return 1;
}
/*Devuelve el número de filas por seccion*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"************************************************************** AlarmListTVC");
    NSLog(@"****************************** numberOfRowsInSection");
    return self.alarms.count;
}
/*Establecemos los valores de las filas*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"************************************************************** AlarmListTVC");
    NSLog(@"****************************** cellForRowAtIndexPath");
    
    static NSString *activatedAlarmCell=@"activatedAlarmCell";
    static NSString *deactivatedAlarmCell=@"deactivatedAlarmCell";
    
    Alarm *currentAlarm = [self.alarms objectAtIndex:indexPath.row];
    NSString *cellIdentifier = currentAlarm.activated? activatedAlarmCell : deactivatedAlarmCell;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.textLabel.text = currentAlarm.nameToShow;
    cell.detailTextLabel.text = currentAlarm.alarmTimeToShow;
    _alarmToParse=currentAlarm.alarmTimeToParse;
    _soundAlarmPath=currentAlarm.soundPath;
    NSLog(@"PATH RECOGIDO: %@",_soundAlarmPath);
    return cell;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/
/*Opciones para editar la lista de alarmas*/
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"************************************************************** AlarmListTVC");
    NSLog(@"****************************** commitEditingStyle");
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.alarms removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
/*Permite mover las filas de la lista de alarmas*/
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath{
    NSLog(@"************************************************************** AlarmListTVC");
    NSLog(@"****************************** moveRowAtIndexPath");
    Alarm *movedAlarm = [self.alarms objectAtIndex:fromIndexPath.row];
    [self.alarms removeObjectAtIndex:fromIndexPath.row];
    [self. alarms insertObject:movedAlarm atIndex:toIndexPath.row];
}
/*Metodo para reorganizar las alarmas*/
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"************************************************************** AlarmListTVC");
    NSLog(@"****************************** canMoveRowAtIndexPath");
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

#pragma mark - Navigation
/*Pasa la información del textfield a la lista de alarmas*/
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"************************************************************** AlarmListTVC");
    NSLog(@"****************************** prepareForSegue");
    /*Parte para añadir una alarma*/
    if ([segue.identifier isEqualToString:@"AddAlarmSegue"]){
        UINavigationController *navCon = segue.destinationViewController;
        AddAlarmTVC *addAlarmViewController =[navCon.viewControllers objectAtIndex:0];
        addAlarmViewController.alarmListViewController = self;
    }
    /*Parte para editar una alarma*/
    else if ([segue.identifier isEqualToString:@"EditActivatedAlarmSegue"] ||
             [segue.identifier isEqualToString:@"EditDeactivatedAlarmSegue"]){
        EditAlarmTVC *editAlarmTVC = segue.destinationViewController;
        editAlarmTVC.alarm = [self.alarms objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    }
}

#pragma mark - IBAction Methods
/*Metodo para la edición de cada fila*/
-(IBAction)editButtonPressed:(id)sender{
    NSLog(@"************************************************************** AlarmListTVC");
    NSLog(@"****************************** editButtonPressed");
    self.editing = !self.editing;
}

#pragma mark - Help Methods
/*Reconoce el gesto de deslizar para moverse entre pestañas*/
-(void)swipeRecognized:(UISwipeGestureRecognizer *)swipe{
    NSLog(@"************************************************************** AlarmListTVC");
    NSLog(@"****************************** swipeRecognized");
    
    if(swipe.direction==UISwipeGestureRecognizerDirectionLeft){
        [(UITabBarController *)self.tabBarController setSelectedIndex:RELOJ];
        
    }
    if(swipe.direction==UISwipeGestureRecognizerDirectionRight){
        [(UITabBarController *)self.tabBarController setSelectedIndex:RELOJ];
    }
}


@end
