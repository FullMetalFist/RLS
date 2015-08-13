//
//  SceneGroundNode.m
//  RLSSK
//
//  Created by Michael Vilabrera on 8/13/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "SceneGroundNode.h"

@implementation SceneGroundNode

+ (instancetype)groundWithSize:(CGSize)size {
    SceneGroundNode *ground = [self spriteNodeWithColor:[UIColor clearColor] size:size];
    ground.name = @"ground";
    ground.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:size];
    ground.position = CGPointMake(size.width/2, size.height/2);
    
    return ground;
}

- (void)setupPhysicsBody {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.dynamic = NO;
    // TODO: add category bitmask for connecting drop & emitter splash
}

@end
