//
//  MRTFood&Beverage.h
//  MRTFoodAndBeverage
//
//  Created by Vinay Ponna on 7/17/15.
//  Copyright (c) 2015 Vinay Ponna. All rights reserved.
//

#import <UIKit/UIkit.h>
#import <Foundation/Foundation.h>

@interface MRTFood_Beverage : NSObject

@property (nonatomic,strong) NSDictionary *root;
@property (nonatomic,strong) NSDictionary *typeOfService;
@property (nonatomic,strong) UIImage *serviceImage;
@property (nonatomic,strong) NSDictionary *serviceMenuCategory;
@property (nonatomic,strong) NSDictionary *serviceMenuItems;

- (NSDictionary *) getFoodFilenames;


@end
