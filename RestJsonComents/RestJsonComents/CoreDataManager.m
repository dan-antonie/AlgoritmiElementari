//
//  CoreDataManager.m
//  PhotosFromFlicker
//
//  Created by Horatiu on 08/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//

#import "CoreDataManager.h"



@interface CoreDataManager ()
@property (nonatomic, strong) NSManagedObjectModel   *managedObjectModel;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContextBackgroundQueue;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContextMainQueue;

@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator ;
@end

@implementation CoreDataManager





+ (instancetype)sharedStorageManager
{
    static CoreDataManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedManager = [[CoreDataManager alloc] init];
    });
    
    return _sharedManager;
}


-(void) initCoreData
{
    //initializare url catre baza de date (catre fisierul fizic)
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSURL *storeURL = [NSURL fileURLWithPath:[documentsDirectory stringByAppendingPathComponent:@"bazamea.sqlite"]];
    NSError *error = nil;
    
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                             [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
    
    
    //initializare model
    self.managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    
    //initializare persistent store coordinator
    self.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
    
    
    //initializare persistent store
    NSPersistentStore *store  = [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error];
    if (!store) {
        
    }
    
    
    //background context
    _managedObjectContextBackgroundQueue = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    [_managedObjectContextBackgroundQueue setPersistentStoreCoordinator:self.persistentStoreCoordinator];
    
    //main context
    _managedObjectContextMainQueue = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    _managedObjectContextMainQueue.parentContext = _managedObjectContextBackgroundQueue;
    
}

- (NSManagedObjectContext *)getCoreDataMainContext
{
    return _managedObjectContextMainQueue;
}

- (void)salvareBazaDeDate
{
    NSManagedObjectContext *mocMain = _managedObjectContextMainQueue;
    NSManagedObjectContext *private = _managedObjectContextBackgroundQueue;
    
    
    if (!mocMain) return;
    if ([mocMain hasChanges]) {
        [mocMain performBlockAndWait:^{
            NSError *error = nil;
            [mocMain save:&error];
        }];
    }
    
    void (^savePrivate) (void) = ^{
        NSError *error2 = nil;
        [private save:&error2];
    };
    if ([private hasChanges]) {
        [private performBlockAndWait:savePrivate];
    }
    
}
-(NSArray*)fetchAllComents{
    NSSortDescriptor *sortDupaId =  [[NSSortDescriptor alloc] initWithKey:@"idComent" ascending:YES];
    
    NSArray *sortDescriptorsArray = [NSArray arrayWithObjects: sortDupaId, nil];
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"MyCoreDataComent"];
    fetchRequest.sortDescriptors = sortDescriptorsArray;
    NSError *error = nil;
    NSArray *arrayWithPhotos = [_managedObjectContextMainQueue executeFetchRequest:fetchRequest error:&error];
    return arrayWithPhotos;
}
//[todo] implement a save function which saves the contexts to core data persistent store

//[todo] implement a read function to fetch all photos from core data 


@end
