//
//  checkOut.h
//  MRTFoodAndBeverage
//
//  Created by Vinay Ponna on 7/24/15.
//  Copyright (c) 2015 Vinay Ponna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface checkOut : NSObject {
    NSString *someProperty;
}

@property (nonatomic,retain) NSString *someProperty;

+(id)sharedManager;

//- (void) addItemToCart:(id)object;
//- (void) removeItemFromCart:(id)object;
//- (void) emptyAllItemsFromCart:(id)object;
//- (NSMutableArray *)returnArray;
- (UIBarButtonItem *)cartCheckoutwithTarget:(id)target andAction:(SEL)action;

@end
