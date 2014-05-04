//
//  Deck.h
//  Matchismo
//
//  Created by 邹 丽萍 on 14-5-4.
//  Copyright (c) 2014年 邹 丽萍. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard: (Card *)card atTop:(BOOL) atTop;
- (void)addCard: (Card *)card;

- (Card *)drawRandomCard;

@end
