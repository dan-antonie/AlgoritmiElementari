//
//  UtilsCitireScriere.m
//  AlgoritmiElementari
//
//  Created by Horatiu on 19/01/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//

#import "UtilsCitireScriere.h"


@implementation UtilsCitireScriere

static NodArbore *radacinaGlobal;
static NodListaSimpla *primuElementGlobal;
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

+ (NodArbore *)creareArboreDeTest
{
    NodArbore *radacina = [[NodArbore alloc] init];
    radacina.info = 10;
    radacina.st = nil;
    radacina.dr = nil;
    
    radacinaGlobal = radacina;
    
    NSString *entryString = [UtilsCitireScriere citireDinFisier:@"arbori"];
    NSArray *arrayDeInt = [entryString componentsSeparatedByString:@" "];
    for (int i ; i<[arrayDeInt count]; i++) {
        int numarCurent = [[arrayDeInt objectAtIndex:i] intValue];
        [UtilsCitireScriere inserareBinaraInArbore:radacina aInformatiei:numarCurent];
    }
    
    return radacina;
}


+(NodArbore*)inserareBinaraInArbore:(NodArbore *)radacina aInformatiei:(int) informatiaDeInserat
{
    if (radacina == nil) {
        radacina = [[NodArbore alloc] init];
        radacina.info = informatiaDeInserat;
        NSLog(@"S-a inserat elementul %d", radacina.info);
        radacina.st = nil;
        radacina.dr = nil;
    }
    
    
    if ( informatiaDeInserat <radacina.info) {
        radacina.st = [self inserareBinaraInArbore:radacina.st aInformatiei:informatiaDeInserat];
    }else if (informatiaDeInserat > radacina.info)
    {
        radacina.dr = [self inserareBinaraInArbore:radacina.dr aInformatiei:informatiaDeInserat];
    }
    return radacina;
}
+(NodListaSimpla*)creareListaSimplaTest{
    NodListaSimpla *primul = [[NodListaSimpla alloc]init];
    primul.info = 1;
    primul.next = nil;
   
    NodListaSimpla *nodCurent = primul;
    NSString *entryString = [UtilsCitireScriere citireDinFisier:@"lista"];
    NSArray *arrayDeInt = [entryString componentsSeparatedByString:@" "];
    for (int i = 0; i<[arrayDeInt count]; i++) {
        int numarCurent = [[arrayDeInt objectAtIndex:i] intValue];
        NodListaSimpla *nod = [[NodListaSimpla alloc]init];
        nod.info = numarCurent;
        nod.next = nil;
        nodCurent.next = nod;
        nodCurent = nod;
    }
    
    return primul;

}



@end
