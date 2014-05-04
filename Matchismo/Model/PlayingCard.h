//
//  PlayingCard.h
//  Matchismo
//
//  Created by 邹 丽萍 on 14-5-4.
//  Copyright (c) 2014年 邹 丽萍. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSInteger rank;

+ (NSArray *)validSuit;
+ (NSUInteger)maxRank;

@end
