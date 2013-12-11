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


- (void)onParents: (id) sender {
    [SceneManager goParentPage];
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
        
        CCMenuItemImage *learn = [CCMenuItemImage itemFromNormalImage:@"Back Arrow.png"
                                                        selectedImage:@"Back Arrow.png"
                                                               target:self
                                                             selector:@selector(onLearningModules:)];
        learn.zOrder = -50;
        learn.scale = 1.2;
        CCMenu *learnMenu = [CCMenu menuWithItems: learn, nil];
        [self addChild:learnMenu];
        learnMenu.position = ccp(screenSize.width/4,screenSize.height/2-50);
        
        CCMenuItemImage *explore = [CCMenuItemImage itemFromNormalImage:@"Forward Arrow (Green).png"
                                                          selectedImage:@"Forward Arrow (Green).png"
                                                                 target:self
                                                               selector:@selector(onPlay:)];
        explore.zOrder = -50;
        explore.scale = 1.2;
        CCMenu *exploreMenu = [CCMenu menuWithItems: explore, nil];
        [self addChild:exploreMenu];
        exploreMenu.position = ccp(screenSize.width-(screenSize.width/4),screenSize.height/2-50);
        
        
        CCMenuItemImage *parents = [CCMenuItemImage itemFromNormalImage:@"Forward Arrow (Red).png"
                                                          selectedImage:@"Forward Arrow (Red).png"
                                                                 target:self
                                                               selector:@selector(onParents:)];
        parents.zOrder = -50;
        CCMenu *parentMenu = [CCMenu menuWithItems: parents, nil];
        [self addChild:parentMenu];
        parents.scale = .5;
        parentMenu.position = ccp(230,35);
        
        
        
        //        ADD BACKGROUND IMAGE
        CCSprite *background = [CCSprite spriteWithFile:@"Home-Page-without-arrows.png"];
                background.scale = .5;
        background.position = ccp(screenSize.width/2, screenSize.height/2);

        background.zOrder = -100;
        [self addChild:background];
        
        

        
        // Testing GameData
        
        GameData *gameData = [GameDataParser loadData];
        
//        CCLOG(@"Read from XML 'Selected Chapter' = %i", gameData.selectedChapter);
//        CCLOG(@"Read from XML 'Selected Level' = %i", gameData.selectedLevel);
        
        
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
