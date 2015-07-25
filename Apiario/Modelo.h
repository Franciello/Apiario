//
//  Modelo.h
//  Apiario
//
//  Created by Franciello on 19/07/15.
//  Copyright (c) 2015 Franciello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Apiario.h"
//#import "Caixa.h"

@interface Modelo : NSObject
{
    NSMutableArray *itens;
    NSManagedObjectContext *contexto;
    NSManagedObjectModel *modelo;
    NSMutableArray *itensCaixa;
}
@property (strong, nonatomic) Apiario *apiario;
- (void)salvarApiarioComNome:(NSString *)nome eQuantidade:(NSString *)quantidade;
- (void)fetchApiarioComArray:(NSMutableArray *)apiarios;

//+(Modelo *)modeloCompartilhado;
//
//-(NSArray *)itens;
//
//-(BOOL)salvarMudancas;
//
//-(Apiario *)criarItem;
//
//-(void)excluirItem:(Apiario *)apiario;



/*
-(NSArray *)itensCaixa;

-(BOOL)salvarMudancasCaixa;

-(Caixa *)criarItemCaixa;

-(void)excluirItemCaixa:(Caixa *)caixa;
*/



@end
