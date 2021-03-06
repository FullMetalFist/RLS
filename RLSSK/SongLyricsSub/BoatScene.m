//
//  BoatScene.m
//  RLSSK
//
//  Created by Michael Vilabrera on 8/10/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//
// TODO: toy boat with a leash user drags around
// TODO: user drags finger and makes waves
// TODO: user drags finger and makes a gust of wind (physics)
// TODO: maybe dynamically download images of water (let user decide)

#import "BoatScene.h"
#import "MenuScene.h"
#import "Utils.h"

@interface BoatScene ()

@property (nonatomic) SKSpriteNode *boat;
@property (nonatomic) NSArray *boatBouyFrames;

@end

@implementation BoatScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        LyricsModel *lyricsModel = [[LyricsModel alloc] init];
        [self createCustomLabel:[lyricsModel h_boatsLyrics]];
        
        [self createPhysicsWorld];
        
        [self addBoat];
//        [self boatFrames];    // not animating correctly
    }
    return self;
}

-(void)boatFrames {
    NSMutableArray *bouyFrames = [NSMutableArray array];    // since (float) is a keyword!
    SKTextureAtlas *boatBouyAnimatedAtlas = [SKTextureAtlas atlasNamed:@"BoatAnimate"];
    NSInteger numImages = boatBouyAnimatedAtlas.textureNames.count;
    for (NSInteger i = 1; i <= numImages; i++) {
        NSString *textureName = [NSString stringWithFormat:@"boatAnimate%lu", (long)i];
        SKTexture *temp = [boatBouyAnimatedAtlas textureNamed:textureName];
        [bouyFrames addObject:temp];
    }
    self.boatBouyFrames = bouyFrames;
}

-(void)addBoat {
    self.boat = [SKSpriteNode spriteNodeWithImageNamed:@"boat"];
    
    [self.boat setScale:0.5];
    CGPoint boatPoint = CGPointMake(self.size.width / 2, 400);
    self.boat.position = boatPoint;
    self.boat.color = [UIColor clearColor];
    self.boat.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.boat.frame.size.width / 2];
    self.boat.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.boat.physicsBody.dynamic = NO;
    self.boat.zPosition = 1;
    self.boat.name = @"boat";
    [self addChild:self.boat];
}

- (void)createPhysicsWorld {
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    
    self.physicsWorld.gravity = CGVectorMake(0, 0);
    self.physicsWorld.contactDelegate = self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    SKNode *user = [self childNodeWithName:@"boat"];
    
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self];
    SKNode *touchedNode = [self nodeAtPoint:touchLocation];
    
    if ([touchedNode.name isEqualToString:LeftButton]) {
        //
        NSLog(@"transition");
    }
    else if ([touchedNode.name isEqualToString:MenuButton]) {
        //
        NSLog(@"transition");
        SKTransition *transition = [SKTransition crossFadeWithDuration:0.5];
        SKScene *nextScene = [[MenuScene alloc] initWithSize:self.size];
        
        if ([touchedNode.name isEqualToString:MenuButton]) {
            
            [self.view presentScene:nextScene transition:transition];
        }
    }
    else if ([touchedNode.name isEqualToString:RightButton]) {
        //
        NSLog(@"transition");
    }
    else {
        // determine speed
        NSInteger minDuration = 2.0;
        NSInteger maxDuration = 4.0;
        NSInteger rangeDuration = maxDuration - minDuration;
        NSInteger actualDuration = (arc4random() % rangeDuration) + minDuration;
        
        // create an action
        SKAction *actionMove = [SKAction moveTo:CGPointMake(touchLocation.x, self.boat.position.y) duration:actualDuration];
        SKAction *turnBoat = [SKAction animateWithTextures:self.boatBouyFrames timePerFrame:0.1f resize:NO restore:YES];
        [user runAction:[SKAction group:@[actionMove, turnBoat]]];
    }
}

@end
