//
//  PlayingCard.m
//  Matchismo
//
//  Created by 邹 丽萍 on 14-5-4.
//  Copyright (c) 2014年 邹 丽萍. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

+ (NSArray *)validSuit{
    return @[@"♣︎",@"♥︎",@"♦︎",@"♠︎"];
}

- (void)setSuit:(NSString *)suit{
    if ([[PlayingCard validSuit] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings{
    return @[@"?",@"A",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"J",@"Q",@"K"];
}

- (NSString *)content{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+ (NSUInteger)maxRank{
    return [[self rankStrings] count] - 1;
}

- (void)setRank:(NSInteger)rank{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
