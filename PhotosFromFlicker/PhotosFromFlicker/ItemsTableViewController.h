//
//  ItemsTableViewController.h
//  PhotosFromFlicker
//
//  Created by Horatiu on 08/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//
#import "CoreDataManager.h"
#import "FlickerPhotoCoreData.h"
#import "MyFlickerTableViewCell.h"
#import "MyFlickerPhoto.h"
#import <UIKit/UIKit.h>
#define ITEMS_URL @"http://www.flickr.com/services/feeds/photos_public.gne?tags=soccer&format=json&nojsoncallback=1"

@interface ItemsTableViewController : UITableViewController

@end
