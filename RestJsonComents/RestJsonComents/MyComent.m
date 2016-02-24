//
//  MyComent.m
//  RestJsonComents
//
//  Created by Horatiu on 07/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//

#import "MyComent.h"

@implementation MyComent
-(id)initFromDictionary:(NSDictionary*) dic{
   self = [super init];
    self.idComent = [[dic valueForKey:@"id"]intValue];
    self.reply_to = [[dic valueForKey:@"reply_to"]intValue];
    self.timeStamp = [[dic valueForKey:@"date"]intValue];
    self.text = [dic valueForKey:@"text"];
    self.parent = nil;
    self.arrayOfChilds = nil;
    return self;
}

@end
