//
//  CoreDataObjectWriter.h
//  Events 3.0
//
//  Created by Daniel Mihai on 2/18/14.
//  Copyright (c) 2014 World Economic Forum. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CoreDataObjectWriter <NSObject>

+ (void)insertOrUpdateCoreDataObject:(id<CoreDataObjectWriter>)coreDataObject forDictionary:(NSDictionary*)dictionarDeTransformatInObiect inContext:(NSManagedObjectContext *)managedObjectContext;

@optional
+ (NSString *)comparisonPropertyName;

@end
