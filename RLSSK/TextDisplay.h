//
//  TextDisplay.h
//  RLSSK
//
//  Created by Michael Vilabrera on 8/14/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>


@interface TextDisplay : SKNode

- (instancetype)init;
- (void)createBubbleWithText:(NSString *)text textSize:(NSInteger)size maxLineLength:(NSInteger)maxLineLength;

@end
