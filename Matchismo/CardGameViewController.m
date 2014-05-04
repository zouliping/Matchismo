//
//  CardGameViewController.m
//  Matchismo
//
//  Created by 邹 丽萍 on 14-5-4.
//  Copyright (c) 2014年 邹 丽萍. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()

@property (strong,nonatomic) Deck *deck;

@end

@implementation CardGameViewController

- (Deck *) deck{
    if (!_deck) {
        _deck = [self createDeck];
    }
    return _deck;
}

- (Deck *) createDeck{
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];

    }else{
        Card *randomCard = [self.deck drawRandomCard];
        if (randomCard) {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                              forState:UIControlStateNormal];
            [sender setTitle:randomCard.content forState:UIControlStateNormal];
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
