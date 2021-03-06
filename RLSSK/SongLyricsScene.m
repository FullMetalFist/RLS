//
//  SongLyricsScene.m
//  RLSSK
//
//  Created by Michael Vilabrera on 7/30/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//
// TODO: Refactor SongLyricsScene subclasses into an array
//      to be called from the menu buttons
// TODO: colorize background with X Y Z Core Motion
// TODO: one sprite to create many things (mosaic)
// TODO: puzzle component
// TODO: font name
// TODO: assets
// TODO: song supports

#import "SongLyricsScene.h"
#import "MenuScene.h"
#import "LyricsModel.h"
#import "Utils.h"

static const NSInteger menuZposition = 60;

@interface SongLyricsScene()

@property (nonatomic) SKNode *buttonBar;

@property (nonatomic) SKSpriteNode *leftButton;
@property (nonatomic) SKSpriteNode *rightButton;
@property (nonatomic) SKSpriteNode *menuButton;

@property (nonatomic) SKScene *menuScene;

@end

@implementation SongLyricsScene

-(instancetype)initWithSize:(CGSize)size {
    self = [super initWithSize:size];
    if (self) {
        
        // ignore for the moment
//        [self tileBackground];
        
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
    if (!self.menuScene) {
        self.menuScene = [[MenuScene alloc] initWithSize:self.size];

    }
    
    if ([nodeTapped isEqualToString:MenuButton]) {
        
        [self.view presentScene:self.menuScene transition:transition];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

-(void)createButtons {
    self.buttonBar = [SKNode node];
    
    self.leftButton = [SKSpriteNode spriteNodeWithImageNamed:@"leftButton"];
    self.menuButton = [SKSpriteNode spriteNodeWithImageNamed:@"menuButton"];
    self.rightButton = [SKSpriteNode spriteNodeWithImageNamed:@"rightButton"];
    
    self.leftButton.name = LeftButton;
    self.menuButton.name = MenuButton;
    self.rightButton.name = RightButton;
    
    self.leftButton.position = CGPointMake(self.size.width * 1/3, self.size.height/6);
    self.menuButton.position = CGPointMake(self.size.width * 1/2, self.size.height/6);
    self.rightButton.position = CGPointMake(self.size.width * 2/3, self.size.height/6);
    
    self.buttonBar.zPosition = menuZposition - 1;
    
    self.leftButton.zPosition = menuZposition;
    self.menuButton.zPosition = menuZposition;
    self.rightButton.zPosition = menuZposition;
    
    [self.leftButton setScale:0.1];
    [self.menuButton setScale:0.1];
    [self.rightButton setScale:0.1];
    
    [self addChild:self.buttonBar];
    
    [self.buttonBar addChild:self.leftButton];
    [self.buttonBar addChild:self.menuButton];
    [self.buttonBar addChild:self.rightButton];
}

-(void)tileBackground {
    
    CGSize coverageSize = CGSizeMake(self.size.width, self.size.height);
    CGRect textureSize = CGRectMake(0, 0, 100, 100);
    CGImageRef backgroundCGImage = [UIImage imageNamed:@"backgroundCover"].CGImage;
    UIGraphicsBeginImageContext(coverageSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawTiledImage(context, textureSize, backgroundCGImage);
    UIImage *tiledBackground = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    SKTexture *backgroundTexture = [SKTexture textureWithCGImage:tiledBackground.CGImage];
    
    SKSpriteNode *backgroundDefault = [SKSpriteNode spriteNodeWithTexture:backgroundTexture];
    backgroundDefault.zPosition = -80;
    backgroundDefault.anchorPoint = CGPointMake(0, 0);
    backgroundDefault.position = CGPointMake(0.5, 0.5);
    [self addChild:backgroundDefault];
    
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
        SKLabelNode *_multiLineLabel = [SKLabelNode labelNodeWithFontNamed:FontTitle];
        _multiLineLabel.text = lineStr;
        // name each label node so you can animate it if u wish
        // the rest of the code should be self-explanatory
        _multiLineLabel.name = [NSString stringWithFormat:@"line%d",i];
        _multiLineLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
        _multiLineLabel.fontSize = 28;
//        _multiLineLabel.fontColor = [SKColor colorWithRed:1 green:1 blue:1.0 alpha:1.0];
        _multiLineLabel.fontColor = [SKColor blackColor];
        
        _multiLineLabel.position = CGPointMake(self.size.width/2, self.size.height/2 + 200 - 30*i);
        _multiLineLabel.color = [SKColor greenColor];
        
        
        [self addChild:_multiLineLabel];
    }
}

@end
