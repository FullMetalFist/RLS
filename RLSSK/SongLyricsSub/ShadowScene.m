//
//  ShadowScene.m
//  RLSSK
//
//  Created by Michael Vilabrera on 8/9/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "ShadowScene.h"
#import "PBParallaxScrolling.h"

@interface ShadowScene ()

@property (nonatomic) SKSpriteNode *spriteShadow;

@end

@implementation ShadowScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        LyricsModel *lyricsModel = [[LyricsModel alloc] init];
        [self createCustomLabel:[lyricsModel h_shadowLyrics]];
    }
    return self;
}

// TODO: research serious bug EXC_BAD_ACCESS error when trying to leave scene

// TODO: accelerometer and shadow intertwined (!)
// TODO: character with shadow
// TODO: apply geometry to each node
// TODO: boy/toy/girl user touches the shadow and shadow gets longer/shorter
// TODO: skeleton (?) or balloon man or lizards/worms/snails/bugs

-(void)didMoveToView:(SKView *)view {
    for (NSInteger i = 1; i < 3; i++) {
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"ball"];
        sprite.position = CGPointMake(i * 100, self.size.height / 3);
        sprite.zPosition = 1;
        sprite.shadowCastBitMask = 1;
        [sprite setScale:0.4];
        [self addChild:sprite];
    }
    
    NSString *emitterPath = [[NSBundle mainBundle] pathForResource:@"Fire" ofType:@"sks"];
    SKEmitterNode *fireEmitter = [NSKeyedUnarchiver unarchiveObjectWithFile:emitterPath];
    fireEmitter.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    fireEmitter.name = @"fireEmitter";
    fireEmitter.zPosition = 1;
    fireEmitter.targetNode = self;
    [self addChild:fireEmitter];
    
    SKLightNode *light = [[SKLightNode alloc] init];
    light.categoryBitMask = 1;
    light.falloff = 1;
    light.ambientColor = [UIColor whiteColor];
    light.lightColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.0 alpha:0.5];
    light.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
    [fireEmitter addChild:light];
    
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        [self childNodeWithName:@"fireEmitter"].position = CGPointMake(location.x, location.y);
    }
}

@end
