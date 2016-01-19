//
//  UtilsCitireScriere.m
//  AlgoritmiElementari
//
//  Created by Horatiu on 19/01/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//

#import "UtilsCitireScriere.h"

@implementation UtilsCitireScriere

+ (NSString *) citireDinFisier:(NSString *)numeFisierFaraExtensie
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:numeFisierFaraExtensie ofType:@"txt"];
    if (filePath) {
        NSString *myText = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        if (myText) {
            return myText;
        }
    }
    
    return nil;
}


+ (NSArray *)arrayOfStringLinesFromFileName:(NSString *)fileName
{
     NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"txt"];
    
    if (filePath) {
        NSString *myText = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        if (myText) {
            
            return [myText componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        }
    }
    
    return nil;
}


+ (NSArray *)arrayFromStringWithSpaceSeparatorFromString:(NSString *)theString
{
    return [theString componentsSeparatedByString:@" "];
}



@end
