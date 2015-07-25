//
//  TableViewController.m
//  Apiario
//
//  Created by Franciello on 19/07/15.
//  Copyright (c) 2015 Franciello. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@property (strong, nonatomic) IBOutlet UIBarButtonItem *botaoExcluir;

@end

@implementation TableViewController

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    self.botaoExcluir = [[UIBarButtonItem alloc] initWithTitle:@"Excluir" style:UIBarButtonItemStylePlain target:self action:@selector(toqueExcluir:)];
    self.botaoExcluir.possibleTitles = [NSSet setWithObjects:@"Excluir", @"Voltar", nil];
    self.botaoExcluir.tag = 0;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.context = [self managedObjectContext];
    self.fetchApiario = [[NSFetchRequest alloc] initWithEntityName:@"Apiario"];
    self.apiarios = [[self.context executeFetchRequest:self.fetchApiario error:nil] mutableCopy];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

-(void)viewWillAppear:(BOOL)animated{
    [[self tableView]reloadData];
    
    self.context = [self managedObjectContext];
}

- (IBAction)toqueExcluir:(id)sender {
    [[self tableView]setEditing:![[self tableView]isEditing]animated:YES];
    
//    if (self.botaoExcluir.tag == 0) {
//        self.botaoExcluir.tag = 1;
//        [self.navigationItem.rightBarButtonItem setTitle:@"Voltar"];
//        [self.botaoExcluir setTitle:@"Voltar"];
//    } else {
//        self.botaoExcluir.tag = 0;
//        [self.navigationItem.rightBarButtonItem setTitle:@"Excluir"];
//        [self.botaoExcluir setTitle:@"Excluir"];
//    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfRowsInSection:(NSInteger)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.apiarios.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identificadorDaCelula = @"Celula";
    UITableViewCell *celula = [tableView dequeueReusableCellWithIdentifier:identificadorDaCelula];
    
    if(!celula){
        celula = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identificadorDaCelula];
    }
    self.apiario = [self.apiarios objectAtIndex:indexPath.row];
                        
    [[celula textLabel]setText:[self.apiario valueForKey:@"nome"]];
    NSNumber *quantidadeDeCaixas = [self.apiario valueForKey:@"quantidade"];
    [[celula detailTextLabel]setText:[NSString stringWithFormat:@"Quantidade: %d",[quantidadeDeCaixas intValue]]];
    return celula;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        self.context = [self managedObjectContext];
        
        //Checa se está no modo de excluir
        if (editingStyle == UITableViewCellEditingStyleDelete) {
            // Deletando do Core Data
            [self.context deleteObject:[self.apiarios objectAtIndex:indexPath.row]];
            
            NSError *error = nil;
            if (![self.context save:&error]) {
                NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
                return;
            }
            
            // Remove apiario da table view
            [self.apiarios removeObjectAtIndex:indexPath.row];
            [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
        
        
    //} else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

//#pragma mark - Fetched Request Controller Delegate
//
//- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
//    [self.tableView beginUpdates];
//}
//
//- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
//    [self.tableView endUpdates];
//}
//
//- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
//    switch (type) {
//        case NSFetchedResultsChangeInsert: {
//            [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
//            break;
//        }
//        case NSFetchedResultsChangeDelete: {
//            [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//            break;
//        }
//        case NSFetchedResultsChangeUpdate: {
//            [self.tableView reloadData];
//            break;
//        }
//        case NSFetchedResultsChangeMove: {
//            [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//            [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
//            break;
//        }
//    }
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
