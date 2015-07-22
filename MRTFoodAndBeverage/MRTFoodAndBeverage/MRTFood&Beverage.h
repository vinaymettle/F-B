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

@property (nonatomic,strong) NSString *typeOfService;
@property (nonatomic,strong) UIImage *serviceImage;
@property (nonatomic,strong) NSArray *serviceMenuCategory;
@property (nonatomic,strong) NSArray *serviceMenuItems;

- (instancetype)initWithTypeOfServiceName:(NSString *)typeOfService
                             serviceImage:(UIImage *)serviceImage
                      serviceMenuCategory:(NSArray *)serviceMenuCategory
                         serviceMenuItems:(NSArray *)serviceMenuItems;


@end
