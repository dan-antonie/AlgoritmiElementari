//
//  MyCoreDataComent.m
//  RestJsonComents
//
//  Created by Horatiu on 10/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//

#import "MyCoreDataComent.h"

@implementation MyCoreDataComent

// Insert code here to add functionality to your managed object subclass

+ (void)insertOrUpdateCoreDataObject:(id<CoreDataObjectWriter>)coreDataObject forDictionary:(NSDictionary*)dictionarDeTransformatInObiect inContext:(NSManagedObjectContext *)managedObjectContext
{
    MyCoreDataComent *coreDataComent = nil;
    
    if (coreDataObject) {
        
        //daca obiectul exista deja, il folosesc, adica ii updates proprietatile
        coreDataComent = (MyCoreDataComent*)coreDataObject;
    } else {
        //daca nu exista, il creez (cazul de baza)
        coreDataComent = [NSEntityDescription insertNewObjectForEntityForName:@"MyCoreDataComent" inManagedObjectContext:managedObjectContext];
    }
    
    //setez proprietatile obiectului
    coreDataComent.idComent = [[dictionarDeTransformatInObiect  valueForKey:@"id"]intValue];
    coreDataComent.reply_to = [[dictionarDeTransformatInObiect valueForKey:@"reply_to"]intValue];
   coreDataComent.timestamp = [[dictionarDeTransformatInObiect valueForKey:@"date"]doubleValue];
    coreDataComent.text = [dictionarDeTransformatInObiect valueForKey:@"text"];
    
    
    
}




@end
