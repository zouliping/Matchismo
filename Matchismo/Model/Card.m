//
//  Card.m
//  Matchismo
//
//  Created by 邹 丽萍 on 14-5-4.
//  Copyright (c) 2014年 邹 丽萍. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int) match:(NSArray *)otherCards{
    int score = 0;
    
    for (Card *card in otherCards){
        if ([card.content isEqualToString:self.content]){
            score = 1;
        }
    }
    return score;
}

@end
