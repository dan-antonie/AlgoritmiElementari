//
//  MyComent.m
//  InterviuTest
//
//  Created by Horatiu on 03/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//

#import "MyComent.h"

@implementation MyComent
-(MyComent*)comentFromDictionary:(NSDictionary*)dictionaryWithComent{
    
    self.ID = [[dictionaryWithComent valueForKey:@"id"]intValue];
    self.reply_to = [[dictionaryWithComent valueForKey:@"reply_to"]intValue];
    self.timestamp = [[dictionaryWithComent valueForKey:@"date"]intValue];
    self.text = [dictionaryWithComent valueForKey:@"text"];
    self.indent = 0;
    self.arrayOfChilds = [[NSMutableArray alloc] init];
    return self;
}
@end
