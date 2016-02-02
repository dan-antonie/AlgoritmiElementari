//
//  NodArbore.h
//  AlgoritmiElementari
//
//  Created by Horatiu on 01/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NodArbore : NSObject

@property (nonatomic, assign) int info;
@property (nonatomic, retain) NodArbore *st;
@property (nonatomic, retain) NodArbore *dr;
@end
