//
//  ViewController.m
//  InterviuTest
//
//  Created by Horatiu on 03/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
/*Requirements:
 
 Query the API endpoint "http://178.62.33.226/interview/comments"
 
 This endpoint returns a JSON string that contains:
 
 status: ok | error
 
 message: status message
 
 comment_count: number of elements in comment array
 
 comments: array of comments with the following fields:
 
 id (comment id)
 
 text (comment text)
 
 date (unix timestamp)
 
 reply_to (id of the comment this is a reply to)
 
 *assume reply_to ids are only in the preceding comments
 
 
 
 
 
 
 Tools:
 
 jsoneditoronline.org
 
 
 
 Documentation:
 
 google.com
 
 stackoverflow.com
 
 https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/ObjC_classic/index.html#//apple_ref/doc/uid/20001091
 
 https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/Classes/NSURLConnection_Class/ OR
 
 https://developer.apple.com/library/ios/documentation/Foundation/Reference/NSURLSession_class/index.html#//apple_ref/occ/cl/NSURLSession
 
 https://developer.apple.com/library/ios/documentation/Foundation/Reference/NSJSONSerialization_Class/
 
*/


#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"http://178.62.33.226/interview/comments"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
      //  if (error == nil) {
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSString *stringStatus = [json valueForKey:@"status"];
            if ([stringStatus isEqualToString:@"ok"] ) {
                NSLog(@"%@", json);
                [self parseJson:json];
            }
     //   }
        
    }];
    [dataTask resume];

}
-(void) parseJson:(NSDictionary*)jsonToParse{
    
    NSArray *arrayWithComents = [jsonToParse valueForKey:@"comments"];
    NSMutableDictionary *dictionaryWithComents =[[NSMutableDictionary alloc]init];
    NSMutableString *stringDeAfisat = [[NSMutableString alloc]init];
    for (int i = 0; i<[arrayWithComents count]; i++) {
        NSDictionary *dictionaryWithComent = arrayWithComents[i];
        MyComent *newComent =[[MyComent alloc]comentFromDictionary:dictionaryWithComent];
        newComent.indent = 0;
        NSString *keyForNewComent = [NSString stringWithFormat:@"%d",newComent.ID];
        [dictionaryWithComents setObject:newComent forKey:keyForNewComent];
        
    }
    for (NSString *key in dictionaryWithComents) {
        MyComent *newComent = [dictionaryWithComents valueForKey:key];
        int reply_to = newComent.reply_to;
        if (reply_to != 0 ) {
            NSString *keyForComentRepliedTo = [NSString stringWithFormat:@"%d",reply_to];
            MyComent *comentRepliedTo = [dictionaryWithComents valueForKey:keyForComentRepliedTo];
            [comentRepliedTo.arrayOfChilds addObject:newComent];
            newComent.parent = comentRepliedTo;
            newComent.indent = comentRepliedTo.indent+1;
            

        }else{
            newComent.indent = 0;
        }
        
        //        if (reply_to == 0) {
//            
//            newComent.indent = 0;
//        }
//        if (reply_to != 0) {
//            [dictionaryWithComents setObject:comentRepliedTo forKey:keyForComentRepliedTo];
//        }
//        [dictionaryWithComents setObject:newComent forKey:[NSString stringWithFormat:@"i"]];
    }

    for (NSString *key in dictionaryWithComents) {
        MyComent *curentComent = [dictionaryWithComents valueForKey:key];
        if (curentComent.indent == 0) {
            stringDeAfisat = [self insertComents:curentComent inStringToWrite:stringDeAfisat];
        }
    }
    NSLog([NSString stringWithFormat:@"%@",stringDeAfisat ]);
}
-(NSMutableString*)insertComents:(MyComent*)coment inStringToWrite:(NSMutableString*)stringToWrite{
    for (int i = 0; i<coment.indent; i++) {
        [stringToWrite appendString:@"   "];
    }
    [stringToWrite appendString:[NSString stringWithFormat:@"[%d] ",coment.ID]];
    [stringToWrite appendString:[NSString stringWithFormat:@"[%d] ",coment.timestamp]];
    [stringToWrite appendString:[NSString stringWithFormat:@"[%@] ",coment.text]];
    [stringToWrite appendString:[NSString stringWithFormat:@"[%d] \n",coment.indent]];
    if ([coment.arrayOfChilds count] == 0) {
        return stringToWrite;
           }else{
    
       for (int i = 0; i<[coment.arrayOfChilds count]; i++) {
        MyComent *aChild = coment.arrayOfChilds[i];
           [stringToWrite appendString:@"    "];
           stringToWrite = [self insertComents:aChild inStringToWrite:stringToWrite];
           
       
       }
               return stringToWrite;
               
           }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
