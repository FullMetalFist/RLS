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
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self.toybox];
        
        SKSpriteNode *toy = [SKSpriteNode spriteNodeWithImageNamed:@"toySoldier"];
        toy.name = @"toy";
        toy.position = location;
        [toy setScale:0.05];
        [self addChild:toy];
    }
}



@end
