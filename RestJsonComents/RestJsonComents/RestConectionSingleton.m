//
//  RestConectionSingleton.m
//  RestJsonComents
//
//  Created by Horatiu on 07/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//

#import "RestConectionSingleton.h"
#import "MyComent.h"

@implementation RestConectionSingleton
-(void) getJsonDictionary{
    NSURLSession *sesion = [NSURLSession sharedSession];
    [sesion dataTaskWithURL:[NSURL URLWithString:ENDPOINT_COMENTS] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Alert Error" message:@"nu se conecteaza" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [errorAlert show];
            
        }else{
            NSDictionary *dictionarryFromJson = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
         //   [self parseComenstFromJsonDictionary:dictionarryFromJson];
        }
    
    }];
   
}
-(NSArray*)getComenstFromJsonDictionary:(NSDictionary*)jsonDic{
    NSMutableArray *arrayOfComents = [[NSMutableArray alloc]init];
/*transformam obiectele in obiecte de tip coment;
   rezulta un array de comenturi;
   transmitem array de comenturi la baza de date pentru salvare
 
   */
    NSArray *arrayOfComentsFromJson = [jsonDic valueForKey:@"comments"];
    
    for (int i = 0; i < [arrayOfComentsFromJson count]; i++) {
        NSDictionary *aDicComment = [arrayOfComentsFromJson objectAtIndex:i];
        
        MyComent *aComment = [[MyComent alloc] initFromDictionary:aDicComment];
        [arrayOfComents addObject:aComment];
        
    }
    
   
    
    
    return arrayOfComents;
}

@end
