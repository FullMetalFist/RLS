//
//  SongLyricsScene.m
//  RLSSK
//
//  Created by Michael Vilabrera on 7/30/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "SongLyricsScene.h"
#import "LyricsModel.h"

@interface SongLyricsScene()

//@property (nonatomic) LyricsModel *lyricsModel;

@end

@implementation SongLyricsScene

-(instancetype)initWithSize:(CGSize)size {
    self = [super initWithSize:size];
    if (self) {
        
//        self.lyricsModel = [[LyricsModel alloc] init];
    }
    return self;
}

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
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
    SKEmitterNode *rain = [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"Snow" ofType:@"sks"]];
    rain.position = CGPointMake(self.size.width / 2, self.size.height);
    [rain advanceSimulationTime:1];     // only if we want rain to start falling already
    [self addChild:rain];
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