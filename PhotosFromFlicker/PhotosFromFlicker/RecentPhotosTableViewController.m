//
//  RecentPhotosTableViewController.m
//  PhotosFromFlicker
//
//  Created by Horatiu on 10/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//

#import "RecentPhotosTableViewController.h"
#import "PhotoViewController.h"
@interface RecentPhotosTableViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButon;

@end

@implementation RecentPhotosTableViewController
- (IBAction)enableEdit:(id)sender {
    if (self.tableView.editing == NO) {
        self.tableView.editing = YES;
        [self.editButon setTitle:@"Done"];
    }
    else{
        self.tableView.editing = NO;
        [self.editButon setTitle:@"Edit"];
    }
}
- (IBAction)addAPhotho:(id)sender {
    NSArray *arrayWithKeys = @[@"title",@"link",@"tags"];
    NSArray *arrayWithValues = @[@"title11",@"photoURL11",@"tags11"];
    NSDictionary *dicToBeAdded = [[NSDictionary alloc]initWithObjects:arrayWithValues forKeys:arrayWithKeys];
    [FlickerPhotoCoreData insertOrUpdateCoreDataObject:nil forDictionary:dicToBeAdded inContext:[kCoreDataManager getCoreDataMainContext]];
    [kCoreDataManager salvareBazaDeDate];
    [self initializareFRC];
    [self.tableView reloadData];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *myCelNib = [UINib nibWithNibName:@"MyFlickerTableViewCell" bundle:nil];
    [self.tableView registerNib:myCelNib forCellReuseIdentifier:@"MyFlickerCell"];
    self.managedObjectContextMainQueue = [kCoreDataManager getCoreDataMainContext];
    if (self.tableView) {
        [self initializareFRC];
        [self.tableView reloadData];
    }
}
- (NSString *)entityName
{
return @"FlickerPhotoCoreData";
}

- (NSPredicate *)fetchPredicate
{
    NSPredicate *fetchPredicate = [NSPredicate predicateWithFormat:
                                   @"(dateTaken CONTAINS[c] %@)", @"2016"];
    return fetchPredicate;
}


- (NSString *)sectionNameKeyPath
{
    return nil;
}

- (NSArray *)arrayDeSortDescriptors
{
    NSSortDescriptor *sortDupaTitlu =  [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
    NSSortDescriptor *sortDupaData =  [[NSSortDescriptor alloc] initWithKey:@"dateTaken" ascending:YES];
    NSArray *sortDescriptorsArray = [NSArray arrayWithObjects: sortDupaData, sortDupaTitlu, nil];

    return sortDescriptorsArray;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)initializareFRC{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[self entityName]];
    fetchRequest.sortDescriptors = [self arrayDeSortDescriptors];
    //fetchRequest.predicate = [self fetchPredicate];
    self.fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContextMainQueue sectionNameKeyPath:[self sectionNameKeyPath] cacheName:[kCoreDataManager generateUniqueStringForFetchedResultControllerCache]];
    self.fetchedResultsController.delegate = self;
    NSError *error = nil;
    
    [self.fetchedResultsController performFetch:&error];
}
//-(NSArray*)fetchPhotosForRecentYears{
//   
//    NSSortDescriptor *sortDupaTitlu =  [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
//    NSSortDescriptor *sortDupaData =  [[NSSortDescriptor alloc] initWithKey:@"dateTaken" ascending:YES];
//    NSArray *sortDescriptorsArray = [NSArray arrayWithObjects: sortDupaData, sortDupaTitlu, nil];
//    NSPredicate *fetchPredicate = [NSPredicate predicateWithFormat:
//                                                            @"(dateTaken CONTAINS[c] %@)", @"2016"];
//    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"FlickerPhotoCoreData"];
//    fetchRequest.sortDescriptors = sortDescriptorsArray;
//    //fetchRequest setResultType:NSDictionaryResultType;
//    fetchRequest.predicate = fetchPredicate;
//    NSError *error = nil;
//    NSArray *anArray = [[kStorageManager getCoreDataMainContext] executeFetchRequest:fetchRequest error:&error];
//    return anArray;
//    
//}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *sections = [self.fetchedResultsController sections];
    id <NSFetchedResultsSectionInfo> sectionInfo = [sections objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyFlickerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyFlickerCell" forIndexPath:indexPath];
    FlickerPhotoCoreData *aPhoto = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.title.text = [aPhoto valueForKey:@"title"];
    cell.tags.text = [aPhoto valueForKey:@"tags"];
    cell.author.text = [aPhoto valueForKey:@"author"];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
       FlickerPhotoCoreData *photoToBeDeleted = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [[kCoreDataManager getCoreDataMainContext] deleteObject:photoToBeDeleted];
        [kCoreDataManager salvareBazaDeDate];
        [self initializareFRC];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
   
        
       
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"MySegue" sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    PhotoViewController *dvc = [segue destinationViewController];
    NSIndexPath *currentIndexPath = [self.tableView indexPathForSelectedRow];
    FlickerPhotoCoreData *aPhoto = [self.fetchedResultsController objectAtIndexPath:currentIndexPath];
   
    dvc.URL = [NSURL URLWithString:aPhoto.photoUrl];
    if (dvc.URL == nil) {
        dvc.URL= [NSURL URLWithString:@"https://static.pexels.com/photos/1029/landscape-mountains-nature-clouds.jpg"];
    }
}


@end
