//
//  SwingScene.m
//  RLSSK
//
//  Created by Michael Vilabrera on 8/9/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "SwingScene.h"

@implementation SwingScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        LyricsModel *lyricsModel = [[LyricsModel alloc] init];
        [self createCustomLabel:[lyricsModel h_swingLyrics]];
    }
    return self;
}
// TODO: add touch/physics support
// TODO: girl/boy in a swing

@end
