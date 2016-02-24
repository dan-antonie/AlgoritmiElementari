//
//  RecentPhotosTableViewController.h
//  PhotosFromFlicker
//
//  Created by Horatiu on 10/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//
#import "FlickerPhotoCoreData.h"
#import "CoreDataManager.h"
#import "MyFlickerTableViewCell.h"
#import <UIKit/UIKit.h>

@interface RecentPhotosTableViewController : UITableViewController<NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContextMainQueue;
@property (nonatomic, strong) NSFetchedResultsController    *fetchedResultsController;

@end
