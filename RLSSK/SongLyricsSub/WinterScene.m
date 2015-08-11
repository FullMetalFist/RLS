//
//  WinterScene.m
//  RLSSK
//
//  Created by Michael Vilabrera on 8/10/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//
// TODO: shake device for snow effect (snowglobe)
// TODO: fireplace/ mantle

#import "WinterScene.h"

@implementation WinterScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        LyricsModel *lyricsModel = [[LyricsModel alloc] init];
        [self createCustomLabel:[lyricsModel h_wintertimeLyrics]];
    }
    return self;
}

-(void)didMoveToView:(SKView *)view {
    SKEmitterNode *snow = [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"Snow" ofType:@"sks"]];
    snow.position = CGPointMake(self.size.width / 2, self.size.height);
    snow.zPosition = -50;
    [snow advanceSimulationTime:1];     // only if we want snow to start falling already
    [self addChild:snow];
}

@end
