//
//  MRTServiceMenuTableViewController.m
//  MRTFoodAndBeverage
//
//  Created by Vinay Ponna on 7/17/15.
//  Copyright (c) 2015 Vinay Ponna. All rights reserved.
//

#import "MRTServiceMenuTableViewController.h"

static NSString * const cellReusableIdentifier = @"serviceMenuCell";

@interface MRTServiceMenuTableViewController ()

@end

@implementation MRTServiceMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    
    NSInteger rowCount = 0;
    if (section == 0) {
        rowCount = self.serviceMenuItems.count;
    }
    else
    {
        rowCount = 1;
    }
    return rowCount;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReusableIdentifier forIndexPath:indexPath];
    
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReusableIdentifier];
    }
    
    if (indexPath.section == 0) {
        cell.textLabel.text = self.serviceMenuItems[indexPath.row];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}

#pragma - UITableViewDelegate

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Service Menu";
    }
    else
    {
        return @".";
    }
}


@end
