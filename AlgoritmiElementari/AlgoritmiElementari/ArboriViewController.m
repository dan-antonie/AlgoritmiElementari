//
//  ArboriViewController.m
//  AlgoritmiElementari
//
//  Created by Horatiu on 01/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//

#import "ArboriViewController.h"
#import "NodArbore.h"
#import "UtilsCitireScriere.h"
@interface ArboriViewController ()
{
    NodArbore *radacina;
}
@property (weak, nonatomic) IBOutlet UITextView *resultsTextView;
@end

@implementation ArboriViewController



- (IBAction)rezolvareProblema:(id)sender {
   // [self parcurgereInOrdineRadacina:radacina];
   // [self parcurgereInPreordineRadacina:radacina];
    [self afisareVectoriInterclasatiDinFisier:@"interclasare"];

}

- (void)viewDidLoad {
    [super viewDidLoad];
     radacina = [UtilsCitireScriere creareArboreDeTest];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)parcurgereInOrdineRadacina: (NodArbore*)radacina1{
    if (radacina1 == nil) {
        return;
    }
    [self parcurgereInOrdineRadacina:radacina1.st];
    NSLog(@"%d",radacina1.info);
    [self parcurgereInOrdineRadacina:radacina1.dr];
   
    
}
-(void)parcurgereInPreordineRadacina: (NodArbore*)radacina1 {
    if (radacina1 == nil) {
        return;
    }
    NSLog(@"%d",radacina1.info);
    [self parcurgereInPreordineRadacina:radacina1.st];
    [self parcurgereInPreordineRadacina:radacina1.dr];
    
}
-(void)parcurgereInPostordineRadacina: (NodArbore*)radacina1 {
    if (radacina1 == nil) {
        return;
    }
    [self parcurgereInPreordineRadacina:radacina1.st];
    [self parcurgereInPreordineRadacina:radacina1.dr];
     NSLog(@"%d",radacina1.info);
}
-(void)stergereNod:(int)infoNod dinArborereRadacina:(NodArbore*)radacina1{
    
}


- (void)afisareVectoriInterclasatiDinFisier:(NSString *)interclasareTxt
{
    NSArray *lines = [UtilsCitireScriere arrayOfStringLinesFromFileName:interclasareTxt];
    NSArray *linie1 = [UtilsCitireScriere arrayFromStringWithSpaceSeparatorFromString:[lines objectAtIndex:0]];
    
    NSArray *linie2 = [UtilsCitireScriere arrayFromStringWithSpaceSeparatorFromString:[lines objectAtIndex:1]];
    NSMutableArray *rezultat = [self interclasareVectoriOrdinati:linie1 cuVector:linie2];
    
    self.resultsTextView.text = [rezultat description];
    
}

- (NSMutableArray *)interclasareVectoriOrdinati:(NSArray *)vector1 cuVector:(NSArray *)vector2
{
    NSMutableArray *rezultat = [[NSMutableArray alloc] init];
    int i = 0;
    int j = 0;
    int k = 0;
    
    
    while (i < [vector1 count] && j < [vector2 count] ) {
        int val1 = [[vector1 objectAtIndex:i] intValue];
        int val2 = [[ vector2 objectAtIndex:j] intValue];
        if (val1 < val2) {
            NSNumber *anObject = [NSNumber numberWithInt:val1];
            [rezultat addObject:anObject];
            i++;
        }else
        {
            NSNumber *anObject = [NSNumber numberWithInt:val2];
            [rezultat addObject:anObject];
            j++;
        }
        k++;
        
    }
    if (i == [vector1 count]) {
        for (; j<[vector2 count];j++) {
            int val2 = [[ vector2 objectAtIndex:j] intValue];
            NSNumber *anObject = [NSNumber numberWithInt:val2];
            [rezultat addObject:anObject];
    
        }
    }else{
        for (; i<[vector1 count]; i++) {
            int val2 = [[ vector1 objectAtIndex:i] intValue];
            NSNumber *anObject = [NSNumber numberWithInt:val2];
            [rezultat addObject:anObject];
           
        }
    }
    
    return rezultat;

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
