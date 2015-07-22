//
//  MRTDetailMenuTableViewController.m
//  MRTFoodAndBeverage
//
//  Created by Vinay Ponna on 7/17/15.
//  Copyright (c) 2015 Vinay Ponna. All rights reserved.
//

#import "MRTDetailMenuTableViewController.h"

static NSString * const cellResusableIdentifier = @"titleCell";


@interface MRTDetailMenuTableViewController ()


@end

@implementation MRTDetailMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == 0 ) {
        return 3;
    }
    else if (section == 1)
    {
        return 6;
    }
    else
    {return 1;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellResusableIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellResusableIdentifier] ;
    }
    if ([cell.contentView subviews]) {
        for (UIView *v in [cell.contentView subviews])
        {
            [v removeFromSuperview];
        }

    }
    
    
        if (indexPath.section == 0) {
            cell.textLabel.lineBreakMode = NSLineBreakByCharWrapping;
            cell.textLabel.numberOfLines = 0;
            cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:17.0];
            cell.textLabel.text = [NSString stringWithFormat:@"Marriot Burger: $14.25"];
        }
        else if (indexPath.section == 1)
        {
            cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:17.0];
            cell.textLabel.text = [NSString stringWithFormat:@"Chicken Burger: $6.25"];

        }
    
    else if (indexPath.section == 2) {
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0.0, 0.0, cell.frame.size.width, cell.frame.size.height)];
        [textView setBackgroundColor:[UIColor lightGrayColor]];
        [cell.contentView addSubview:textView];
       
    }
    
    else if (indexPath.section == 3){
        
//        for (int i = 0; i <= 1; i++) {
        
            UIButton *continueShopping = [UIButton buttonWithType:UIButtonTypeSystem];
            [continueShopping setFrame:CGRectMake(0, 0, cell.frame.size.width/2, cell.frame.size.height)];
            continueShopping.backgroundColor = [UIColor blueColor];
            [continueShopping setTitle:@"continue Shopping" forState:UIControlStateNormal];
            [continueShopping setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [continueShopping addTarget:self action:@selector(continueShoppingClicked:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:continueShopping];
        
            UIButton *addToCart = [UIButton buttonWithType:UIButtonTypeSystem];
            [addToCart setFrame:CGRectMake(cell.frame.size.width/2 + cell.frame.size.width /50, 0, cell.frame.size.width/2, cell.frame.size.height)];
            addToCart.backgroundColor = [UIColor blueColor];
            [addToCart setTitle:@"Add to Cart" forState:UIControlStateNormal];
        [addToCart setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [addToCart addTarget:self action:@selector(addToCartClicked:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:addToCart];
//        }
        
        
        
    }
      return cell;
    
}
- (void)continueShoppingClicked:(UIButton *) sender {
    NSLog(@"You Have Clicked continueShoppingButton");
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void) addToCartClicked:(UIButton *)sender{
   
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *summaryViewController = [sb instantiateViewControllerWithIdentifier:@"summaryStoryBoard"];
    [self.navigationController pushViewController:summaryViewController animated:NO];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2)
    {
        return 120;
    }
    else if(indexPath.section == 3)
    {
        return 90;
    }
    else
    {
        return 55;
    }
}


#pragma - UITableViewDelegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
  
   NSArray *selectedRows = [self.tableView indexPathsForSelectedRows];
    
    BOOL allowedSelections = selectedRows.count <= 2;
    NSLog(@"%i", allowedSelections);
   
          if (allowedSelections && cell.accessoryType == UITableViewCellAccessoryNone) {
           cell.accessoryType = UITableViewCellAccessoryCheckmark;
           cell.contentView.alpha = 0.3;
              allowedSelections ++;
       }
   
    

   }

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.contentView.alpha = 1.0;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   

}







    
@end
