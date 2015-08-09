//
//  ShadowScene.m
//  RLSSK
//
//  Created by Michael Vilabrera on 8/9/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "ShadowScene.h"

@implementation ShadowScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        LyricsModel *lyricsModel = [[LyricsModel alloc] init];
        [self createCustomLabel:[lyricsModel h_shadowLyrics]];
    }
    return self;
}

// TODO: accelerometer and shadow intertwined
// TODO: character with shadow
// TODO: apply geometry to each node

@end
