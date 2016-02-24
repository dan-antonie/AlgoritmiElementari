//
//  MyCoreDataComent+CoreDataProperties.h
//  RestJsonComents
//
//  Created by Horatiu on 10/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "MyCoreDataComent.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyCoreDataComent (CoreDataProperties)

@property (nonatomic) int16_t idComent;
@property (nonatomic) int16_t reply_to;
@property (nullable, nonatomic, retain) NSString *text;
@property (nonatomic) NSTimeInterval timestamp;

@end

NS_ASSUME_NONNULL_END
