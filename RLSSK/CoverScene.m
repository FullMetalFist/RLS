//
//  CoverScene.m
//  RLSSK
//
//  Created by Michael Vilabrera on 7/30/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "CoverScene.h"
#import "MenuScene.h"

@interface CoverScene()

@property (nonatomic) SKNode *storyLayer;

@end

@implementation CoverScene

-(instancetype)initWithSize:(CGSize)size {
    self = [super initWithSize:size];
    if (self) {
        self.anchorPoint = CGPointMake(0.5, 0.5);
        SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"cover"];
        background.size = self.frame.size;
        [self addChild:background];
        
        SKSpriteNode *button = [SKSpriteNode spriteNodeWithColor:[UIColor grayColor] size:CGSizeMake(300, 100)];
        button.name = @"button";
        button.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 100);
        button.color = [SKColor lightGrayColor];
        SKLabelNode *buttonLabel = [SKLabelNode labelNodeWithText:@"tap here to continue"];
        [button addChild:buttonLabel];
        [self addChild:button];
        
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
    
    if ([node.name isEqualToString:@"button"]) {
        SKTransition *reveal = [SKTransition doorsOpenHorizontalWithDuration:1.5];
        MenuScene *menuScene = [MenuScene sceneWithSize:self.frame.size];
        [self.view presentScene:menuScene transition:reveal];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
