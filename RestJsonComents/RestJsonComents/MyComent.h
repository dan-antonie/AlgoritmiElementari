//
//  MyComent.h
//  RestJsonComents
//
//  Created by Horatiu on 07/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyComent : NSObject
@property (nonatomic,assign) int idComent;
@property (nonatomic,assign) int reply_to;
@property (nonatomic,strong) NSString *text;
@property (nonatomic,assign) int timeStamp;
@property (nonatomic,strong) NSArray *arrayOfChilds;
@property (nonatomic,strong) MyComent *parent;
-(id)initFromDictionary:(NSDictionary*) dic;
@end
