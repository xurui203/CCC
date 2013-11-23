//
//  MainMenu.m
//

#import "MainMenu.h"
#import "GameData.h"
#import "GameDataParser.h"

@implementation MainMenu
@synthesize iPad;


-(void) onPlay: (id) sender {
    [SceneManager goLevelSelect];
}

- (void)onOptions: (id) sender {
    [SceneManager goOptionsMenu];
}

- (void)onLearningModules: (id) sender {
    //    [SceneManager goLearningModulesMenu];
    [SceneManager goLearningModulesMenu];
}


- (id)init {
    
    if( (self=[super init])) {
        
        NSLog(@"MAIN MENU INIT");
        // Determine Device
        self.iPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
        
        // Determine Screen Size
        CGSize screenSize = [CCDirector sharedDirector].winSize;
        
        // Calculate Large Font Size
        int smallFont = screenSize.height / kFontScaleSmall;
    
        
        
        // Set font settings
        [CCMenuItemFont setFontName:@"Marker Felt"];
        [CCMenuItemFont setFontSize:smallFont];
        
        CCMenuItemImage *learn = [CCMenuItemImage itemFromNormalImage:@"learn.png"
                                                        selectedImage:@"learn.png"
                                                               target:self
                                                             selector:@selector(onLearningModules:)];
        learn.scale = .5;
        learn.zOrder = -50;
        
        CCMenu *learnMenu = [CCMenu menuWithItems: learn, nil];
        [self addChild:learnMenu];
        learnMenu.position = ccp(0,0);
        
        CCMenuItemImage *explore = [CCMenuItemImage itemFromNormalImage:@"explore.png"
                                                          selectedImage:@"explore.png"
                                                                 target:self
                                                               selector:@selector(onPlay:)];
        //
        //
        explore.zOrder = -50;
        CCMenu *exploreMenu = [CCMenu menuWithItems: explore, nil];
        [self addChild:exploreMenu];
        explore.scale = .5;
        exploreMenu.position = ccp(screenSize.width,screenSize.height/2);
        
        //        ADD BACKGROUND IMAGE
        CCSprite *background = [CCSprite spriteWithFile:@"mainBackground.jpg"];
        background.position = ccp(screenSize.width/2, screenSize.height/2);
        background.scale = .5;
        background.zOrder = -100;
        [self addChild:background];
        
        

        
        // Testing GameData
        
        GameData *gameData = [GameDataParser loadData];
        
        CCLOG(@"Read from XML 'Selected Chapter' = %i", gameData.selectedChapter);
        CCLOG(@"Read from XML 'Selected Level' = %i", gameData.selectedLevel);
        
        
        gameData.selectedChapter = 7;
        gameData.selectedLevel = 4;
        //        gameData.music = 0;
        //        gameData.sound = 0;
        
        [GameDataParser saveData:gameData];

        
        self.iPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
        
    }
    return self;
}



@end
