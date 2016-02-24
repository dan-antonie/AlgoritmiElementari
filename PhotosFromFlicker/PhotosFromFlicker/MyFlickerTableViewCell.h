//
//  MyFlickerTableViewCell.h
//  PhotosFromFlicker
//
//  Created by Horatiu on 10/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyFlickerTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *tags;

@end
