//
//  SongLyricsScene.m
//  RLSSK
//
//  Created by Michael Vilabrera on 7/30/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//
// TODO: Refactor SongLyricsScene subclasses into their own files
// TODO: Refactor SongLyricsScene subclasses into an array
//      to be called from the menu buttons

#import "SongLyricsScene.h"
#import "MenuScene.h"
#import "LyricsModel.h"

@interface SongLyricsScene() 

@property (nonatomic) SKSpriteNode *leftButton;
@property (nonatomic) SKSpriteNode *rightButton;
@property (nonatomic) SKSpriteNode *menuButton;

@end

@implementation SongLyricsScene

-(instancetype)initWithSize:(CGSize)size {
    self = [super initWithSize:size];
    if (self) {
        
        [self createButtons];
    }
    return self;
}

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    NSString *nodeTapped = node.name;
    
    SKTransition *transition = [SKTransition crossFadeWithDuration:0.5];
    SKScene *nextScene = [[MenuScene alloc] initWithSize:self.size];
    
    if ([nodeTapped isEqualToString:@"menuButton"]) {
        
        [self.view presentScene:nextScene transition:transition];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

-(void)createButtons {
    self.leftButton = [SKSpriteNode spriteNodeWithImageNamed:@"leftButton"];
    self.menuButton = [SKSpriteNode spriteNodeWithImageNamed:@"menuButton"];
    self.rightButton = [SKSpriteNode spriteNodeWithImageNamed:@"rightButton"];
    
    self.leftButton.name = @"leftButton";
    self.menuButton.name = @"menuButton";
    self.rightButton.name = @"rightButton";
    
    self.leftButton.position = CGPointMake(self.size.width * 1/3, self.size.height/6);
    self.menuButton.position = CGPointMake(self.size.width * 1/2, self.size.height/6);
    self.rightButton.position = CGPointMake(self.size.width * 2/3, self.size.height/6);
    
    [self.leftButton setScale:0.1];
    [self.menuButton setScale:0.1];
    [self.rightButton setScale:0.1];
    
    [self addChild:self.leftButton];
    [self addChild:self.menuButton];
    [self addChild:self.rightButton];
}

-(void)setButtonTargetWithLeftButton:(SKSpriteNode *)leftButton scene1:(SKScene *)scene1 rightButton:(SKSpriteNode *)rightButton scene2:(SKScene *)scene2 {
    
    // register the scene we are currently in
    // learn what our new neighbor scenes are
    // transition to the neighbor scene if pressed
    // TODO: place scenes into an array
    // TODO: dictionary as managing scenes (?) 
    
}

-(void)createCustomLabel:(NSString *)string {
    
    // TODO: give ability to change font color and background!
    NSString *tmp = string; // long string - just type whatever in here
    
    // parse through the string and put each words into an array.
    NSCharacterSet *separators = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSArray *words = [tmp componentsSeparatedByCharactersInSet:separators];
    
    NSInteger len = [tmp length];
    NSInteger width = 50; // specify your own width to fit the device screen
    
    // get the number of labelnode we need.
    NSInteger totLines = len/width + 1;
    NSInteger cnt = 0; // used to parse through the words array
    
    // here is the for loop that create all the SKLabelNode that we need to
    // display the string.
    
    for (NSInteger i=0; i<totLines; i++) {
        NSInteger lenPerLine = 0;
        NSString *lineStr = @"";
        
        while (lenPerLine<width) {
            if (cnt>[words count]-1) break; // failsafe - avoid overflow error
            lineStr = [NSString stringWithFormat:@"%@ %@", lineStr, words[cnt]];
            lenPerLine = [lineStr length];
            cnt ++;
            // NSLog(@"%@", lineStr);
        }
        // creation of the SKLabelNode itself
        SKLabelNode *_multiLineLabel = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
        _multiLineLabel.text = lineStr;
        // name each label node so you can animate it if u wish
        // the rest of the code should be self-explanatory
        _multiLineLabel.name = [NSString stringWithFormat:@"line%d",i];
        _multiLineLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
        _multiLineLabel.fontSize = 24;
//        _multiLineLabel.fontColor = [SKColor colorWithRed:1 green:1 blue:1.0 alpha:1.0];
        _multiLineLabel.fontColor = [SKColor whiteColor];
        _multiLineLabel.position = CGPointMake(self.size.width/2, self.size.height/2+200-20*i);
        _multiLineLabel.color = [SKColor greenColor];
        [self addChild:_multiLineLabel];
    }
}

@end
