//
//  UtilsCitireScriere.h
//  AlgoritmiElementari
//
//  Created by Horatiu on 19/01/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NodArbore.h"
#import "NodListaSimpla.h"
@interface UtilsCitireScriere : NSObject{

}

+ (NSString *) citireDinFisier:(NSString *)numeFisierFaraExtensie;


+ (NSArray *)arrayOfStringLinesFromFileName:(NSString *)fileName;


+ (NSArray *)arrayFromStringWithSpaceSeparatorFromString:(NSString *)theString;

+ (NodArbore *)creareArboreDeTest;
+ (NodListaSimpla*)creareListaSimplaTest;

@end
