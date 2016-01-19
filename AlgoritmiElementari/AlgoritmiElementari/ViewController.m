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
    [self problema649];
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

- (void)problema653{
    int divizorulCuFactorulCelMaiMare=0;
    int maxDivizori = 0;
    NSMutableString *resultsString = [[NSMutableString alloc] init];
    NSArray *arrayDeLinii = [UtilsCitireScriere arrayOfStringLinesFromFileName:@"p653"];
    int a = [[arrayDeLinii objectAtIndex:0] intValue];
    
    
    for (int i = 2; i<= a/2; i++) {
        BOOL seImparte = YES;
        int counter = 0;
        while (seImparte) {
            if (a%i == 0) {
                counter++;
                a = a/i;
                
            }
            else seImparte = NO;
        }
        if (counter > maxDivizori){
            maxDivizori = counter;
            divizorulCuFactorulCelMaiMare = i;
        }
    }
    self.resultsTextView.text = [NSString stringWithFormat:@"%d",divizorulCuFactorulCelMaiMare];

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

-(void)problema652{
    /*Se citesc numere naturale pânã când se introduce numãrul 0. Afisati suma obtinutã prin adunarea primei si a ultimei cifre din fiecare numar citit. Numerele cu mai putin de 2 cifre nu se iau in considerare.
     Exemplu: dacã se introduc numerele 3455 66 7 8 23 11221 0 atunci se va afisa 27 (3+5+6+6+2+3+1+1). */
    int s = 0;
    NSArray *arrayDeLinii = [UtilsCitireScriere arrayOfStringLinesFromFileName:@"p652"];
    int totalNumere = [[arrayDeLinii objectAtIndex:0] intValue];
    NSString *stringDeNumere = [arrayDeLinii objectAtIndex:1];
    NSArray *arrayDeNumere = [UtilsCitireScriere arrayFromStringWithSpaceSeparatorFromString:stringDeNumere];
    for (int i = 0; i<totalNumere; i++) {
        s = s+ [self sumaCifreP652Numarului:[[arrayDeNumere objectAtIndex:i]intValue]];
    }
    self.resultsTextView.text = [NSString stringWithFormat:@"%d", s];

}
-(int) sumaCifreP652Numarului:(int)numar{
    
    int suma = 0;
    if (numar / 10 != 0){
        while (numar/100 != 0) {
            numar = numar/10;
        }
        suma = suma+numar/10+numar%10;
    }
        return suma;
    
}

-(void) problema650{
    /*#650. [2014-11-22 - 12:01:15]
     Se citesc douã numere naturale a si b. Afisati numãrul care are suma maximã a exponentilor din descompunerea in factori primi. Daca ambele numere au aceeasi sumã a exponentilor, atunci se va afisa oricare dintre ele.
     Exemplu: pentru a=36, b=30 se va afisa 36 (36=2 la 2 * 3 la 2 , deci suma e 4, iar 30=2*3*5, deci suma e 3)      */
    
    int a = 36;
    int b = 30;
    if ([self sumaExponentiFactoriPrimi:a] > [self sumaExponentiFactoriPrimi:b]) {
        self.resultsTextView.text = [NSString stringWithFormat:@"%d",a];
    } else
        
    self.resultsTextView.text = [NSString stringWithFormat:@"%d",b];
    
}

-(int) sumaExponentiFactoriPrimi:(int) numar{
    int suma = 0;
    for (int i=2 ; i<numar/2; i++) {
        int k = 0;
        while (numar%i == 0) {
            numar=numar/i;
            k++;
        }
        suma = suma +k;
    }
    
    return suma;
    
}

-(void) problema649{
    /*Se citesc douã numere naturale a si b. Afisati numãrul care are cei mai multi factori primi. Daca ambele numere au acelasi numãr de factori primi, atunci se va afisa oricare dintre ele.
     Exemplu: pentru a=36, b=30 se va afisa 30 (30 are 3 factori primi: 2,3,5, iar 36 doar 2: 2 si 3)       */
    
    int a = 210;
    int b = 30;
    if ([self numarFactoriPrimi:a] > [self numarFactoriPrimi:b]) {
        self.resultsTextView.text = [NSString stringWithFormat:@"%d",a];
    } else
        
        self.resultsTextView.text = [NSString stringWithFormat:@"%d",b];
    
}

-(int) numarFactoriPrimi:(int) numar{
    int nr = 0;
    for (int i=2 ; i<numar/2; i++) {
        while (numar%i == 0) {
            numar=numar/i;
        }
        nr = nr + 1;
    }
    
    return nr;
    
}

@end
