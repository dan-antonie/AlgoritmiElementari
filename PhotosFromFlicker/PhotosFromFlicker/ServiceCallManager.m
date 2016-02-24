//
//  ServiceCallManager.m
//  PhotosFromFlicker
//
//  Created by Horatiu on 20/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//

#import "ServiceCallManager.h"

@implementation ServiceCallManager

+ (instancetype)sharedServiceCallManager
{
    static ServiceCallManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedManager = [[ServiceCallManager alloc] init];
    });
    
    return _sharedManager;
}

- (void)makeAJsonCallAtUrlString:(NSString *)urlString withCompletionBlock:(ServiceCallCompletionBlock) completionBlock{
    NSURL *theUrl = [NSURL URLWithString:urlString];
    
    NSURLSession *sesion = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask =[sesion dataTaskWithURL:theUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        if (error != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (completionBlock) {
                    completionBlock(error, nil, response);
                    
                }
                
                
            });
            
        }else{
            NSString *stringFromData = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSString *fixedString = [stringFromData stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
            NSData *fixedData = [fixedString dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:fixedData options:0 error:nil]; //  later task: to validate json [NSJSONSerialization JSONObjectWithData:data options:0 error:nil]
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                
                if (completionBlock) {
                    completionBlock (nil, json, response);
                }
            });
            
        }
    }];
    [dataTask resume];
    
    
}



- (void)downloadFileAtUrl:(NSURL *)theURL withCompletionBlock:(ServiceCallCompletionBlock) completionBlock
{
    NSURLRequest *request = [NSURLRequest requestWithURL:theURL];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *sesion = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDownloadTask *task = [sesion downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable localfile, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completionBlock) {
                    completionBlock(error, nil, response);
                }
            });
        }else
        {
            NSData *data = [NSData dataWithContentsOfURL:localfile];
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (completionBlock) {
                    completionBlock(nil, data, response);
                }
            });

            
        }
    
    }];
    [task resume];
}


@end
