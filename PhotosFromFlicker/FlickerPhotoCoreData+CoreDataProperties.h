//
//  FlickerPhotoCoreData+CoreDataProperties.h
//  PhotosFromFlicker
//
//  Created by Horatiu on 09/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "FlickerPhotoCoreData.h"
#import "CoreDataObjectWriter.h"
NS_ASSUME_NONNULL_BEGIN

@interface FlickerPhotoCoreData (CoreDataProperties)<CoreDataObjectWriter>

@property (nullable, nonatomic, retain) NSString *photoUrl;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *media;
@property (nullable, nonatomic, retain) NSString *dateTaken;
@property (nullable, nonatomic, retain) NSString *photoDescription;
@property (nullable, nonatomic, retain) NSString *published;
@property (nullable, nonatomic, retain) NSString *author;
@property (nullable, nonatomic, retain) NSString *author_id;
@property (nullable, nonatomic, retain) NSString *tags;

@end

NS_ASSUME_NONNULL_END
