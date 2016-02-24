//
//  MyCoreDataComent.h
//  RestJsonComents
//
//  Created by Horatiu on 10/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CoreDataObjectWriter.h"
NS_ASSUME_NONNULL_BEGIN

@interface MyCoreDataComent : NSManagedObject<CoreDataObjectWriter>

// Insert code here to declare functionality of your managed object subclass
+ (void)insertOrUpdateCoreDataObject:(id<CoreDataObjectWriter>)coreDataObject forDictionary:(NSDictionary*)dictionarDeTransformatInObiect inContext:(NSManagedObjectContext *)managedObjectContext;

@end

NS_ASSUME_NONNULL_END

#import "MyCoreDataComent+CoreDataProperties.h"
