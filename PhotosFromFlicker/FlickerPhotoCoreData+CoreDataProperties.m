//
//  FlickerPhotoCoreData+CoreDataProperties.m
//  PhotosFromFlicker
//
//  Created by Horatiu on 09/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "FlickerPhotoCoreData+CoreDataProperties.h"

@implementation FlickerPhotoCoreData (CoreDataProperties)

@dynamic photoUrl;
@dynamic title;
@dynamic media;
@dynamic dateTaken;
@dynamic photoDescription;
@dynamic published;
@dynamic author;
@dynamic author_id;
@dynamic tags;
+ (void)insertOrUpdateCoreDataObject:(id<CoreDataObjectWriter>)coreDataObject forDictionary:(NSDictionary*)dictionarDeTransformatInObiect inContext:(NSManagedObjectContext *)managedObjectContext
{
    FlickerPhotoCoreData *coreDataPhoto = nil;
    
    if (coreDataObject) {
        
        //daca obiectul exista deja, il folosesc, adica ii updates proprietatile
        coreDataPhoto = (FlickerPhotoCoreData*)coreDataObject;
    } else {
        //daca nu exista, il creez (cazul de baza)
        coreDataPhoto = [NSEntityDescription insertNewObjectForEntityForName:@"FlickerPhotoCoreData" inManagedObjectContext:managedObjectContext];
    }
    
    //setez proprietatile obiectului
    coreDataPhoto.title = [dictionarDeTransformatInObiect valueForKey:@"title"];
    coreDataPhoto.photoUrl = [dictionarDeTransformatInObiect valueForKey:@"link"];
    coreDataPhoto.media = [[dictionarDeTransformatInObiect valueForKey:@"media"]valueForKey:@"m"];
    coreDataPhoto.dateTaken = [dictionarDeTransformatInObiect valueForKey:@"date_taken"];
    coreDataPhoto.photoDescription = [dictionarDeTransformatInObiect valueForKey:@"description"];
    coreDataPhoto.published = [dictionarDeTransformatInObiect valueForKey:@"published"];
    coreDataPhoto.author = [dictionarDeTransformatInObiect valueForKey:@"author"];
    coreDataPhoto.author_id = [dictionarDeTransformatInObiect valueForKey:@"author_id"];
    coreDataPhoto.tags = [dictionarDeTransformatInObiect valueForKey:@"tags"];
    
}

@end
