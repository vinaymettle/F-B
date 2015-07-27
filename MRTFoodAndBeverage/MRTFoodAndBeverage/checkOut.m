//
//  checkOut.m
//  MRTFoodAndBeverage
//
//  Created by Vinay Ponna on 7/24/15.
//  Copyright (c) 2015 Vinay Ponna. All rights reserved.
//

#import "checkOut.h"

@implementation checkOut

@synthesize someProperty;

+(checkOut *)sharedManager{
    static checkOut *sharedCheckOutManger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedCheckOutManger = [[self alloc]init];
    });
    return sharedCheckOutManger;
}

- (id)init
{
    if (self = [super init]) {
        someProperty = @"Default Propert Value";
        
    }
    return self;
}
- (UIBarButtonItem *)cartCheckoutwithTarget:(id)target andAction:(SEL)action
{
    UIButton *cartButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cartButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [cartButton setImage:[UIImage imageNamed:@"cart"] forState:UIControlStateNormal];
    [cartButton setFrame:CGRectMake(0, 0, 40, 40)];
    
    UIView *containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [containerView addSubview:cartButton];
    
    UIBarButtonItem *cartButtonItem = [[UIBarButtonItem alloc] initWithCustomView:containerView];
    return cartButtonItem;
}
@end
