//
//  RainScene.m
//  RLSSK
//
//  Created by Michael Vilabrera on 8/10/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//
// TODO: rain creates (spots) from the inside with emitter
// TODO: user taps and plays w rain drops
// TODO: rain drops with physics

#import "RainScene.h"

@implementation RainScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        LyricsModel *lyricsModel = [[LyricsModel alloc] init];
        [self createCustomLabel:[lyricsModel h_rainLyrics]];
    }
    return self;
}

-(void)didMoveToView:(SKView *)view {
    SKEmitterNode *rain = [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"Rain" ofType:@"sks"]];
    rain.position = CGPointMake(self.size.width / 2, self.size.height);
    rain.zPosition = -50;
    [rain advanceSimulationTime:1];     // only if we want rain to start falling already
    [self addChild:rain];
}

@end
