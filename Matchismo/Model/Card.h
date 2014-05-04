//
//  Card.h
//  Matchismo
//
//  Created by 邹 丽萍 on 14-5-4.
//  Copyright (c) 2014年 邹 丽萍. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong,nonatomic) NSString *content;
@property (nonatomic,getter = isChosen) BOOL chosen;
@property (nonatomic,getter = isMatched) BOOL matched;

- (int)match:(NSArray *) otherCards;

@end
