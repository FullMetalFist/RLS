//
//  MoonScene.m
//  RLSSK
//
//  Created by Michael Vilabrera on 8/9/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "MoonScene.h"
#import <CoreMotion/CoreMotion.h>

@interface MoonScene()

@property (nonatomic) SKSpriteNode *moon;
@property (nonatomic) CMMotionManager *motionManager;

@end

@implementation MoonScene {
    CGFloat _destX;
    CGFloat _destY;
}

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        LyricsModel *lyricsModel = [[LyricsModel alloc] init];
        [self createCustomLabel:[lyricsModel h_moonLyrics]];
        
        self.motionManager = [[CMMotionManager alloc] init];
        _destX = 0;
        _destY = 0;
    }
    return self;
}

-(void)didMoveToView:(SKView *)view {
    
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    
    // change gravity settings
    self.physicsWorld.gravity = CGVectorMake(0, 0);
    self.physicsWorld.contactDelegate = self;   // didBeginContact: & didEndContact:
    
    [self addMoon];
    
    if (self.motionManager.accelerometerAvailable) {
        [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
            CGFloat currentX = self.moon.position.x;
            CGFloat currentY = self.moon.position.y;
            
            if (accelerometerData.acceleration.x < 0) {
                _destX = currentX + accelerometerData.acceleration.x * 100;
            }
            else if (accelerometerData.acceleration.x > 0) {
                _destX = currentX + accelerometerData.acceleration.x * 100;
            }
            
            if (accelerometerData.acceleration.y < 0) {
                _destY = currentY + accelerometerData.acceleration.y * 100;
            }
            else if (accelerometerData.acceleration.y > 0) {
                _destY = currentY + accelerometerData.acceleration.y * 100;
            }
        }];
    }
}

- (void)addMoon {
    // new sprite from the ball
    self.moon = [SKSpriteNode spriteNodeWithImageNamed:@"moonFace"];
    
    CGPoint moonPoint = CGPointMake(self.size.width / 2, self.size.height/2);
    self.moon.position = moonPoint;
    [self.moon setScale:0.3];
    
    self.moon.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.moon.frame.size.width/2];
//    moon.physicsBody.friction = 0;
//    moon.physicsBody.linearDamping = 0;
//    moon.physicsBody.restitution = 1;
    
    // add to screen
    [self addChild:self.moon];
    
//    // create vector
//    CGVector simpleVector = CGVectorMake(10, 10);
//    
//    // apply vector to ball
//    [moon.physicsBody applyImpulse:simpleVector];
}

- (void)update:(NSTimeInterval)currentTime {
    SKAction *action = [SKAction sequence:@[[SKAction moveToX:_destX duration:1],[SKAction moveToY:_destY duration:1]]];
    [self.moon runAction:action];
}

@end