//
//  CounterpaneScene.m
//  RLSSK
//
//  Created by Michael Vilabrera on 8/10/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//
// TODO: toybox with random toys (soldiers, etc)
// TODO: background is a large bed

#import "CounterpaneScene.h"

@implementation CounterpaneScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        LyricsModel *lyricsModel = [[LyricsModel alloc] init];
        [self createCustomLabel:[lyricsModel h_counterpaneLyrics]];
    }
    return self;
}

@end
