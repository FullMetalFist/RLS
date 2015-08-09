//
//  MoonScene.m
//  RLSSK
//
//  Created by Michael Vilabrera on 8/9/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "MoonScene.h"

@implementation MoonScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        LyricsModel *lyricsModel = [[LyricsModel alloc] init];
        [self createCustomLabel:[lyricsModel h_moonLyrics]];
    }
    return self;
}

-(void)didMoveToView:(SKView *)view {
    
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    
    // change gravity settings
    self.physicsWorld.gravity = CGVectorMake(0, 0);
    self.physicsWorld.contactDelegate = self;   // didBeginContact: & didEndContact:
    
    [self addMoon];
}

- (void)addMoon {
    // new sprite from the ball
    SKSpriteNode *moon = [SKSpriteNode spriteNodeWithImageNamed:@"moonFace"];
    
    CGPoint moonPoint = CGPointMake(self.size.width / 2, self.size.height/2);
    moon.position = moonPoint;
    [moon setScale:0.3];
    
    moon.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:moon.frame.size.width/2];
    moon.physicsBody.friction = 0;
    moon.physicsBody.linearDamping = 0;
    moon.physicsBody.restitution = 1;
    
    // add to screen
    [self addChild:moon];
    
    // create vector
    CGVector simpleVector = CGVectorMake(10, 10);
    
    // apply vector to ball
    [moon.physicsBody applyImpulse:simpleVector];
}

@end