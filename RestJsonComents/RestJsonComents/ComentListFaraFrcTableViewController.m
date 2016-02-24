//
//  ComentListFaraFrcTableViewController.m
//  RestJsonComents
//
//  Created by Horatiu on 07/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//

#import "ComentListFaraFrcTableViewController.h"

@interface ComentListFaraFrcTableViewController ()

@end

@implementation ComentListFaraFrcTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getJsonDictionary];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.imputOfArrayWithComents count];
}

-(void) getJsonDictionary{
    NSURLSession *sesion = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [sesion dataTaskWithURL:[NSURL URLWithString:ENDPOINT_COMENTS] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Alert Error" message:@"nu se conecteaza" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
                [errorAlert show];

            });
            
        }else{
            NSDictionary *dictionarryFromJson = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        [self parseFromJsonDictionary:dictionarryFromJson];
        }
        
    }];
    [dataTask resume];
}
-(void)parseFromJsonDictionary:(NSDictionary*)jsonDic{
    NSMutableArray *arrayOfComents = [[NSMutableArray alloc]init];
    /*transformam obiectele in obiecte de tip coment;
     rezulta un array de comenturi;
     transmitem array de comenturi la baza de date pentru salvare
     
     */
    NSArray *arrayOfComentsFromJson = [jsonDic valueForKey:@"comments"];
    
    for (int i = 0; i < [arrayOfComentsFromJson count]; i++) {
        NSDictionary *aDicComment = [arrayOfComentsFromJson objectAtIndex:i];
        [MyCoreDataComent insertOrUpdateCoreDataObject:nil forDictionary:aDicComment inContext:[kCoreDataManager getCoreDataMainContext]];
        //MyComent *aComment = [[MyComent alloc] initFromDictionary:aDicComment];
        [arrayOfComents addObject:aDicComment];
        
    }
    self.imputOfArrayWithComents = arrayOfComents;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}







- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CelulaComent" forIndexPath:indexPath];
    
    // Configure the cell...
    MyComent *aComent = [self.imputOfArrayWithComents objectAtIndex:indexPath.row];
    cell.textLabel.text = aComent.text;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
