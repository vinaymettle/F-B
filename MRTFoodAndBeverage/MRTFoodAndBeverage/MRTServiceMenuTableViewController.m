//
//  MRTServiceMenuTableViewController.m
//  MRTFoodAndBeverage
//
//  Created by Vinay Ponna on 7/17/15.
//  Copyright (c) 2015 Vinay Ponna. All rights reserved.
//

#import "MRTServiceMenuTableViewController.h"
#import "checkOut.h"

static NSString * const cellReusableIdentifier = @"serviceMenuCell";

@interface MRTServiceMenuTableViewController ()

@end

@implementation MRTServiceMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[checkOut sharedManager] cartCheckoutwithTarget:self andAction:@selector(cartButtonTapped:)];

}
- (void) cartButtonTapped:(UIButton *)sender{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *summaryViewController = [sb instantiateViewControllerWithIdentifier:@"summaryStoryBoard"];
    [self.navigationController pushViewController:summaryViewController animated:NO];
    
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
    
        return self.serviceMenuItems.count;
 
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReusableIdentifier forIndexPath:indexPath];
    
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReusableIdentifier];
    }
    NSArray *menuItems = [_serviceMenuItems allValues];
    NSString *textItemMenu = [menuItems objectAtIndex:indexPath.row];
    cell.textLabel.lineBreakMode = NSLineBreakByCharWrapping;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:17.0];
    cell.textLabel.text = textItemMenu;
    
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
