//
//  MRTFoodServiceRootTableViewController.m
//  MRTFoodAndBeverage
//
//  Created by Vinay Ponna on 7/17/15.
//  Copyright (c) 2015 Vinay Ponna. All rights reserved.
//


#import "MRTFoodServiceRootTableViewController.h"
#import "MRTFood&Beverage.h"
#import "MRTServiceMenuTableViewController.h"
#import "checkOut.h"

static NSString * const cellResusableIdentifier = @"serviceCell";

@interface MRTFoodServiceRootTableViewController ()
{
    NSDictionary *_fileContents;
    NSArray *serviceArray;
    NSMutableArray *tempArray;
   
}
@property (nonatomic, strong) NSArray *serviceMenuCategory;
@property (nonatomic, strong) NSArray *typeOfService;
@property (nonatomic,strong) NSString *textServiceMenu;

@end

@implementation MRTFoodServiceRootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _fileContents = [[[MRTFood_Beverage alloc]init]getFoodFilenames];
    
    NSLog(@"%@",_fileContents);
    
    self.view.backgroundColor = [UIColor clearColor];
    self.view.tintColor = [UIColor clearColor];
    self.navigationItem.rightBarButtonItem = [[checkOut sharedManager] cartCheckoutwithTarget:self andAction:@selector(cartButtonTapped:)];
}

- (void) cartButtonTapped:(UIButton *)sender{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *summaryViewController = [sb instantiateViewControllerWithIdentifier:@"summaryStoryBoard"];
    [self.navigationController pushViewController:summaryViewController animated:NO];
    
}


# pragma mark - Lazy Loading


- (NSArray *)typeOfService
{
    if (!_typeOfService) {
        _typeOfService = [_fileContents allKeys];
        NSLog(@"%@", _typeOfService);
    }
    return _typeOfService;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.typeOfService.count;
}

// number of rows in section

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    return [[[_fileContents objectForKey:[_typeOfService objectAtIndex:section]]allKeys] count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Configure Cell
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellResusableIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellResusableIdentifier];
    }
    
    NSLog(@"%@",[_typeOfService objectAtIndex:indexPath.section]);
    _serviceMenuCategory = [[_fileContents objectForKey:[_typeOfService objectAtIndex:indexPath.section]] allKeys];
    NSLog(@"service menu category: %@",_serviceMenuCategory);
    _textServiceMenu = [_serviceMenuCategory objectAtIndex:indexPath.row];
    cell.textLabel.text = _textServiceMenu;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
//{
//    return 50.0f;
//}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *titleForHeaderSection;
    
    if (section == 0) {
        titleForHeaderSection = @"Lobby Service";
    }
    else if (section == 1)
    {
        titleForHeaderSection = @"PoolSide Service";
    }
    else if (section == 2)
    {
        titleForHeaderSection = @"Room Service";
    }
    return titleForHeaderSection;
}




#pragma - UITableViewDelegate

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    [self performSegueWithIdentifier:@"serviceMenuSegue" sender:cell];
//}


#pragma - Navigation

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"serviceMenuSegue"]) {
         UITableViewCell *cell = (UITableViewCell *)sender;
      //  NSIndexPath *indexPathCell = [self.tableView indexPathForCell:cell];
        
        NSIndexPath *indexPathCell = [self.tableView indexPathForSelectedRow];

        MRTServiceMenuTableViewController  *destnationViewController = (MRTServiceMenuTableViewController *)segue.destinationViewController;        

        destnationViewController.serviceMenuItems = [[_fileContents objectForKey:[_typeOfService objectAtIndex:indexPathCell.row]] valueForKey:cell.textLabel.text];
    }

    

}
@end
