//
//  SongLyricsScene.h
//  RLSSK
//
//  Created by Michael Vilabrera on 7/30/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "LyricsModel.h"

@interface SongLyricsScene : SKScene <SKPhysicsContactDelegate>

-(void)createCustomLabel:(NSString *)string;

@end

/*
 TODO: cycle through scenes within this particular SongLyricsScene
 TODO: create button to return to menu
 TODO: create SKEmitterNode for effects in differing scenes
 */







@interface WinterScene : SongLyricsScene
@end

@interface CounterpaneScene : SongLyricsScene
@end