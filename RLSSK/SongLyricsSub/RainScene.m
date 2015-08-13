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

static const uint32_t rainCategory = 0x1;
static const uint32_t bottomCategory = 0x1 << 1;

@implementation RainScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        LyricsModel *lyricsModel = [[LyricsModel alloc] init];
        [self createCustomLabel:[lyricsModel h_rainLyrics]];
        
        self.physicsWorld.gravity = CGVectorMake(0, -9.8);
        self.physicsWorld.contactDelegate = self;
        
        
        [self addBottomEdge];
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
        rain.name = @"rain";
        rain.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:rain.frame.size.width];
        rain.physicsBody.affectedByGravity = YES;
        rain.physicsBody.velocity = CGVectorMake(0, -9.8);
        rain.physicsBody.categoryBitMask = rainCategory;
        rain.physicsBody.contactTestBitMask = bottomCategory;
        rain.position = location;
        [rain setScale:0.2];
        
        [self addChild:rain];
        // TODO: add category bitmask for connecting drop & emitter splash
    }
}

- (void)addSplashAtPosition:(CGPoint)position {
    SKEmitterNode *splash = [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"Splash" ofType:@"sks"]];
    splash.position = position;
    [self addChild:splash];
}

- (void)addBottomEdge {
    SKNode *bottomNode = [SKNode node];
    bottomNode.physicsBody = [SKPhysicsBody bodyWithEdgeFromPoint:CGPointMake(0, 5) toPoint:CGPointMake(self.size.width, 5)];
    bottomNode.physicsBody.categoryBitMask = bottomCategory;
    [self addChild:bottomNode];
}

- (void)didBeginContact:(SKPhysicsContact *)contact {
    SKPhysicsBody *body;
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask) {
        body = contact.bodyA;
    } else {
        body = contact.bodyB;
    }
    
    if (body.categoryBitMask == rainCategory) {
        NSLog(@"Splash!");
        
        [body.node removeFromParent];
        [self addSplashAtPosition:contact.contactPoint];
    }
}

@end
