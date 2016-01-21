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
    [self problema569];
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


-(void)problema648{
    /*Se citeste un numar natural n si apoi n numere naturale nenule cu cel mult 5 cifre fiecare. Afisati fractia ireductibila minima care se poate construi folosind numere dintre cele citite.
     Exemplu: pentru n=5 si numerele 7 9 8 3 6 fractia este 1/3 (obtinuta din simplificarea fractiei 3/9)*/
    int minim = 99999;
    int maxim = 0;
    NSArray *arrayDeLinii = [UtilsCitireScriere arrayOfStringLinesFromFileName:@"P648"];
    int totalNumere = [[arrayDeLinii objectAtIndex:0] intValue];
    NSString *stringDeNumere = [arrayDeLinii objectAtIndex:1];
    NSArray *arrayDeNumere = [UtilsCitireScriere arrayFromStringWithSpaceSeparatorFromString:stringDeNumere];
    for (int i = 0; i<totalNumere; i++) {
        int numarCurent = [[arrayDeNumere objectAtIndex:i] intValue];
        if (numarCurent > maxim) {
            maxim = numarCurent;
        }
        if (numarCurent < minim) {
            minim = numarCurent;
        }
    }
    int divizorComun = [self celMaiMareDivizorComunIntreMaxim:maxim SiMinim:minim];
    maxim = maxim/divizorComun;
    minim = minim/divizorComun;
    
    self.resultsTextView.text = [NSString stringWithFormat:@"%d/%d",minim,maxim];
   
    
    
}

-(int)celMaiMareDivizorComunIntreMaxim:(int)numar1 SiMinim:(int)numar2{
    int rezultat = 0;
    while (numar2!= 0) {
        rezultat = numar1%numar2;
        numar1 = numar2;
        numar2 = rezultat;
    }
    
    return numar1;
}


-(void) problema643{
    /*#643. [2014-11-05 - 18:16:17]
     Se citeste un numar natural n. Afisati cifra maxima a lui n si de cate ori apare ea in numarul n.
     Exemplu: Pentru n=457170 se va afisa 7 2 (7 e cifra maxima si ea apare de 2 ori)*/
    NSArray *arrayDeLinii = [UtilsCitireScriere arrayOfStringLinesFromFileName:@"p643"];
    int numarul = [[arrayDeLinii objectAtIndex:0] intValue];
    int cifraMaxima = 0;
    int contor = 0;
    while (numarul != 0) {
        int cifra = numarul%10;
        numarul = numarul/10;
        if (cifra>cifraMaxima) {
            cifraMaxima = cifra;
            contor = 1;
        }
        else if (cifra == cifraMaxima)
            contor ++;
    }
    self.resultsTextView.text = [NSString stringWithFormat:@"cifra maxima este %d si apare de %d ori",cifraMaxima,contor];

}

-(void) problema642{
    /*Se citeste un numar natural n. Calculati si afisati rasturnatul (oglinditul) sumei cifrelor lui n.
     Exemplu: Pentru n=34565 se va afisa 32 (suma cifrelor este 23, iar rasturnatul lui 23 este 32). */
    int sumaCifrelor = 0;
    NSArray *arrayDeLinii = [UtilsCitireScriere arrayOfStringLinesFromFileName:@"p642"];
    int numarul = [[arrayDeLinii objectAtIndex:0] intValue];
    while (numarul != 0) {
        sumaCifrelor = sumaCifrelor + numarul%10;
        numarul = numarul/10;
        
    }
     int inversulSumeiCifrelor = [self inversuluiUnuiNumarIntreg:sumaCifrelor];
    self.resultsTextView.text = [NSString stringWithFormat:@"inversul sumei cifrelor este %d",inversulSumeiCifrelor];
    
}
-(int)inversuluiUnuiNumarIntreg:(int)unNumar{
    int inversul = 0;
    while (unNumar != 0) {
        inversul = inversul*10 + unNumar%10;
        unNumar = unNumar/10;
        
    }
    
    return inversul;
}

-(void)problema607{
    /*Se da un interval [a,b]. Afisati cate dintre numerele din intervalul [a,b] au proprietatea ca atat ele cat si rasturnatul lor sunt patrate perfecte (ex: 144 si 441). Se cere un algoritm eficient din punct de vederea al timpului de executie.
     Exemplu: pentru intervalul [100,1000] sunt 10 astfel de numere. */
    NSArray *arrayDeLinii = [UtilsCitireScriere arrayOfStringLinesFromFileName:@"p607"];
    int inceputInterval = [[arrayDeLinii objectAtIndex:0] intValue];
    int sfarsitInterval = [[arrayDeLinii objectAtIndex:1] intValue];
    int numar = 0;
    int contor = 0;
    int rasturnatul = 0;
    for (int i=sqrt(inceputInterval); i<sqrt(sfarsitInterval); i++) {
        numar = i*i;
        rasturnatul = [self inversuluiUnuiNumarIntreg:numar];
        if (sqrt(rasturnatul) ==  lroundf(sqrt(rasturnatul))) {
            contor++;
        }
    }
    self.resultsTextView.text = [NSString stringWithFormat:@"%d",contor];
    
}


- (void)sortareInsertie
{
    int vector[50];
    NSString *vectorString = [UtilsCitireScriere citireDinFisier:@"sortare_insertie"];
    NSArray *arrayStringuri = [UtilsCitireScriere arrayFromStringWithSpaceSeparatorFromString:vectorString];
    
    int nr = [arrayStringuri count];
    
    for (int i = 0; i <nr; i++) {
        int val = [[arrayStringuri objectAtIndex:i] intValue];
        vector[i] = val;
    }
    
    for (int i = 0; i < nr; i++) {
        
        int aux = vector[i];
        int j = i - 1;
        while (j >= 0 && aux < vector[j]) {
            vector[j+ 1] = vector[j];
            j--;
        }
        
        vector[j+ 1] = aux;
        
        
    }
    
}
-(void) problema591{
    /*Scrieti un program eficient din punct de vedere al timpului de executie, care genereaza si scrie in fisierul text munte.txt, pe prima linie, separate prin cate un spatiu, toate palindroamele-munte de exact noua cifre. Un palindrom de are aspect de munte daca cifrele sale sunt strict crescatoare pana la jumatatea numãrului(de exemplu 123454321, 123464321...).
        Pe a doua linie in fisier se va scrie numarul de palindroame-munte generate.*/
    int contor = 0;
    NSMutableString *string = [[NSMutableString alloc]init];
    for (int i = 1; i<5; i++) {
        for (int j = i+1; j<6; j++) {
            for (int k= j+1; k<7; k++) {
                for (int l = k+1 ; l<8; l++) {
                    for (int m = l+1 ; m<9; m++) {
                        [string appendString:[NSString stringWithFormat:@"%d%d%d%d%d%d%d%d%d ",i,j,k,l,m,l,k,j,i]];
                        contor++;
                    }
                }
            }
        }
    }
    [string appendString:[NSString stringWithFormat:@"\n %d",contor]];
    self.resultsTextView.text = string;
}
-(void)problema584{
    /*#584. [2014-04-03 - 13:33:09]
     Pentru numerotarea paginilor unei serii enciclopedice, formate din unul sau mai multe volume, se presupune ca se folosesc in total n cifre. Fiecare volum are exact 300 de pagini, cu exceptia, eventual, a celui din urma care ar putea avea mai putine. Numerotarea paginilor incepe cu 1 in fiecare volum.
     Se citeste de la tastatura n, numãrul de cifre (n are cel mult 9 cifre). Daca este posibil, sa se determine si sa scrie pe cran, pe linii distincte, numarul de volume din serie si numarul de pagini ale ultimului volum. Daca nu este posibil se va scrie mesajul "imposibil".
     Exemplu:
     Pentru n=999 se vor obtine 2 volume, unul cu 300 de pagini si unul cu 105 pagini (deci se vor afisa 2 si 105 pe randuri separate).
     Pentru n=900 nu se poate face numerotarea*/
    
    NSArray *arrayDeLinii = [UtilsCitireScriere arrayOfStringLinesFromFileName:@"p584"];
    int numarCifre = [[arrayDeLinii objectAtIndex:0] intValue];
    int numarCifreVolum = 9+90*2+ 201*3;
    int numarVolume = numarCifre/numarCifreVolum +1;
    int restCifre = numarCifre%numarCifreVolum;
    int numarPagini = 0;
    BOOL nuSePoate = NO;
    if (restCifre<10) {
        numarPagini = restCifre;
        
    }else if (restCifre <190){
        restCifre = restCifre - 9;
        if (restCifre% 2 == 0) {
            numarPagini = 9 + restCifre/2;
        }
        else {
            nuSePoate = YES;
        }
    }else if ((restCifre-189)%3 ==0){
        numarPagini = 99+ (restCifre-189)/3;
    }else{
        nuSePoate = YES;
    }
    if (nuSePoate) {
        self.resultsTextView.text = [NSString stringWithFormat:@"nu se poate"];
    }else{
    self.resultsTextView.text = [NSString stringWithFormat:@"numarul de volume %d, iar al doilea are %d pagini",numarVolume,numarPagini];
    }

    
}
-(void)problema569{
    /*Se citeste un numar natural n. Sa se afiseze cea mai scurta descompunere a lui n ca suma de termeni distincti din sirul lui Fibonacci.
     Exemplu: 45 se descompune ca 34+8+3*/
    NSArray *arrayDeLinii = [UtilsCitireScriere arrayOfStringLinesFromFileName:@"p569"];
    int numar = [[arrayDeLinii objectAtIndex:0] intValue];
    NSMutableString *string = [[NSMutableString alloc]init];
    while (numar>0) {
        int termenFibonaci = [self termenFibonaciMaiMicDecatNumarul:numar];
        [string appendString:[NSString stringWithFormat:@"%d+",termenFibonaci]];
        numar = numar - termenFibonaci;
    }
    self.resultsTextView.text = string;
}


-(int)termenFibonaciMaiMicDecatNumarul:(int)numarul{
    int x = 1;
    int y = 1;
    int z = 0;
    while (x+y<=numarul) {
        z = x+y;
        x = y;
        y = z;
    }
    
    return z;
    
}


@end
