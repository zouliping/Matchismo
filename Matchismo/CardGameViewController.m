//
//  CardGameViewController.m
//  Matchismo
//
//  Created by 邹 丽萍 on 14-5-4.
//  Copyright (c) 2014年 邹 丽萍. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()

@property (strong,nonatomic) Deck *deck;
@property (strong,nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *modeLabel;

@end

@implementation CardGameViewController

- (CardMatchingGame *) game{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[self createDeck]];
    }
    return _game;
}

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
//    if ([sender.currentTitle length]) {
//        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
//                          forState:UIControlStateNormal];
//        [sender setTitle:@"" forState:UIControlStateNormal];
//
//    }else{
//        Card *randomCard = [self.deck drawRandomCard];
//        if (randomCard) {
//            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
//                              forState:UIControlStateNormal];
//            [sender setTitle:randomCard.content forState:UIControlStateNormal];
//        }
//    }
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

- (void)updateUI{
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.matched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Socre: %d",self.game.score];
    }
}

- (IBAction)resetGame:(UIButton *)sender {
    self.scoreLabel.text = @"Socre: 0";
    [self.game shuffleCards:[self.cardButtons count] usingDeck:self.deck];
    
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        card.chosen = false;
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = true;
    }

}

- (NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.content : @"";
}

- (UIImage *)backgroundForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

- (IBAction)modeSwitch:(UISwitch *)sender   {
    if ([sender isOn]) {
        self.modeLabel.text = @"2-card-match mode";
    }else{
        self.modeLabel.text = @"3-card-match mode";
    }
}

@end
