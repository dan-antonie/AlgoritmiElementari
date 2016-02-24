//
//  CoreDataManager.h
//  PhotosFromFlicker
//
//  Created by Horatiu on 08/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#define kCoreDataManager [CoreDataManager sharedStorageManager]

@interface CoreDataManager : NSObject


+ (instancetype)sharedStorageManager;

-(NSManagedObjectContext *)getCoreDataMainContext;
-(void) initCoreData;
-(void)salvareBazaDeDate;
-(NSString *)generateUniqueStringForFetchedResultControllerCache;
-(NSArray*)fetchAllPhotos;
@end
