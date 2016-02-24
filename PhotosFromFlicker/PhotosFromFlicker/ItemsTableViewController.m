//
//  ItemsTableViewController.m
//  PhotosFromFlicker
//
//  Created by Horatiu on 08/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//

#import "ItemsTableViewController.h"
#import "ServiceCallManager.h"

@interface ItemsTableViewController ()
@property(nonatomic,strong) NSMutableArray *arrayWithItems;
@end

@implementation ItemsTableViewController


//to do. Add a button. When click, navigate to another table view controller. In that controller, show all photos with dateTaken is this year or last year. Also ordered by day taken. Fara frc. De asemenea celula din nib cu registerCellForReuseIdentifier
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self getJsonDictionary];
    UINib *myCelNib = [UINib nibWithNibName:@"MyFlickerTableViewCell" bundle:nil];
    [self.tableView registerNib:myCelNib forCellReuseIdentifier:@"MyFlickerCell"];
   // [self.tableView setEditing:YES];
}

-(void) getJsonDictionary{
    [kServiceCallManager makeAJsonCallAtUrlString:ITEMS_URL withCompletionBlock:^(NSError *serviceCallError, id dataResult, NSURLResponse *response) {
        if (serviceCallError) {
            UIAlertView *conectionAlert = [[UIAlertView alloc]initWithTitle:@"Conection Alert" message:@"Conection fail " delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
            [conectionAlert show];
        }else
        {
            [self parseFromJsonDictionary:(NSDictionary *)dataResult];
        }
    }];

}

/*
-(void) getJsonDictionary{
    NSURLSession *sesion = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask =[sesion dataTaskWithURL:[NSURL URLWithString:ITEMS_URL] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertView *conectionAlert = [[UIAlertView alloc]initWithTitle:@"Conection Alert" message:@"Conection fail " delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
                [conectionAlert show];
            });
            
        }else{
            NSString *stringFromData = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSString *fixedString = [stringFromData stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
            NSData *fixedData = [fixedString dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:fixedData options:0 error:nil]; //  later task: to validate json [NSJSONSerialization JSONObjectWithData:data options:0 error:nil]
            [self parseFromJsonDictionary:json];
            
        }
    }];
    [dataTask resume];

}
 
 */
-(void) parseFromJsonDictionary:(NSDictionary*)dic{
    NSMutableArray *arrayOfItems = [[NSMutableArray alloc]init];
    NSArray *arrayWithItemsFromJson = [dic valueForKey:@"items"];
    for (int i=0; i<[arrayWithItemsFromJson count]; i++) {
        NSDictionary *anItem = arrayWithItemsFromJson[i];
        
        // done [todo] save the object to core data. Implement for this the CoreDataObjectWriter protocol in FlickerCoreDataPhoto
        [FlickerPhotoCoreData insertOrUpdateCoreDataObject:nil forDictionary:anItem inContext:[kCoreDataManager getCoreDataMainContext]];
        MyFlickerPhoto *aPhoto = [[MyFlickerPhoto alloc]initFromDictionary:anItem];
        [arrayOfItems addObject:aPhoto];
        }
    self.arrayWithItems = arrayOfItems;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
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

    return [self.arrayWithItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyFlickerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyFlickerCell" forIndexPath:indexPath];
    if (cell == nil) {
    cell = [[MyFlickerTableViewCell alloc]init];
        
    }
    MyFlickerPhoto *aPhoto = self.arrayWithItems[indexPath.row];
    cell.title.text = aPhoto.title;
    cell.author.text = aPhoto.author;
    cell.tags.text = aPhoto.tags;
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
