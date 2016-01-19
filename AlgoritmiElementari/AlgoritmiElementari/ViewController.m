//
//  ViewController.m
//  AlgoritmiElementari
//
//  Created by Horatiu on 19/01/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//

#import "ViewController.h"
#import "UtilsCitireScriere.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *resultsTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)calculeazaProblemaCurenta:(id)sender {
    [self problema658];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 
  #730. [2015-11-02 - 08:17:04]
 Din fisierul pp.in se citeste un numar n (<=1000000) si apoi un sir de n numere naturale reprezentand o permutare a multimii {1,2,3,...n}.
 Afisati in fisierul pp.out cate dintre prefixele sirului citit sunt la randul lor permutari.
 Exemplu:
 pp.in
 12
 2 1 7 3 4 5 8 6 9 12 10 11
 pp.out
 4
 Explicatie:
 Cele patru permutari prefix sunt:
 2 1
 2 1 7 3 4 5 8 6
 2 1 7 3 4 5 8 6 9
 2 1 7 3 4 5 8 6 9 12 10 11*/
- (void)problema730
{
    
    NSMutableString *resultsString = [[NSMutableString alloc] init];
    NSArray *arrayDeLinii = [UtilsCitireScriere arrayOfStringLinesFromFileName:@"p370"];
    
    //int nrDeElemenete = [[arrayDeLinii objectAtIndex:0] intValue];
    
    
    NSString *stringDeNumere = [arrayDeLinii objectAtIndex:1];
    NSArray *arrayDeNumere = [UtilsCitireScriere arrayFromStringWithSpaceSeparatorFromString:stringDeNumere];
    
    for (int i = 0; i < [arrayDeNumere count]; i++) {
        int elementulI = [[arrayDeNumere objectAtIndex:i] intValue];
        NSLog(@"%d",elementulI);
        bool ok = 1;
        for (int j=0; j<=i; j++) {
            
            int numarulCurent = [[arrayDeNumere objectAtIndex:j] intValue];
            
            if (numarulCurent > i +1) {
                ok = 0;
            }
            
        }
    
        if (ok) {
            for ( int j=0; j<=i; j++) {
                NSString *stringNumar = [arrayDeNumere objectAtIndex:j];
                [resultsString appendString:stringNumar];
                
               NSLog(@"%@", stringNumar)  ;
            }
            
            [resultsString appendString:@"\n"];
        }
        
        
        
    
    }
    
    
    self.resultsTextView.text = resultsString;

}

- (void)problema658
{
    /*
     #658. [2014-12-03 - 20:19:00]
     Se citesc doua numere naturale a si b (a mai mic decat b). Afisati numerele din intervalul [a,b] care au proprietatea ca au numar maxim de divizori primi.
     Exemplu: a=30, b=45 => 30, 42 (au cate 3 divizori primi, iar restul numerelor au mai putini)
     */
    
    int maxDivizori = 0;
    NSMutableString *resultsString = [[NSMutableString alloc] init];
    NSArray *arrayDeLinii = [UtilsCitireScriere arrayOfStringLinesFromFileName:@"p658"];
    int a = [[arrayDeLinii objectAtIndex:0] intValue];
    int b = [[arrayDeLinii objectAtIndex:1] intValue];
    for (int i=a; i<=b; i++) {
        int nrDivizori = [self numarDeDivizoriPrimiAiNumarului:i];
        if (nrDivizori>maxDivizori) {
            maxDivizori = nrDivizori;
        }
    }
    for ( int i=a; i<=b; i++) {
        if ([self numarDeDivizoriPrimiAiNumarului:i] == maxDivizori) {
            [resultsString appendString:[NSString stringWithFormat:@"%d ",i]];
            
            
        }
    }
    
    self.resultsTextView.text = resultsString;
    
}

-(BOOL)  numberIsPrim:(int)aNumber{
    for (int i=2; i<=aNumber/2 ; i++) {
        if (aNumber%i == 0 ) {
            return NO;
        }
    }
    return YES;
}
-(int) numarDeDivizoriPrimiAiNumarului:(int)numar{
    int k = 0;
    for (int i=2; i<numar/2; i++) {
        if (numar%i == 0 && [self numberIsPrim:i]) {
            k++;
        }
    }
    return k;
}
@end
