//
//  RailwayScene.m
//  RLSSK
//
//  Created by Michael Vilabrera on 8/9/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "RailwayScene.h"

@implementation RailwayScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        LyricsModel *lyricsModel = [[LyricsModel alloc] init];
        [self createCustomLabel:[lyricsModel h_railwayLyrics]];
    }
    return self;
}
// some scene railway
// TODO: objects/animals scroll by
// TODO: smoke & sound from locomotive in scene
-(void)didMoveToView:(SKView *)view {
    // Create ground
    SKTexture *groundTexture = [SKTexture textureWithImageNamed:@"Ground"];
    groundTexture.filteringMode = SKTextureFilteringNearest;
    
    SKAction *moveGroundSprite = [SKAction moveByX:-groundTexture.size.width * 2 y:0 duration:0.02 * groundTexture.size.width * 2];
    SKAction *resetGroundSprite = [SKAction moveByX:groundTexture.size.width * 2 y:0 duration:0];
    SKAction *moveGroundSpritesForever = [SKAction repeatActionForever:[SKAction sequence:@[moveGroundSprite, resetGroundSprite]]];
    
    for (int i = 0; i < 2 + self.frame.size.width / (groundTexture.size.width * 2); i++) {
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithTexture:groundTexture];
        [sprite setScale:2.0];
        sprite.position = CGPointMake(i * sprite.size.width, sprite.size.height / 2);
        [sprite runAction:moveGroundSpritesForever];
        [self addChild:sprite];
    }
    
    // Create skyline
    SKTexture *skylineTexture = [SKTexture textureWithImageNamed:@"Skyline"];
    skylineTexture.filteringMode = SKTextureFilteringNearest;
    
    SKAction *moveSkylineSprite = [SKAction moveByX:-skylineTexture.size.width * 2 y:0 duration:0.1 * skylineTexture.size.width * 2];
    SKAction *resetSkylineSprite = [SKAction moveByX:skylineTexture.size.width * 2 y:0 duration:0];
    SKAction *moveSkylineSpriteForever = [SKAction repeatActionForever:[SKAction sequence:@[moveSkylineSprite, resetSkylineSprite]]];
    
    for (int i = 0; i < 2 + self.frame.size.width / (skylineTexture.size.width * 2); i++) {
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithTexture:skylineTexture];
        [sprite setScale:2.0];
        sprite.zPosition = -20;
        sprite.position = CGPointMake(i * sprite.size.width, sprite.size.height / 2 + groundTexture.size.height * 2);
        [sprite runAction:moveSkylineSpriteForever];
        [self addChild:sprite];
    }
}

// TODO: wheels up close, then animate loop until voice starts
// TODO: song gets faster/slower (?) or pitch higher/lower
// TODO: vanishing point
// TODO: window to outside

// TODO: rotate train on X axis
// TODO: rotate tracks on Y axis

@end
