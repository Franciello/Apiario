//
//  TableViewController.h
//  Apiario
//
//  Created by Franciello on 19/07/15.
//  Copyright (c) 2015 Franciello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Modelo.h"
#import "Apiario.h"

@interface TableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSMutableArray *apiarios;
@property (strong, nonatomic) Apiario *apiario;
@property (strong, nonatomic) NSFetchRequest *fetchApiario;
@property (strong, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end
