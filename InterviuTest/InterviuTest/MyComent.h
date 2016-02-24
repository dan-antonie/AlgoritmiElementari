//
//  MyComent.h
//  InterviuTest
//
//  Created by Horatiu on 03/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyComent : NSObject
@property (nonatomic,assign) int ID;
@property (nonatomic,strong) NSString *text;
@property (nonatomic,assign) int timestamp;
@property (nonatomic,assign) int reply_to;
@property (nonatomic,strong) MyComent *parent;
@property (nonatomic,strong) NSMutableArray *arrayOfChilds;
@property (nonatomic,assign) int indent;
-(MyComent*)comentFromDictionary:(NSDictionary*)dictionaryWithComent;

@end
