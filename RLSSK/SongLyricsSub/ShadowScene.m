//
//  ShadowScene.m
//  RLSSK
//
//  Created by Michael Vilabrera on 8/9/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "ShadowScene.h"

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

// TODO: accelerometer and shadow intertwined (!)
// TODO: character with shadow
// TODO: apply geometry to each node
// TODO: boy/toy/girl user touches the shadow and shadow gets longer/shorter
// TODO: skeleton (?) or balloon man or lizards/worms/snails/bugs

-(void)didMoveToView:(SKView *)view {
    SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"ball"];
    sprite.position = CGPointMake(self.size.width / 3, self.size.height / 3);
    [self addChild:sprite];
    
    // ugly sprite warning
//    self.spriteShadow = [SKSpriteNode spriteNodeWithImageNamed:@"ballShadow"];
//    self.spriteShadow.position = sprite.position;
//    [self.spriteShadow setScale:0.3];
//    [self addChild:self.spriteShadow];
    
    self.spriteShadow = [SKSpriteNode spriteNodeWithImageNamed:@"ballShadow"];
    self.spriteShadow.position = sprite.position;

    self.spriteShadow.blendMode = SKBlendModeAlpha;
    self.spriteShadow.colorBlendFactor = 1;
    self.spriteShadow.color = [SKColor blackColor];
    self.spriteShadow.alpha = .25; // partial transparency
    [self addChild:self.spriteShadow];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        
        CGPoint touchLocation = [touch locationInNode:self];
        
        [self.spriteShadow runAction:[SKAction scaleTo:touchLocation.x / 5 duration:0.0]];
    }
}

@end
