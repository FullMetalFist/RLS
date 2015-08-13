//
//  RainScene.m
//  RLSSK
//
//  Created by Michael Vilabrera on 8/10/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//
// TODO: rain creates (spots) from the inside with emitter
// TODO: user taps and plays w rain drops
// TODO: rain drops with physics

#import "RainScene.h"

@interface RainScene()

@end

@implementation RainScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        LyricsModel *lyricsModel = [[LyricsModel alloc] init];
        [self createCustomLabel:[lyricsModel h_rainLyrics]];
        
        self.physicsWorld.gravity = CGVectorMake(0, -9.8);
        self.physicsWorld.contactDelegate = self;
        
        
    }
    return self;
}

-(void)didMoveToView:(SKView *)view {
    SKEmitterNode *rain = [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"Rain" ofType:@"sks"]];
    rain.position = CGPointMake(self.size.width / 2, self.size.height);
    rain.zPosition = -50;
    [rain advanceSimulationTime:1];     // only if we want rain to start falling already
    [self addChild:rain];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *rain = [SKSpriteNode spriteNodeWithImageNamed:@"drop"];
        rain.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:rain.frame.size.width];
        rain.physicsBody.affectedByGravity = YES;
        rain.physicsBody.velocity = CGVectorMake(0, -9.8);
        rain.position = location;
        [rain setScale:0.2];
        
        [self addChild:rain];
        // TODO: add category bitmask for connecting drop & emitter splash
    }
}

@end
