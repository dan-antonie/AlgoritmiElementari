//
//  ViewController.m
//  AlgoritmiElementari
//
//  Created by Horatiu on 19/01/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//

#import "ViewController.h"
#import "UtilsCitireScriere.h"
#import "IntervalOrar.h"
#import "Bomba.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *resultsTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)calculeazaProblemaCurenta:(id)sender {
    [self problema573];
    
    
   // NSMutableArray  *anArrayTest = [[NSMutableArray alloc] init];
    
    /*
    [anArrayTest addObject:[NSNumber numberWithInt:1]]; //0
    [anArrayTest addObject:[NSNumber numberWithInt:2]]; //1

    [anArrayTest addObject:[NSNumber numberWithInt:8]]; //2

    [anArrayTest addObject:[NSNumber numberWithInt:10]];//3

    [anArrayTest addObject:[NSNumber numberWithInt:2]];//4

    [anArrayTest addObject:[NSNumber numberWithInt:9]];//5

    [anArrayTest addObject:[NSNumber numberWithInt:7]];//6

    [anArrayTest addObject:[NSNumber numberWithInt:1]];//7

    [anArrayTest addObject:[NSNumber numberWithInt:3]];//8
    [anArrayTest addObject:[NSNumber numberWithInt:10]];

    
    
    
    NSMutableArray *anArray = [self productExceptSelfForArray:anArrayTest];
    NSLog(@"Rezultatul este %@", [anArray description]);

     
     
    
    
    NSString *pairs = [self pairsOfIndexesEqualsSum:10 forArray:anArrayTest];
    NSLog(@"pairs is %@", pairs);
     
     */
    
    //  [(0, 1), (3, 5), (4, 8), (10, 12), (9, 10)]
 /*   IntervalOrar *anInterval = [[IntervalOrar alloc] init];
    anInterval.oraInceput = 0;
    anInterval.oraSfarsit = 1;
    [anArrayTest addObject:anInterval];
    
    IntervalOrar *anInterval1 = [[IntervalOrar alloc] init];
    anInterval1.oraInceput = 3;
    anInterval1.oraSfarsit = 5;
    [anArrayTest addObject:anInterval1];
    
    
    IntervalOrar *anInterval2 = [[IntervalOrar alloc] init];
    anInterval2.oraInceput = 4;
    anInterval2.oraSfarsit = 8;
    [anArrayTest addObject:anInterval2];
    
    
    IntervalOrar *anInterval3 = [[IntervalOrar alloc] init];
    anInterval3.oraInceput = 10;
    anInterval3.oraSfarsit = 12;
    [anArrayTest addObject:anInterval3];
    
    IntervalOrar *anInterval4 = [[IntervalOrar alloc] init];
    anInterval4.oraInceput = 9;
    anInterval4.oraSfarsit = 10;
    [anArrayTest addObject:anInterval4];
    
//    IntervalOrar *anInterval5 = [[IntervalOrar alloc] init];
//    anInterval5.oraInceput = 11;
//    anInterval5.oraSfarsit = 12;
//    [anArrayTest addObject:anInterval5];
//    
    IntervalOrar *anInterval6 = [[IntervalOrar alloc] init];
    anInterval6.oraInceput = 17;
    anInterval6.oraSfarsit = 23;
    [anArrayTest addObject:anInterval6];
    
    IntervalOrar *anInterval7 = [[IntervalOrar alloc] init];
    anInterval7.oraInceput = 19;
    anInterval7.oraSfarsit = 21;
    [anArrayTest addObject:anInterval7];
    
    NSString *aString = [self intervaleOrareLiberePtCalendarArray:anArrayTest];
    NSLog(@"Intervale libere %@", aString);*/
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


- (NSMutableArray *)productExceptSelfForArray:(NSArray *)theArray
{
    BOOL has2OrMoreZeros = NO;
    BOOL hasOneZero = NO;
    int produsTotal = 1; //element neutru
    NSMutableArray *arrayToReturn = [NSMutableArray array];
    
    //calculez produsul total, fara zero
    for (int i = 0; i < [theArray count]; i++)
    {
        int currentElem = [[theArray objectAtIndex:i] intValue];
        
        if (currentElem == 0) {
            if (hasOneZero) {
                has2OrMoreZeros = YES;
            }else{
                hasOneZero = YES;
            }
        }
        
        if (currentElem != 0) {
            produsTotal = produsTotal * currentElem;
        }
    }
    
    //return an array of 0 elements if at least two elements are 0
    if (has2OrMoreZeros) {
        NSNumber *anIntegerZero = [NSNumber numberWithInt:0];
        for (int i = 0; i < [theArray count]; i++) {
            [arrayToReturn  addObject:anIntegerZero];
        }
    }else if (hasOneZero)
    {
        NSNumber *anIntegerZero = [NSNumber numberWithInt:0];

        for (int i = 0; i < [theArray count]; i++) {
            int currentElem = [[theArray objectAtIndex:i] intValue];
            if (currentElem != 0) {
                [arrayToReturn addObject:anIntegerZero];
            }else
            {
                [arrayToReturn addObject:[NSNumber numberWithInt:produsTotal ]];
            }
        }
    }else
    {
        for (int i = 0; i < [theArray count]; i++) {
            int currentElem = [[theArray objectAtIndex:i] intValue];
            [arrayToReturn addObject:[NSNumber numberWithInt:produsTotal/currentElem ]];
        }

    }
    
    return arrayToReturn;
    
    
}


- (NSString *)intervaleOrareLiberePtCalendarArray:(NSArray *)calendarArray
{
    NSMutableString *stringToReturn = [[NSMutableString alloc] init];
    
    
    //solutia functioneaza pt intervale orare numere intregi, pe care le marcam intr-un array
    
    NSMutableArray *arrayOreLibere = [[NSMutableArray alloc] init]; //de la 0 la 23 toate orele
    
    //initializez un vector vizitat cu 0
    for (int i = 0; i < 24; i++) {
        [arrayOreLibere addObject:[NSNumber numberWithInt:0]];
    }
    
    
    for (int i = 0; i < [calendarArray count]; i++) {
        IntervalOrar *intervalCurent = [calendarArray objectAtIndex:i];
        
        int valToReplace = [[arrayOreLibere objectAtIndex:intervalCurent.oraInceput] intValue];
        
        [arrayOreLibere replaceObjectAtIndex:intervalCurent.oraInceput withObject:[NSNumber numberWithInt:(valToReplace + 1)]]; //incepe un meeting
        
        
        valToReplace = [[arrayOreLibere objectAtIndex:intervalCurent.oraSfarsit] intValue];

        
        [arrayOreLibere replaceObjectAtIndex:intervalCurent.oraSfarsit withObject:[NSNumber numberWithInt:valToReplace - 1]]; //se termina un meeting
    }
    
    int intervalEOcupat = 0; //adaugam 1 daca intalnim 1, si scadem 1 daca intalnim 2; Daca intalnim 0 si intervalEOcupat = 0, atunci acea ora e libera
    BOOL isDeschis = NO;
    
    
    //rezolvare similara cu problema parantezelor, ca sa pastrez complexitatea in O(n)
    for (int i = 0; i < [arrayOreLibere count]; i++) { //practic parcurgem fiecare ora
        int valoareaCurenta = [[arrayOreLibere objectAtIndex:i] intValue];
        
        if (valoareaCurenta > 0) {
            intervalEOcupat += 1;
            
            if (intervalEOcupat == 1 && isDeschis) {
                isDeschis = NO;
                //int valoaraUrm = i + 1;
                
                [stringToReturn appendString:[NSString stringWithFormat:@" %d )", i]];
            }
            
        }else if (valoareaCurenta < 0)
        {
            intervalEOcupat -= 1;
            if (intervalEOcupat == 0) {
                //int valoaraAnterioara = i;

                [stringToReturn appendString:[NSString stringWithFormat:@" ( %d ", i]];
                isDeschis = YES;
            }
        }
        
    }
    
    //Mai sunt niste buguri de indecsi (e.x. se doua meetinguri se termina in acelasi timp)
    //de asemenea, daca ultimul interval este deschis la capat , ex.  (22-
    
    //Complexitatea de timp O(n)
    
    return stringToReturn;
}


- (NSMutableString *)pairsOfIndexesEqualsSum:(int)theSum forArray:(NSArray *)theArray
{
    NSMutableString *stringToReturn = [NSMutableString string];
    
    //brute force algorithm (n^2)
    for (int i = 0; i < [theArray count] - 1; i++) {
        int elemI = [[theArray objectAtIndex:i] intValue];
        for (int j = i + 1; j < [theArray count]; j++) {
            int elemJ = [[theArray objectAtIndex:j] intValue];
            if (elemI + elemJ == theSum) {
                NSLog(@"( %d , %d ) ",i, j);
                [stringToReturn appendString:[NSString stringWithFormat:@"(%d,%d) ", i, j]];
            }
        }
    }
    
    /*
     
     Se poate rezolva in n log n sau daca folosim dictionare sau multimi sau hash-uri, complexitatea depinde de implementarea lor. Se adauga insa complexitate de spatiu
     */
    
    //exemplu varianta cu functii build in pe nsarray (indexOfObject), complexitatea de timp depinde de implementare, probabil se apropie de O(n).
    
    for (int i = 0; i < [theArray count] ; i++) {
        int elemCurent = [[theArray objectAtIndex:i] intValue];
        
        int possibleJ = (int)[theArray indexOfObject:[NSNumber numberWithInt:theSum - elemCurent ]];
        
        if (possibleJ >= 0) {// != NSNotfound
            NSLog(@"Varianta cu functii built in ( %d , % d) ",i, possibleJ);
            // va afisa de doua ori perechile  de indecsi
        }

    }
    
    
    return stringToReturn;
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
-(void) problema598{
    NSMutableString *entryString = [[NSMutableString alloc]init];
    entryString = [UtilsCitireScriere citireDinFisier:@"p598"];
    NSMutableString *outputString = [[NSMutableString alloc]init];
    outputString = @" ";
    int noOfCharaters = [entryString length];
    
    NSMutableString *firstHalf =[[NSMutableString alloc]init];
    firstHalf = [entryString substringToIndex:noOfCharaters/2];
    NSString *lastHalf = @"";
    if (noOfCharaters%2 == 1) {
        lastHalf = [entryString substringFromIndex:noOfCharaters/2 + 1];
        //[entryString substringFromIndex:noOfCharaters/2];
        NSString * midleCharacterString = [entryString substringWithRange:NSMakeRange(noOfCharaters/2, 1)];
        outputString = [outputString stringByAppendingString:lastHalf];
        outputString = [outputString stringByAppendingString:midleCharacterString];
        outputString = [outputString stringByAppendingString:firstHalf];
    }else{
        lastHalf = [entryString substringFromIndex:noOfCharaters/2 ];

        outputString = [outputString stringByAppendingString:lastHalf];
        outputString = [outputString stringByAppendingString:firstHalf];
        
    }
        
    self.resultsTextView.text = outputString;
    
  }

#pragma mark - Probleme siruri de caractere
- (void)problema589containsString:(NSString *)sirulDeContinut
{
    NSMutableString *outputString = [[NSMutableString alloc]init];
    NSString  *entryString = [UtilsCitireScriere citireDinFisier:@"p589"];
    NSArray *cuvinte = [entryString componentsSeparatedByString:@" "];
    NSCharacterSet *aSet = [NSCharacterSet characterSetWithCharactersInString:@" ,;"];
    cuvinte = [entryString componentsSeparatedByCharactersInSet:aSet];
    for (int i = 0; i<[cuvinte count]; i++) {
        NSString *stringCurent = [cuvinte objectAtIndex:i];
        if ([stringCurent rangeOfString:sirulDeContinut].length > 0)
        {
            [outputString appendString:stringCurent];
            [outputString appendString:@"\n"];
        }
    }
    
    self.resultsTextView.text = outputString;
}

-(void)problema586{
    NSMutableString *outputString = [[NSMutableString alloc]init];
    NSString  *entryString = [UtilsCitireScriere citireDinFisier:@"p586"];
    NSArray *cuvinte = [entryString componentsSeparatedByString:@" "];
    NSCharacterSet *aSet = [NSCharacterSet characterSetWithCharactersInString:@" ,;"];
    
    cuvinte = [entryString componentsSeparatedByCharactersInSet:aSet];
    NSString *sirulDeContinut = [cuvinte objectAtIndex:0];
    for (int i = 1; i<[cuvinte count]; i++) {
        NSString *stringCurent = [cuvinte objectAtIndex:i];
        if ([stringCurent hasSuffix:sirulDeContinut])
        {
            [outputString appendString:stringCurent];
            [outputString appendString:@"\n"];
        }
    }
    
    self.resultsTextView.text = outputString;
}

- (void)problema585
{
    NSMutableString *outputString = [[NSMutableString alloc]initWithString:@""];
    NSString *entryString = [UtilsCitireScriere citireDinFisier:@"p585"];
    NSArray *cuvinte = [entryString componentsSeparatedByString:@" "];
    NSString *cuvantulA  = [cuvinte firstObject];
    NSString *cuvantulB = [cuvinte lastObject];
    
    //NSMutableString *sufixA = [[NSMutableString alloc] init];
    //NSMutableString *prefixB = [[NSMutableString alloc] init];
    
    
    for (int i = 0; i < [cuvantulB length]; i++) {
        NSString * prefixB = [cuvantulB substringToIndex:i];
      
        if ([cuvantulA hasSuffix:prefixB]) {
            [outputString appendString:prefixB];
            [outputString appendString:@"  "];
        }
    }
    
    if ([outputString length] == 0) {
        [outputString appendString: @"Nu exista"];
    }

    self.resultsTextView.text = outputString;

}


- (void)problema13
{
    NSString *entryString = [UtilsCitireScriere citireDinFisier:@"p13"];
    NSMutableArray *arayVocale = [[NSMutableArray alloc]init];
    [arayVocale addObject:@"a"];
    [arayVocale addObject:@"e"];
    [arayVocale addObject:@"i"];
    [arayVocale addObject:@"o"];
    [arayVocale addObject:@"u"];
     NSMutableString *outPutString = [[NSMutableString alloc]initWithString:entryString];
    for (int i = 0; i<[arayVocale count]; i++) {
        NSString *vocalaCurenta = [arayVocale objectAtIndex:i];
        
        NSRange rangeReplace = NSMakeRange(0, outPutString.length - 1);
        
        [outPutString replaceOccurrencesOfString:vocalaCurenta withString:@"" options: NSCaseInsensitiveSearch range:rangeReplace];
        
        
    }
    self.resultsTextView.text = outPutString;
    
}

- (void)problema27
{
    BOOL aGasitCeva = YES;
    
    NSString *entryString = [UtilsCitireScriere citireDinFisier:@"p27"];
    NSMutableString *outputString = [[NSMutableString alloc] initWithString:entryString];

    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < [entryString length]; i++) {
        [array addObject:[NSString stringWithFormat:@"%C", [entryString characterAtIndex:i]]];
    }
    
    
    
    
    while (aGasitCeva) {
        aGasitCeva = NO;
        
        int i = 0;
        while (i < [array count] - 1)
        {
            NSString *caracterulCurent = [array objectAtIndex:i];
            NSString *caracterulUrmator = [array objectAtIndex:i + 1];
            if ([caracterulCurent isEqualToString:caracterulUrmator]) {
                [array removeObjectAtIndex:i+ 1];
                [array removeObjectAtIndex:i];

                i --;
                i --;
                aGasitCeva = YES;
            }
            
            i ++;
        }
        
     
    }

    outputString = [array description];
    self.resultsTextView.text = outputString;
}
-(void)problema88{
    
    NSString *entryString = [UtilsCitireScriere citireDinFisier:@"p88"];
    NSMutableString *outputString = [[NSMutableString alloc] initWithString:entryString];
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < [entryString length]; i++) {
        [array addObject:[NSString stringWithFormat:@"%C", [entryString characterAtIndex:i]]];
    }
    for (int i = 0; i<[array count] - 1; i++) {
        if (i%2 ==0) {
            NSString *aux =  [array objectAtIndex:i];
            [array replaceObjectAtIndex:i withObject:[array objectAtIndex:i+1]];
            [array replaceObjectAtIndex:i+1 withObject:aux];
        }
        
            }
    

    self.resultsTextView.text = [array description];
 
}
-(void)problema259
{
    NSMutableString *outputString = [[NSMutableString alloc]init];
    NSString  *entryString = [UtilsCitireScriere citireDinFisier:@"p259"];
    NSArray *cuvinte = [entryString componentsSeparatedByString:@" "];
    NSCharacterSet *aSet = [NSCharacterSet characterSetWithCharactersInString:@" ,;"];
    cuvinte = [entryString componentsSeparatedByCharactersInSet:aSet];
    NSMutableArray *arayVocale = [[NSMutableArray alloc]init];
    [arayVocale addObject:@"a"];
    [arayVocale addObject:@"e"];
    [arayVocale addObject:@"i"];
    [arayVocale addObject:@"o"];
    [arayVocale addObject:@"u"];
    for (int i = 0 ; i<[cuvinte count]; i++) {
        BOOL arePrefixVocala = NO;
        BOOL areSufixVocala = NO;
        
        NSString *cuvantCurent = [cuvinte objectAtIndex:i];
        for (int j = 0 ; j< [arayVocale count]; j++) {
            if ([cuvantCurent hasPrefix:[arayVocale objectAtIndex:j]]) {
                arePrefixVocala = YES;
            }
            if ([cuvantCurent hasSuffix:[arayVocale objectAtIndex:j]]) {
                areSufixVocala = YES;
            }
        }
        if (areSufixVocala&&arePrefixVocala) {
            [outputString appendString:cuvantCurent];
        }
    }
    
    self.resultsTextView.text = outputString;
}


- (void)problemaBombe
{
    int a[30][30];
    for (int i = 0; i < 30; i++) {
        for (int j = 0; j < 30; j++) {
            a[i][j] = 0;
        }
        
    }
    
    //initializare bombe
    a[2][3] = 1;
    a[2][5] = 1;
    a[4][6] = 1;
    a[6][8] = 1;
    a[12][3] = 1;
    a[10][4] = 1;
    a[5][6] = 1;
    a[2][20] = 1;
    a[8][12] = 1;
    
    
    NSLog(@"Matricea initiala \n %@", [self afisareMatrice:a]);
    
    NSMutableArray *coadaBombe = [[NSMutableArray alloc] init];
    
    Bomba *bombaInitiala = [[Bomba alloc] init];
    bombaInitiala.i = 2;
    bombaInitiala.j = 3;
    
    int razaExploxizie = 7;
    
    
    
    int indexInceput = 0;
    int indexSfarsit = 0;
    [coadaBombe addObject:bombaInitiala];
    
    
    while (indexInceput <= indexSfarsit) {
        
        Bomba *bombaCurenta = [coadaBombe objectAtIndex:indexInceput];
        
        for (int i = bombaCurenta.i -razaExploxizie; i < bombaCurenta.i + razaExploxizie; i++) {
            for (int j = bombaCurenta.j -razaExploxizie; j < bombaCurenta.j + razaExploxizie; j++) {
                
                if (i > 0 && j > 0) {
                    if (a[i][j] == 1) {
                        indexSfarsit ++;
                        Bomba *nouaBombaInRaza = [[Bomba alloc] init];
                        nouaBombaInRaza.j = j;
                        nouaBombaInRaza.i = i;
                        [coadaBombe addObject:nouaBombaInRaza];
                    }
                    
                    a[i] [j] = 2 ; // adica o explodez
                 }
                
                
              
                
                
            }
        }
        
        
        
        //la sfarsit
        indexInceput ++;
        
        
    }
    
    
    NSLog(@"Matricea finala \n %@", [self afisareMatrice:a]);
    
    
    
    
    
    
    
}

- (NSString *)afisareMatrice:(int[30][30]) matricea
{
    NSMutableString *matriceaDeAfisat = [[NSMutableString alloc] init];
    for (int i = 0; i < 30; i++) {
        for (int j = 0; j < 30; j++) {
            
            [matriceaDeAfisat appendString:[NSString stringWithFormat:@"%d", matricea[i][j]]];
        }
        [matriceaDeAfisat appendString:@"\n"];
    }
    return matriceaDeAfisat;
}
-(void)problema447{
    /*Se citeste un numar natural n si apoi n cuvinte. Numarati cate dintre ele sunt anagrame ale primului cuvant citit.*/
    int count = 0;
    NSString  *entryString = [UtilsCitireScriere citireDinFisier:@"p447"];
    NSArray *cuvinte = [entryString componentsSeparatedByString:@" "];
    NSString *primulCuvant = [cuvinte objectAtIndex:0];
    for (int i=1; i<[cuvinte count]; i++) {
        NSString * cuvantulCurent = [cuvinte objectAtIndex:i];
        BOOL isAnagram = [self cuvantul:cuvantulCurent isAnagramofWord:primulCuvant];
        if (isAnagram) {
            count++;
        }
    }
    self.resultsTextView.text = [NSString stringWithFormat:@"%d",count];
}
-(BOOL)cuvantul:(NSString*)cuvant isAnagramofWord:(NSString*)cuvant2{
    BOOL isAnagram = YES;
    NSMutableArray *array1 = [NSMutableArray array];
    for (int i = 0; i < [cuvant length]; i++) {
        [array1 addObject:[NSString stringWithFormat:@"%C", [cuvant characterAtIndex:i]]];

    }
    
    NSMutableArray *array2 = [NSMutableArray array];
    for (int i = 0; i < [cuvant2 length]; i++) {
        [array2 addObject:[NSString stringWithFormat:@"%C", [cuvant2 characterAtIndex:i]]];
        
    }
    
    [array1 sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    [array2 sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    if ([array1 count] != [array2 count] ) {
        isAnagram =  NO;
    }
    
    
    for (int i = 0; i < [array1 count]; i++) {
        NSString *string1 = [array1 objectAtIndex:i];
        NSString *string2 = [array2 objectAtIndex:i];
        if (![string1 isEqualToString:string2]) {
            isAnagram =  NO;
        }
    }
    
    
    
    
    return isAnagram;
}
-(void)problema583{
    /*Din fisierul text doc.txt se citeste un text care contine informatii despre mai multe persoane, sub o forma nestructurata. Informatiile sunt dispuse pe linii de maxim 200 de caracte si pot contine CNP-uri valide. Stiind ca CNP-ul valid al unei persoane este un sir de 13 cifre consecutive, sa se scrie în fisierul text cnp.txt, pe linii distincte, toate CNP-urile extrase din text. Daca nu exista nici un CNP corect, se va scrie în fisier valoarea 0.
     Exemplu:
     doc.txt
     Popesu Grigore, 14 ani,
     1991212122334; Gigel Banu – 1031102453435,
     Bujorului 7; Dana Marin: 2690405358687,
     fara viza, 2450609987654 - Jane Doe
     cnp.txt
     1991212122334
     1031102453435
     2690405358687 
     2450609987654*/
    
    NSString *entryString = [UtilsCitireScriere citireDinFisier:@"p583"];
    NSCharacterSet *setOfSeparators = [NSCharacterSet characterSetWithCharactersInString:@" ,;-\n"];
    NSArray *arrayOfStrings = [entryString componentsSeparatedByCharactersInSet:setOfSeparators]; //array with all  substrings separated by characters " " , ",", ";"
    NSMutableString *stringWithCNPNumbers = [[NSMutableString alloc]init];
    for (int i = 0; i<[arrayOfStrings count]; i++) {
        NSString *curentString = [arrayOfStrings objectAtIndex:i];
        if ([self isANumber:curentString]&&[curentString length] == 13) {
            [stringWithCNPNumbers appendString:curentString];
            [stringWithCNPNumbers appendString:@"\n"];
        }
    }
    self.resultsTextView.text = stringWithCNPNumbers;
}
-(BOOL)isANumber:(NSString*)aString{
    NSCharacterSet *noDigit = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    if ([aString rangeOfCharacterFromSet:noDigit].location == NSNotFound){
        return YES;
    }else{
        return NO;
    }
    }

-(void)problema508{
    /*Se citesc doua cuvinte a si b avand cel mult 20 de litere fiecare. Determinati daca cuvantul b apare o singura data in cuvantul a.
     Exemple:
     a="anamaria", b="ana" raspunsul este da
     a="anamariana", b="ana" raspunsul este nu
     a="amalia", b="ana" raspunsul este nu*/
    NSString *entryString = [UtilsCitireScriere citireDinFisier:@"508"];
    NSArray *arrayOfStrings = [UtilsCitireScriere arrayFromStringWithSpaceSeparatorFromString:entryString];
    NSString *cuvantulA = [arrayOfStrings objectAtIndex:0];
    NSString *cuvantulB = [arrayOfStrings objectAtIndex:1];
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:cuvantulB options:NSRegularExpressionCaseInsensitive error:&error];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:cuvantulA options:0 range:NSMakeRange(0, [cuvantulA length])];
    NSLog(@"Found %lu",(unsigned long)numberOfMatches);
    if (numberOfMatches == 1) {
        self.resultsTextView.text = @"da";
    }else{
        self.resultsTextView.text = @"nu";
    }
    
}
-(void)problema523{
    /*Se citeste un cuvant c cu cel mult 20 de litere. Sa se elimine din cuvantul c toate aparitiile primei litere.
     Exemplu:
     c="anamaria"
     dupa prelucrare ramane "nmri"*/
    NSString *entryString = [UtilsCitireScriere citireDinFisier:@"p523"];
    NSString *firstCharacter = [entryString substringToIndex:1];
    NSString *outputString  = [entryString stringByReplacingOccurrencesOfString:firstCharacter withString:@""];
    self.resultsTextView.text = outputString;
}
-(void)problema524{
    /*Se citeste un numar natural n si apoi n cuvinte formate din cel mult 20 de litere fiecare. Da se afiseze cel mai lung cuvant care se poate forma cu doua cuvinte dintre cele citite.
     Exemplu:
     6
     arici
     iepure
     cal
     hipopotam
     oaie
     pastrav
     Cel mai lung cuvant poate fi hipopotampastrav sau pastravhipopotam */
    NSString *entryString = [UtilsCitireScriere citireDinFisier:@"p524"];
    NSArray *arrayOfStrings = [entryString componentsSeparatedByString:@"\n"];
    NSMutableString *longestWord = [arrayOfStrings objectAtIndex:0];
    NSMutableString *secondLongestWord = [arrayOfStrings objectAtIndex:0];
    for (int i = 1; i<[arrayOfStrings count]; i++) {
        NSString *currentWord = [arrayOfStrings objectAtIndex:i];
        if ([currentWord length]>[longestWord length]) {
            secondLongestWord = longestWord;
            longestWord = currentWord;
        }
    }
    self.resultsTextView.text = [NSString stringWithFormat:@"%@%@  %@%@",longestWord,secondLongestWord,secondLongestWord,longestWord];

}
-(void)problema525{
    /* Se citesc 3 cuvinte s, a si b, s avand cel mult 50 de litere, iar a si b avand acelasi cel mult 10 litere fiecare. Inlocuiti in cuvantul s toate aparitiile lui a cu b.
     Exemplu:
     s="abracadabra"
     a="bra"
     b="12345"
     va rezulta s="a12345cada12345"*/
    NSString *entryString = [UtilsCitireScriere citireDinFisier:@"p525"];
    NSArray *arrayOfStrings = [entryString componentsSeparatedByString:@"\n"];
    NSString *originaString = [arrayOfStrings objectAtIndex:0];
    NSString *stringToBeReplaced = [arrayOfStrings objectAtIndex:1];
    NSString *replacingString = [arrayOfStrings objectAtIndex:2];
    NSString *resultingString = [originaString stringByReplacingOccurrencesOfString:stringToBeReplaced withString:replacingString];
    self.resultsTextView.text = resultingString;
}
-(void)problema573{
    /*In fisierul cuvinte.in se afla cate unul pe linie un sir de cuvinte.
     Sa se scrie un program care citeste cuvintele din fisier si le afiseazã in fisierul cuvinte.out in ordine alfabetica.
     Exemplu:
     cuvinte.in
     ionut
     ana
     dana
     anca
     bomboane
     cuvinte.out
     ana 
     anca 
     bomboane 
     dana 
     ionut 
     Rezolvare*/
    NSString *entryString = [UtilsCitireScriere citireDinFisier:@"p573"];
    NSArray *arrayOfStrings= [entryString componentsSeparatedByString:@"\n"];
    
    NSArray *outputArray = [arrayOfStrings sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    NSMutableString *resultString = [[NSMutableString alloc]init];
    for (int i = 0; i<[outputArray count]; i++) {
        [resultString appendString:[outputArray objectAtIndex:i]];
        [resultString appendString:@"\n"];
    }
    self.resultsTextView.text = resultString;
     
}
@end
