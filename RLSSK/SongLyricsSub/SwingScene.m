//
//  SwingScene.m
//  RLSSK
//
//  Created by Michael Vilabrera on 8/9/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "SwingScene.h"

@implementation SwingScene {
    SKSpriteNode *_transparentpixel;
    SKSpriteNode *_pendulum;
}

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        LyricsModel *lyricsModel = [[LyricsModel alloc] init];
        [self createCustomLabel:[lyricsModel h_swingLyrics]];
    }
    return self;
}
// TODO: add touch/physics support
// TODO: girl/boy in a swing

- (void)didMoveToView:(SKView *)view {
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    
//    self.physicsWorld.gravity = CGVectorMake(0, -10);
    self.physicsWorld.contactDelegate = self;

    [self addPointAndBox];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        CGPoint nextPosition = CGPointMake(location.x, location.y);
        _transparentpixel.position = nextPosition;
        // stop paddle from going too far
        if (nextPosition.x < _transparentpixel.size.width / 2) {
            nextPosition.x = _transparentpixel.size.width / 2;
        }
        if (nextPosition.x > self.size.width - (_transparentpixel.size.width / 2)) {
            nextPosition.x = self.size.width - (_transparentpixel.size.width / 2);
        }
    }
}

- (void)addPointAndBox {
    _transparentpixel = [SKSpriteNode spriteNodeWithImageNamed:@"star"];
    _transparentpixel.color = [UIColor whiteColor];
    [_transparentpixel setPosition:CGPointMake(self.frame.size.width / 2,self.frame.size.height / 2)];
    _transparentpixel.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(1, 1)];
    _transparentpixel.physicsBody.dynamic = YES;
    [self addChild:_transparentpixel];
    
    _pendulum = [SKSpriteNode spriteNodeWithImageNamed:@"box1"];
    _pendulum.color = [UIColor whiteColor];
    [_pendulum setScale:.3];
    [_pendulum setPosition:CGPointMake(150,120)];
    _pendulum.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_pendulum.size];
    _pendulum.physicsBody.dynamic = YES;
    [self addChild:_pendulum];
    
    CGPoint pendalumjointanchor = CGPointMake(150,150);
    SKPhysicsJointPin *pendalumJointPin = [SKPhysicsJointPin jointWithBodyA:_transparentpixel.physicsBody bodyB:_pendulum.physicsBody anchor:pendalumjointanchor];
    [self.physicsWorld addJoint:pendalumJointPin];
}

@end
