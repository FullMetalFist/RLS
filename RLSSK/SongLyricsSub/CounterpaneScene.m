//
//  CounterpaneScene.m
//  RLSSK
//
//  Created by Michael Vilabrera on 8/10/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//
// TODO: toybox with random toys (soldiers, etc)
// TODO: background is a large bed

#import "CounterpaneScene.h"
#import "MenuScene.h"
#import "Utils.h"

#define ARC4RANDOM_MAX      0x100000000

static inline CGFloat ScalarRandomRange(CGFloat min,
                                        CGFloat max)
{
    return floorf(((double)arc4random() / ARC4RANDOM_MAX) *
                  (max - min) + min);
}

@interface CounterpaneScene()

@property (nonatomic) SKSpriteNode *toybox;

@end

@implementation CounterpaneScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        LyricsModel *lyricsModel = [[LyricsModel alloc] init];
        [self createCustomLabel:[lyricsModel h_counterpaneLyrics]];
        
        SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"bedsheets"];
        background.position = CGPointMake(self.size.width / 2, self.size.height / 4);
        background.zPosition = -5;
        background.size = CGSizeMake(self.size.width, self.size.height / 3);
        [self addChild:background];
        
        
        
        self.toybox = [SKSpriteNode spriteNodeWithImageNamed:@"toybox"];
        self.toybox.position = CGPointMake(self.size.width - 100, self.size.height / 3 - 150);
        self.toybox.name = @"toybox";
        [self addChild:self.toybox];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self];
    SKNode *touchedNode = [self nodeAtPoint:touchLocation];
    
    if ([touchedNode.name isEqualToString:LeftButton]) {
        //
        NSLog(@"transition");
    }
    else if ([touchedNode.name isEqualToString:MenuButton]) {
        //
        NSLog(@"transition");
        SKTransition *transition = [SKTransition crossFadeWithDuration:0.5];
        SKScene *nextScene = [[MenuScene alloc] initWithSize:self.size];
        
        if ([touchedNode.name isEqualToString:MenuButton]) {
            
            [self.view presentScene:nextScene transition:transition];
        }
    }
    else if ([touchedNode.name isEqualToString:RightButton]) {
        //
        NSLog(@"transition");
    }
    else {
        [self spawnSoldier];
    }
}

- (void)spawnSoldier {
    SKSpriteNode *toy = [SKSpriteNode spriteNodeWithImageNamed:@"toySoldier"];
    toy.name = @"toy";
    toy.position = CGPointMake(self.size.width + toy.size.width / 2, ScalarRandomRange(toy.size.height / 2, self.size.height - toy.size.height/2));
    [toy setScale:0.5];
    [self addChild:toy];
    SKAction *actionMove = [SKAction moveToX:-toy.size.width/2 duration:2.0];
    SKAction *actionRemove = [SKAction removeFromParent];
    [toy runAction:[SKAction sequence:@[actionMove, actionRemove]]];
}

@end
