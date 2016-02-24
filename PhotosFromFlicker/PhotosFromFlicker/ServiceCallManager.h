//
//  ServiceCallManager.h
//  PhotosFromFlicker
//
//  Created by Horatiu on 20/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ServiceCallCompletionBlock)(NSError *serviceCallError, id dataResult, NSURLResponse *response);


#define kServiceCallManager [ServiceCallManager sharedServiceCallManager]


@interface ServiceCallManager : NSObject

+ (instancetype)sharedServiceCallManager;

- (void)makeAJsonCallAtUrlString:(NSString *)urlString withCompletionBlock:(ServiceCallCompletionBlock) completionBlock;
- (void)downloadFileAtUrl:(NSURL *)theURL withCompletionBlock:(ServiceCallCompletionBlock) completionBlock;

@end
