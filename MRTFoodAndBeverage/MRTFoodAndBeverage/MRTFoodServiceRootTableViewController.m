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

static NSString * const cellResusableIdentifier = @"serviceCell";

@interface MRTFoodServiceRootTableViewController ()
{
    NSArray *serviceArray;
}

@end

@implementation MRTFoodServiceRootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MRTFood_Beverage *FoodOrderService1 = [[ MRTFood_Beverage alloc]initWithTypeOfServiceName:@"Break Fast Menu" serviceImage:[UIImage imageNamed:@""] serviceMenuCategory:@[@"BreakFast Menu",@"Lunch Menu", @"Dinner Menu"] serviceMenuItems:@[@"Egg bendict",@"full_breakFast",@"green Tea",@"mushroom_riosott",@"green Tea"]];
    
     MRTFood_Beverage *FoodOrderService2 = [[ MRTFood_Beverage alloc]initWithTypeOfServiceName:@"Lunch Menu" serviceImage:[UIImage imageNamed:@""] serviceMenuCategory:@[@"CocktailBar"] serviceMenuItems:@[@"Martini",@"Vodka"]];
    
     MRTFood_Beverage *FoodOrderService3 = [[ MRTFood_Beverage alloc]initWithTypeOfServiceName:@"Dinner Menu" serviceImage:[UIImage imageNamed:@""] serviceMenuCategory:@[@"Welcome Menu"] serviceMenuItems:@[@"Water",@"Orange Juice",@"Refreshments"]];
    
    serviceArray = @[FoodOrderService1,FoodOrderService2,FoodOrderService3];
    
    self.view.backgroundColor = [UIColor clearColor];
    self.view.tintColor = [UIColor clearColor];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    NSInteger rowCount =  0;
    
    if (section == 0) {
        rowCount = serviceArray.count;
    }
    if (section == 1) {
        rowCount = 2;
    }
    if (section == 2) {
        rowCount = 2;
    }
    return rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellResusableIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellResusableIdentifier];
    }
    
    MRTFood_Beverage *orderPlace = serviceArray[indexPath.row];
    
    cell.textLabel.text = orderPlace.typeOfService;
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
        titleForHeaderSection = @"Room Service";
    }
    else if (section == 1)
    {
        titleForHeaderSection = @"PoolSide Service";
    }
    else if (section == 2)
    {
        titleForHeaderSection = @"Lobby Service";
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
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        
        MRTFood_Beverage *FoodService = serviceArray[indexPath.row];
        
        
        MRTServiceMenuTableViewController  *destnationViewController = (MRTServiceMenuTableViewController *)segue.destinationViewController;
        
        destnationViewController.serviceMenuItems = FoodService.serviceMenuItems;
    }
}
@end
