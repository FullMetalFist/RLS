//
//  SongLyricsScene.h
//  RLSSK
//
//  Created by Michael Vilabrera on 7/30/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "LyricsModel.h"

@interface SongLyricsScene : SKScene

@end

/*
 TODO: cycle through scenes within this particular SongLyricsScene
 TODO: create button to return to menu
 TODO: create SKEmitterNode for effects in differing scenes
 */

@interface SwingScene : SongLyricsScene
@end

@interface ShadowScene : SongLyricsScene
@end

@interface RailwayScene : SongLyricsScene
@end

@interface MoonScene : SongLyricsScene
@end

@interface WindyScene : SongLyricsScene
@end

@interface SunScene : SongLyricsScene
@end

@interface BoatScene : SongLyricsScene
@end

@interface RainScene : SongLyricsScene
@end

@interface WinterScene : SongLyricsScene
@end

@interface CounterpaneScene : SongLyricsScene
@end