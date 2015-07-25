//
//  Apiario.h
//  Apiario
//
//  Created by Franciello on 19/07/15.
//  Copyright (c) 2015 Franciello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Apiario : NSManagedObject

@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSNumber * quantidade;

@end
