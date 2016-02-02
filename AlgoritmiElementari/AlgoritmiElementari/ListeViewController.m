//
//  ListeViewController.m
//  AlgoritmiElementari
//
//  Created by Horatiu on 01/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//

#import "ListeViewController.h"
#import "UtilsCitireScriere.h"

@interface ListeViewController ()
{
    NodListaSimpla *inceputLista;
}
@property (weak, nonatomic) IBOutlet UITextView *resultsTextView;

@end

@implementation ListeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    inceputLista = [UtilsCitireScriere creareListaSimplaTest];
    // Do any additional setup after loading the view.
    
}

- (void)afiseazaLista:(NodListaSimpla *)primulElement
{
    while (primulElement != nil) {
        NSLog(@"%d", primulElement.info);
        primulElement = primulElement.next;
    }
}
-(void)inserareNod:(int)infoNodDeInserat inLista:(NodListaSimpla*)primulElemntDinLista DupaNodulCuInfo:(int)infoNod{
    NodListaSimpla *unNod = [[NodListaSimpla alloc]init];
    BOOL gasit = NO;
    unNod = primulElemntDinLista;
    while (unNod !=nil) {
        if (unNod.info == infoNod) {
            NodListaSimpla *nodDeInserat = [[NodListaSimpla alloc]init];
            nodDeInserat.info = infoNodDeInserat;
            nodDeInserat.next = unNod.next;
            unNod.next = nodDeInserat;
            gasit = YES;
        }
        unNod = unNod.next;
    }
    
}
-(NodListaSimpla*)inserareNod:(int)infoNodDeInserat inLista:(NodListaSimpla*)primulElemntDinLista inainteaNoduluiCuInfo:(int)infoNod{
    BOOL gasit = NO;
   if (primulElemntDinLista.info == infoNod) {
       NodListaSimpla *unNod = [[NodListaSimpla alloc]init];
       unNod.info = infoNodDeInserat;
       unNod.next = primulElemntDinLista;
       primulElemntDinLista = unNod;
    }
    NodListaSimpla *altNod = [[NodListaSimpla alloc]init];
    altNod = primulElemntDinLista.next;
    while (altNod != nil) {
        if (altNod.next.info == infoNod) {
            NodListaSimpla *nodDeInserat = [[NodListaSimpla alloc]init];
            nodDeInserat.info = infoNodDeInserat;
            nodDeInserat.next = altNod.next;
            altNod.next = nodDeInserat;
            gasit = YES;
            altNod =altNod.next;
        }
        altNod = altNod.next;
    }
    return primulElemntDinLista;
}
-(NodListaSimpla*)stergereNod:(int)infoNod dinLista:(NodListaSimpla*)primuElement{
    
    if (primuElement.info == infoNod) {
        primuElement = primuElement.next;
    }else{
        NodListaSimpla *nod1 = [[NodListaSimpla alloc]init];
        nod1 = primuElement;
        
        while ((nod1.next.info != infoNod) && nod1) {
            nod1 = nod1.next;
        }
        NodListaSimpla *nod2 = [[NodListaSimpla alloc]init];
        nod2 = nod1.next;
        nod1.next = nod2.next;
       // nod1 = nod1.next.next;
   
        }
    return primuElement;
}
- (IBAction)calculeazaPrbCurenta:(id)sender {
    [self inserareNod:82 inLista:inceputLista DupaNodulCuInfo:74];
    inceputLista = [self stergereNod:2 dinLista:inceputLista];
    inceputLista = [self inserareNod:17 inLista:inceputLista inainteaNoduluiCuInfo:1];
    [self afiseazaLista:inceputLista];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
