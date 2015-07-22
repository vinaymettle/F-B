//
//  MRTFood&Beverage.m
//  MRTFoodAndBeverage
//
//  Created by Vinay Ponna on 7/17/15.
//  Copyright (c) 2015 Vinay Ponna. All rights reserved.
//

#import "MRTFood&Beverage.h"

@implementation MRTFood_Beverage

- (instancetype)initWithTypeOfServiceName:(NSString *)typeOfService serviceImage:(UIImage *)serviceImage serviceMenuCategory:(NSArray *)serviceMenuCategory serviceMenuItems:(NSArray *)serviceMenuItems
{
    self = [super init];
    if (self) {
        _typeOfService = typeOfService;
        _serviceImage  = serviceImage;
        _serviceMenuCategory = serviceMenuCategory;
        _serviceMenuItems = serviceMenuItems;
    }
    return self;
}


@end
