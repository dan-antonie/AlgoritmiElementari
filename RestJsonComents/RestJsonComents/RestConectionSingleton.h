//
//  RestConectionSingleton.h
//  RestJsonComents
//
//  Created by Horatiu on 07/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#define ENDPOINT_COMENTS @"http://178.62.33.226/interview/comments"

@interface RestConectionSingleton : NSObject
-(void) getJsonDictionary;
-(NSArray*)getComenstFromJsonDictionary:(NSDictionary*)jsonDic;
@end
