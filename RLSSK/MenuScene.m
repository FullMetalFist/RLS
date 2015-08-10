//
//  MenuScene.m
//  RLSSK
//
//  Created by Michael Vilabrera on 7/30/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "MenuScene.h"
#import "SongLyricsScene.h"

#import "SwingScene.h"
#import "ShadowScene.h"
#import "RailwayScene.h"
#import "MoonScene.h"
#import "WindyScene.h"
#import "SunScene.h"
#import "BoatScene.h"
#import "RainScene.h"


typedef NS_ENUM(NSUInteger, titleButton){
    swingButton,
    shadowButton,
    railwayButton,
    moonButton,
    windyButton,
    sunButton,
    boatButton,
    rainButton,
    winterButton,
    counterpaneButton,
};

@interface MenuScene()

@end

@implementation MenuScene

-(instancetype)initWithSize:(CGSize)size {
    self = [super initWithSize:size];
    if (self) {
        [self loadButtons];
    }
    return self;
}

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
//    NSInteger songNumber = [node.name integerValue];
    NSString *nodeTapped = node.name;
    
    SKTransition *transition = [SKTransition doorsOpenHorizontalWithDuration:1.5];
    SKScene *nextScene = [[SongLyricsScene alloc] initWithSize:self.size];
    
//    switch (songNumber) {
//        case 0:
//            // first button pressed
//            nextScene = [[SwingScene alloc] initWithSize:self.size];
//            [self.view presentScene:nextScene transition:transition];
//            break;
//        case 1:
//            // second button pressed
//            nextScene = [[ShadowScene alloc] initWithSize:self.size];
//            [self.view presentScene:nextScene transition:transition];
//            break;
//        case 2:
//            // third button pressed
//            nextScene = [[RailwayScene alloc] initWithSize:self.size];
//            [self.view presentScene:nextScene transition:transition];
//            break;
//        case 3:
//            // fourth button pressed
//            nextScene = [[MoonScene alloc] initWithSize:self.size];
//            [self.view presentScene:nextScene transition:transition];
//            break;
//        case 4:
//            // fifth button pressed
//            nextScene = [[WindyScene alloc] initWithSize:self.size];
//            [self.view presentScene:nextScene transition:transition];
//            break;
//        case 5:
//            // sixth button pressed
//            nextScene = [[SunScene alloc] initWithSize:self.size];
//            [self.view presentScene:nextScene transition:transition];
//            break;
//        case 6:
//            // seventh button pressed
//            nextScene = [[BoatScene alloc] initWithSize:self.size];
//            [self.view presentScene:nextScene transition:transition];
//            break;
//        case 7:
//            // eigth button pressed
//            nextScene = [[RainScene alloc] initWithSize:self.size];
//            [self.view presentScene:nextScene transition:transition];
//            break;
//        case 8:
//            // ninth button pressed
//            nextScene = [[WinterScene alloc] initWithSize:self.size];
//            [self.view presentScene:nextScene transition:transition];
//            break;
//        case 9:
//            // final button pressed
//            nextScene = [[CounterpaneScene alloc] initWithSize:self.size];
//            [self.view presentScene:nextScene transition:transition];
//            break;
//        default:
//            break;
//    }
    if ([nodeTapped isEqualToString:@"swingButton"]) {
        nextScene = [[SwingScene alloc] initWithSize:self.size];
        [self.view presentScene:nextScene transition:transition];
    }
    else if ([nodeTapped isEqualToString:@"shadowButton"]) {
        nextScene = [[ShadowScene alloc] initWithSize:self.size];
        [self.view presentScene:nextScene transition:transition];
    }
    else if ([nodeTapped isEqualToString:@"railwayButton"]) {
        nextScene = [[RailwayScene alloc] initWithSize:self.size];
        [self.view presentScene:nextScene transition:transition];
    }
    else if ([nodeTapped isEqualToString:@"moonButton"]) {
        nextScene = [[MoonScene alloc] initWithSize:self.size];
        [self.view presentScene:nextScene transition:transition];
    }
    else if ([nodeTapped isEqualToString:@"windyButton"]) {
        nextScene = [[WindyScene alloc] initWithSize:self.size];
        [self.view presentScene:nextScene transition:transition];
    }
    else if ([nodeTapped isEqualToString:@"sunButton"]) {
        nextScene = [[SunScene alloc] initWithSize:self.size];
        [self.view presentScene:nextScene transition:transition];
    }
    else if ([nodeTapped isEqualToString:@"boatButton"]) {
        nextScene = [[BoatScene alloc] initWithSize:self.size];
        [self.view presentScene:nextScene transition:transition];
    }
    else if ([nodeTapped isEqualToString:@"rainButton"]) {
        nextScene = [[RainScene alloc] initWithSize:self.size];
        [self.view presentScene:nextScene transition:transition];
    }
    else if ([nodeTapped isEqualToString:@"winterButton"]) {
        nextScene = [[WinterScene alloc] initWithSize:self.size];
        [self.view presentScene:nextScene transition:transition];
    }
    else if ([nodeTapped isEqualToString:@"counterpaneButton"]) {
        nextScene = [[CounterpaneScene alloc] initWithSize:self.size];
        [self.view presentScene:nextScene transition:transition];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

-(void)loadButtons {
    SKSpriteNode *swingButton = [SKSpriteNode spriteNodeWithColor:[UIColor grayColor] size:CGSizeMake(300, 90)];
//    swingButton.name = @"swingButton";
    swingButton.name = @"swingButton";

    swingButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 450);
    SKLabelNode *swingLabel = [SKLabelNode labelNodeWithText:@"THE SWING"];
    [swingButton addChild:swingLabel];
    [self addChild:swingButton];
    
    SKSpriteNode *shadowButton = [SKSpriteNode spriteNodeWithColor:[UIColor grayColor] size:CGSizeMake(300, 90)];
    shadowButton.name = @"shadowButton";
    shadowButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 350);
    SKLabelNode *shadowLabel = [SKLabelNode labelNodeWithText:@"MY SHADOW"];
    [shadowButton addChild:shadowLabel];
    [self addChild:shadowButton];
    
    SKSpriteNode *railwayButton = [SKSpriteNode spriteNodeWithColor:[UIColor grayColor] size:CGSizeMake(300, 90)];
    railwayButton.name = @"railwayButton";
    railwayButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 250);
    SKLabelNode *railwayLabel = [SKLabelNode labelNodeWithText:@"FROM A RAILWAY CARRIAGE"];
    [railwayButton addChild:railwayLabel];
    [self addChild:railwayButton];
    
    SKSpriteNode *moonButton = [SKSpriteNode spriteNodeWithColor:[UIColor grayColor] size:CGSizeMake(300, 90)];
    moonButton.name = @"moonButton";
    moonButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 150);
    SKLabelNode *moonLabel = [SKLabelNode labelNodeWithText:@"THE MOON"];
    [moonButton addChild:moonLabel];
    [self addChild:moonButton];
    
    SKSpriteNode *windyButton = [SKSpriteNode spriteNodeWithColor:[UIColor grayColor] size:CGSizeMake(300, 90)];
    windyButton.name = @"windyButton";
    windyButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 50);
    SKLabelNode *windyLabel = [SKLabelNode labelNodeWithText:@"WINDY NIGHTS"];
    [windyButton addChild:windyLabel];
    [self addChild:windyButton];
    
    SKSpriteNode *sunButton = [SKSpriteNode spriteNodeWithColor:[UIColor grayColor] size:CGSizeMake(300, 90)];
    sunButton.name = @"sunButton";
    sunButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 50);
    SKLabelNode *sunLabel = [SKLabelNode labelNodeWithText:@"THE SUN'S TRAVELS"];
    [sunButton addChild:sunLabel];
    [self addChild:sunButton];
    
    SKSpriteNode *boatButton = [SKSpriteNode spriteNodeWithColor:[UIColor grayColor] size:CGSizeMake(300, 90)];
    boatButton.name = @"boatButton";
    boatButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 150);
    SKLabelNode *boatLabel = [SKLabelNode labelNodeWithText:@"WHERE GO THE BOATS?"];
    [boatButton addChild:boatLabel];
    [self addChild:boatButton];
    
    SKSpriteNode *rainButton = [SKSpriteNode spriteNodeWithColor:[UIColor grayColor] size:CGSizeMake(300, 90)];
    rainButton.name = @"rainButton";
    rainButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 250);
    SKLabelNode *rainLabel = [SKLabelNode labelNodeWithText:@"RAIN"];
    [rainButton addChild:rainLabel];
    [self addChild:rainButton];
    
    SKSpriteNode *winterButton = [SKSpriteNode spriteNodeWithColor:[UIColor grayColor] size:CGSizeMake(300, 90)];
    winterButton.name = @"winterButton";
    winterButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 350);
    SKLabelNode *winterLabel = [SKLabelNode labelNodeWithText:@"WINTER-TIME"];
    [winterButton addChild:winterLabel];
    [self addChild:winterButton];
    
    SKSpriteNode *counterpaneButton = [SKSpriteNode spriteNodeWithColor:[UIColor grayColor] size:CGSizeMake(300, 90)];
    counterpaneButton.name = @"counterpaneButton";
    counterpaneButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 450);
    SKLabelNode *counterpaneLabel = [SKLabelNode labelNodeWithText:@"LAND OF COUNTERPANE"];
    [counterpaneButton addChild:counterpaneLabel];
    [self addChild:counterpaneButton];
}

-(void)loadSongLyricsScene {
    SKTransition *reveal = [SKTransition fadeWithDuration:1.5];
    SongLyricsScene *menuScene = [SongLyricsScene sceneWithSize:self.frame.size];
    [self.view presentScene:menuScene transition:reveal];
}

@end
