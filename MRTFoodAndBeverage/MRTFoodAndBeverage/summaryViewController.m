//
//  summaryViewController.m
//  MRTFoodAndBeverage
//
//  Created by Vinay Ponna on 7/21/15.
//  Copyright (c) 2015 Vinay Ponna. All rights reserved.
//

#import "summaryViewController.h"

@interface summaryViewController ()

@end

@implementation summaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dateTimeLabel.text = [self presentDate];
   }


- (NSString *)presentDate
{
    NSDate *now = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
//    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Australia/Sydney"]];
//    NSLog(@"%@",[formatter stringFromDate:now]); //--> 9/9/11 11:54 PM
//    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Europe/Paris"]];
    NSLog(@"%@",[formatter stringFromDate:now]);
    
    NSString *date = [formatter stringFromDate:now];

    return date;
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

- (IBAction)textFieldTouchDown:(id)sender {
    
   }
@end
