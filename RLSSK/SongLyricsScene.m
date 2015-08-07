//
//  SongLyricsScene.m
//  RLSSK
//
//  Created by Michael Vilabrera on 7/30/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//
// TODO: Refactor SongLyricsScene subclasses into their own files

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
        _multiLineLabel.fontColor = [SKColor colorWithRed:1 green:1 blue:1.0 alpha:1.0];
        _multiLineLabel.position = CGPointMake(self.size.width/2, self.size.height/2+200-20*i);
        _multiLineLabel.color = [UIColor blueColor];
        [self addChild:_multiLineLabel];
    }
}

@end

@implementation SwingScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        LyricsModel *lyricsModel = [[LyricsModel alloc] init];
        [self createCustomLabel:[lyricsModel h_swingLyrics]];
    }
    return self;
}
// TODO: 

@end

@implementation ShadowScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        LyricsModel *lyricsModel = [[LyricsModel alloc] init];
        [self createCustomLabel:[lyricsModel h_shadowLyrics]];
    }
    return self;
}

@end

@implementation RailwayScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        LyricsModel *lyricsModel = [[LyricsModel alloc] init];
        [self createCustomLabel:[lyricsModel h_railwayLyrics]];
    }
    return self;
}
// some scene railway
// TODO: objects/animals scroll by
-(void)didMoveToView:(SKView *)view {
    // Create ground
    SKTexture *groundTexture = [SKTexture textureWithImageNamed:@"Ground"];
    groundTexture.filteringMode = SKTextureFilteringNearest;
    
    SKAction *moveGroundSprite = [SKAction moveByX:-groundTexture.size.width * 2 y:0 duration:0.02 * groundTexture.size.width * 2];
    SKAction *resetGroundSprite = [SKAction moveByX:groundTexture.size.width * 2 y:0 duration:0];
    SKAction *moveGroundSpritesForever = [SKAction repeatActionForever:[SKAction sequence:@[moveGroundSprite, resetGroundSprite]]];
    
    for (int i = 0; i < 2 + self.frame.size.width / (groundTexture.size.width * 2); i++) {
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithTexture:groundTexture];
        [sprite setScale:2.0];
        sprite.position = CGPointMake(i * sprite.size.width, sprite.size.height / 2);
        [sprite runAction:moveGroundSpritesForever];
        [self addChild:sprite];
    }
    
    // Create skyline
    SKTexture *skylineTexture = [SKTexture textureWithImageNamed:@"Skyline"];
    skylineTexture.filteringMode = SKTextureFilteringNearest;
    
    SKAction *moveSkylineSprite = [SKAction moveByX:-skylineTexture.size.width * 2 y:0 duration:0.1 * skylineTexture.size.width * 2];
    SKAction *resetSkylineSprite = [SKAction moveByX:skylineTexture.size.width * 2 y:0 duration:0];
    SKAction *moveSkylineSpriteForever = [SKAction repeatActionForever:[SKAction sequence:@[moveSkylineSprite, resetSkylineSprite]]];
    
    for (int i = 0; i < 2 + self.frame.size.width / (skylineTexture.size.width * 2); i++) {
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithTexture:skylineTexture];
        [sprite setScale:2.0];
        sprite.zPosition = -20;
        sprite.position = CGPointMake(i * sprite.size.width, sprite.size.height / 2 + groundTexture.size.height * 2);
        [sprite runAction:moveSkylineSpriteForever];
        [self addChild:sprite];
    }
}

// TODO: wheels up close, then animate loop until voice starts
// TODO: song gets faster/slower (?) or pitch higher/lower
// TODO: vanishing point
// TODO: window to outside

@end

@implementation MoonScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        LyricsModel *lyricsModel = [[LyricsModel alloc] init];
        [self createCustomLabel:[lyricsModel h_moonLyrics]];
    }
    return self;
}

@end

@implementation WindyScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        LyricsModel *lyricsModel = [[LyricsModel alloc] init];
        [self createCustomLabel:[lyricsModel h_windyLyrics]];
    }
    return self;
}

@end

@implementation SunScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        LyricsModel *lyricsModel = [[LyricsModel alloc] init];
        [self createCustomLabel:[lyricsModel h_sunLyrics]];
    }
    return self;
}

-(void)didMoveToView:(SKView *)view {
    
    [self addBall];
}

- (void)addBall {
    // new sprite from the ball
    SKSpriteNode *ball = [SKSpriteNode spriteNodeWithImageNamed:@"ball"];
    
    CGPoint ballPoint = CGPointMake(self.size.width / 2, self.size.height/2);
    ball.position = ballPoint;
    
    ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ball.frame.size.width/2];
    ball.physicsBody.friction = 0;
    ball.physicsBody.linearDamping = 0;
    ball.physicsBody.restitution = 1;
    
    // add to screen
    [self addChild:ball];
    
    // create vector
    CGVector simpleVector = CGVectorMake(10, 10);
    
    // apply vector to ball
    [ball.physicsBody applyImpulse:simpleVector];
}

@end

@implementation BoatScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        LyricsModel *lyricsModel = [[LyricsModel alloc] init];
        [self createCustomLabel:[lyricsModel h_boatsLyrics]];
    }
    return self;
}

@end

@implementation RainScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        LyricsModel *lyricsModel = [[LyricsModel alloc] init];
        [self createCustomLabel:[lyricsModel h_rainLyrics]];
    }
    return self;
}

-(void)didMoveToView:(SKView *)view {
    SKEmitterNode *rain = [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"Rain" ofType:@"sks"]];
    rain.position = CGPointMake(self.size.width / 2, self.size.height);
    rain.zPosition = -50;
    [rain advanceSimulationTime:1];     // only if we want rain to start falling already
    [self addChild:rain];
}

@end

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

@implementation CounterpaneScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        LyricsModel *lyricsModel = [[LyricsModel alloc] init];
        [self createCustomLabel:[lyricsModel h_counterpaneLyrics]];
    }
    return self;
}

@end