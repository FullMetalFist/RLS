//
//  SunScene.m
//  RLSSK
//
//  Created by Michael Vilabrera on 8/10/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//
// TODO: drag sun up and down device to change brightness

#import "SunScene.h"
#import <CoreMotion/CoreMotion.h>

@interface SunScene()

@property (nonatomic) SKSpriteNode *sun;
@property (nonatomic) CMMotionManager *motionManager;

@end

@implementation SunScene{
    CGFloat _destX;
    CGFloat _destY;
}

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        LyricsModel *lyricsModel = [[LyricsModel alloc] init];
        [self createCustomLabel:[lyricsModel h_sunLyrics]];
        
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
    
    [self addSun];
    
    if (self.motionManager.accelerometerAvailable) {
        [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
            CGFloat currentX = self.sun.position.x;
            CGFloat currentY = self.sun.position.y;
            
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

- (void)addSun {
    // new sprite from the ball
    self.sun = [SKSpriteNode spriteNodeWithImageNamed:@"sunFace"];
    
    [self.sun setScale:0.6];
    CGPoint sunPoint = CGPointMake(self.size.width / 2, self.size.height/2);
    self.sun.position = sunPoint;
    self.sun.color = [UIColor yellowColor];
    self.sun.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.sun.frame.size.width/2];
    
    // add to screen
    [self addChild:self.sun];
}

- (void)update:(NSTimeInterval)currentTime {
    SKAction *action = [SKAction sequence:@[[SKAction moveToX:_destX duration:1],[SKAction moveToY:_destY duration:1]]];
    [self.sun runAction:action];
    
}

- (SKColor *)modifyColorWithRed:(CGFloat)red blue:(CGFloat)blue green:(CGFloat)green alpha:(CGFloat)alpha {
    SKColor *specialColor;
    
    specialColor = [SKColor colorWithRed:red
                                   green:green
                                    blue:blue
                                   alpha:alpha];
    
    return specialColor;
}

@end
