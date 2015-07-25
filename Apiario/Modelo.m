//
//  Modelo.m
//  Apiario
//
//  Created by Franciello on 19/07/15.
//  Copyright (c) 2015 Franciello. All rights reserved.
//

#import "Modelo.h"

//@implementation Modelo

//- (NSManagedObjectContext *)managedObjectContext {
//    NSManagedObjectContext *context = nil;
//    id delegate = [[UIApplication sharedApplication] delegate];
//    if ([delegate performSelector:@selector(managedObjectContext)]) {
//        context = [delegate managedObjectContext];
//    }
//    return context;
//}
//
//- (void)salvarApiarioComNome:(NSString *)nome eQuantidade:(NSString *)quantidade {
//    NSManagedObjectContext *context = [self managedObjectContext];
//    
//    self.apiario = [NSEntityDescription insertNewObjectForEntityForName:@"Apiario" inManagedObjectContext:context];
//    [self.apiario setValue:nome forKey:@"nome"];
//    [self.apiario setValue:quantidade forKey:@"quantidade"];
//    
//    NSError *error = nil;
//    if (![context save:&error]) {
//        NSLog(@"Erro ao salvar %@ %@", error, [error localizedDescription]);
//    } else {
//        
//    }
//}
//
//- (void)fetchApiarioComArray:(NSMutableArray *)apiarios {
//    NSManagedObjectContext *context = [self managedObjectContext];
//    
//    NSFetchRequest *apiarioRequest = [[NSFetchRequest alloc] initWithEntityName:@"Apiario"];
//    apiarios = [[context executeFetchRequest:apiarioRequest error:nil] mutableCopy];
//    
//}


//@end
