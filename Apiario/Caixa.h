//
//  Caixa.h
//  Apiario
//
//  Created by Franciello on 24/07/15.
//  Copyright (c) 2015 Franciello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Apiario;

@interface Caixa : NSManagedObject

@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSDate * dataColheita;
@property (nonatomic, retain) Apiario *listaapiario;

@end
