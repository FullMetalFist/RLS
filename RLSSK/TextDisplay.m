//
//  TextDisplay.m
//  RLSSK
//
//  Created by Michael Vilabrera on 8/14/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "TextDisplay.h"
#import "Utils.h"

@implementation TextDisplay {
    NSMutableArray *_linesArray;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _linesArray = [NSMutableArray array];
    }
    return self;
}

- (void)createBubbleWithText:(NSString *)text
                    textSize:(NSInteger)size
               maxLineLength:(NSInteger)maxLineLength {
    NSMutableString *passedText = [NSMutableString stringWithString:text];
    NSMutableString *currentLine = [NSMutableString string];
    NSUInteger characterCounter = 0;
    BOOL keepGoing = true;
    
    while (keepGoing) {
        NSRange whiteSpaceRange = [passedText rangeOfCharacterFromSet:[NSCharacterSet whitespaceCharacterSet]];
        
        if (whiteSpaceRange.location != NSNotFound) {
            characterCounter += whiteSpaceRange.location;
            
            if (characterCounter <= maxLineLength) {
                [currentLine appendString:[passedText substringWithRange:NSMakeRange(0, whiteSpaceRange.location + 1)]];
                [passedText setString:[passedText substringWithRange:NSMakeRange(whiteSpaceRange.location + 1, [passedText length] - whiteSpaceRange.location - 1)]];
            }
            else {
                [currentLine setString:[currentLine substringWithRange:NSMakeRange(0, [currentLine length] - 1)]];
                
                SKLabelNode *textNode = [SKLabelNode labelNodeWithFontNamed:FontTitle];
                textNode.text = [NSString stringWithString:currentLine];
                textNode.fontSize = size;
                textNode.fontColor = [SKColor whiteColor];
                textNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
                textNode.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
                textNode.zPosition = -1;
                [_linesArray addObject:textNode];
                
                keepGoing = false;
            }
        }
        
        if ([_linesArray count] == 1) {
            SKAction *block0 = [SKAction runBlock:^{
                SKLabelNode *nodeZero = [_linesArray objectAtIndex:0];
                nodeZero.alpha = 0.0;
                [self addChild:nodeZero];
                [nodeZero runAction:[SKAction fadeAlphaTo:1.0 duration:0.5]];
            }];
            
            SKAction *wait1 = [SKAction waitForDuration:2.5];
            
            SKAction *block1 = [SKAction runBlock:^{
                SKLabelNode *nodeOne = [_linesArray objectAtIndex:0];
                [nodeOne runAction:[SKAction fadeAlphaTo:0.0 duration:0.5]];
            }];
            
            SKAction *wait2 = [SKAction waitForDuration:0.5];
            
            SKAction *block2 = [SKAction runBlock:^{
                [[_linesArray objectAtIndex:0] removeFromParent];
            }];
            
            [self runAction:[SKAction sequence:@[block0, wait1, block1, wait2, block2]]];
        }
    }
    
    if([_linesArray count] == 2) {
        float heightCounter = 0.0;
        
        for (int i = 0; i<[_linesArray count]; i++) {
            
            SKAction *wait0 = [SKAction waitForDuration:(2.0 * i)];
            
            SKAction *block0 = [SKAction runBlock:^{
                SKLabelNode *textNode = [_linesArray objectAtIndex:i];
                textNode.alpha = 0.0;
                textNode.position = CGPointMake(0, 0);
                [self addChild:textNode];
                [[_linesArray objectAtIndex:i] runAction:[SKAction fadeAlphaTo:1.0 duration:0.5]];
            }];
            
            SKAction *wait1 = [SKAction waitForDuration:1.5];
            
            heightCounter += 30;
            
            SKAction *block1 = [SKAction runBlock:^{
                [[_linesArray objectAtIndex:i] runAction:[SKAction moveToY:heightCounter duration:0.5]];
            }];
            
            SKAction *block2 = [SKAction runBlock:^{
                [[_linesArray objectAtIndex:i] runAction:[SKAction fadeAlphaTo:0.0 duration:0.5]];
            }];
            
            SKAction *wait2 = [SKAction waitForDuration:0.5];
            
            SKAction *block3 = [SKAction runBlock:^{
                [[_linesArray objectAtIndex:i] removeFromParent];
            }];
            
            [self runAction:[SKAction sequence:@[wait0, block0, wait1, block1, wait1, block2, wait2, block3]]];
            
            heightCounter = 0;
        }
    }
    
    if([_linesArray count] >= 3) {
        float heightCounter = 0.0;
        
        for (int i = 0; i<[_linesArray count]; i++) {
            
            SKAction *wait0 = [SKAction waitForDuration:(1.5 * i)];
            
            SKAction *block0 = [SKAction runBlock:^{
                SKLabelNode *textNode = [_linesArray objectAtIndex:i];
                textNode.alpha = 0.0;
                textNode.position = CGPointMake(0, 0);
                [self addChild:textNode];
                [[_linesArray objectAtIndex:i] runAction:[SKAction fadeAlphaTo:1.0 duration:0.5]];
            }];
            
            SKAction *wait1 = [SKAction waitForDuration:1.5];
            
            heightCounter += 30;
            
            SKAction *block1 = [SKAction runBlock:^{
                [[_linesArray objectAtIndex:i] runAction:[SKAction moveToY:heightCounter duration:0.5]];
            }];
            
            heightCounter += 30;
            
            SKAction *block5 = [SKAction runBlock:^{
                [[_linesArray objectAtIndex:i] runAction:[SKAction moveToY:heightCounter duration:0.5]];
            }];
            
            SKAction *block2 = [SKAction runBlock:^{
                [[_linesArray objectAtIndex:i] runAction:[SKAction fadeAlphaTo:0.0 duration:0.5]];
            }];
            
            SKAction *wait2 = [SKAction waitForDuration:0.5];
            
            SKAction *block3 = [SKAction runBlock:^{
                [[_linesArray objectAtIndex:i] removeFromParent];
            }];
            
            [self runAction:[SKAction sequence:@[wait0, block0, wait1, block1, wait1, block5, wait1, block2, wait2, block3]]];
            
            heightCounter = 0;
        }
    }
}

@end
