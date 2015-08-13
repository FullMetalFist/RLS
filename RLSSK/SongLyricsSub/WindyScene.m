//
//  WindyScene.m
//  RLSSK
//
//  Created by Michael Vilabrera on 8/10/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "WindyScene.h"

@implementation WindyScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        LyricsModel *lyricsModel = [[LyricsModel alloc] init];
        [self createCustomLabel:[lyricsModel h_windyLyrics]];
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

- (void)didMoveToView:(SKView *)view {
    SKEmitterNode *wind = [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"Wind" ofType:@"sks"]];
    wind.position = CGPointMake(self.frame.size.width, self.frame.size.height / 2);
    wind.zPosition = -50;
    [wind advanceSimulationTime:1];
    [self addChild:wind];
}

- (void) update:(NSTimeInterval)currentTime {
    for (SKNode *node in self.children)
    {
        [node.physicsBody applyForce:CGVectorMake(200, 0)];
    }
}

@end