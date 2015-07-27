//
//  MRTFood&Beverage.m
//  MRTFoodAndBeverage
//
//  Created by Vinay Ponna on 7/17/15.
//  Copyright (c) 2015 Vinay Ponna. All rights reserved.
//

#import "MRTFood&Beverage.h"
#import "checkOut.h"
NSMutableDictionary *contents;


@implementation MRTFood_Beverage

- (NSDictionary *) getFoodFilenames{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"F_B" ofType:@"plist"];
    NSMutableDictionary *fileContents = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];
    return fileContents;
}

@end
