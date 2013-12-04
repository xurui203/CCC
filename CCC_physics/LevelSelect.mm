//
//  LevelSelect.m
//  

#import "LevelSelect.h"
#import "Level.h"
#import "Levels.h"
#import "LevelParser.h"
#import "GameData.h"
#import "GameDataParser.h"
#import "Chapter.h"
#import "Chapters.h"
#import "ChapterParser.h"

@implementation LevelSelect  
@synthesize iPad, device;

- (void) onPlay: (CCMenuItemImage*) sender {

// // the selected level is determined by the tag in the menu item 
//    int selectedLevel = sender.tag;
//    
// // store the selected level in GameData
//    GameData *gameData = [GameDataParser loadData];
//    gameData.selectedLevel = selectedLevel;
//    [GameDataParser saveData:gameData];
//    NSLog(@"Selected level is %d", selectedLevel);
// // load the game scene
//    [SceneManager goMaze: selectedLevel];
    
    [SceneManager goMaze:1];

}

- (void)onBack: (id) sender {
    /* 
     This is where you choose where clicking 'back' sends you.
     */
    [SceneManager goMainMenu];
}

- (void)addBackButton {

    NSString *normal = [NSString stringWithFormat:@"Back Arrow.png"];
    NSString *selected = [NSString stringWithFormat:@"Back Arrow.png"];        
    CCMenuItemImage *goBack = [CCMenuItemImage itemFromNormalImage:normal 
                                                     selectedImage:selected
                                                            target:self 
                                                          selector:@selector(onBack:)];
    goBack.scale = .5;
    CCMenu *back = [CCMenu menuWithItems: goBack, nil];
     
    if (self.iPad) {
        back.position = ccp(64, 64);
    
    }
    else {
        back.position = ccp(32, 32);
    }
    
    [self addChild:back];        
}

- (id)init {
    
    if( (self=[super init])) {
        
        self.iPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
        if (self.iPad) {
            self.device = @"iPad";
        }
        else {
            self.device = @"iPhone";
        }

        int smallFont = [CCDirector sharedDirector].winSize.height / kFontScaleSmall;   
        
         // Read in selected chapter name (use to load custom background later):
//        NSString *selectedChapterName = @"Maze";
//        Chapters *selectedChapters = [ChapterParser loadData];

        [[World sharedWorld] CCCplayer].inLearningModules = NO;
        
        CGSize screenSize = [CCDirector sharedDirector].winSize;
        
//        
//        for (int x=1; x<=3; x++) {

            CCMenuItemImage *lvl1 = [CCMenuItemImage itemFromNormalImage:@"Maze 1 icon.png"
                                                             selectedImage:@"Maze 1 icon.png"
                                                                    target:self
                                                                  selector:@selector(onPlay:)];
        
        CCMenuItemImage *lvl2 = [CCMenuItemImage itemFromNormalImage:@"Maze 2 Icon.png"
                                                         selectedImage:@"Maze 2 Icon.png"
                                                                target:self
                                                              selector:@selector(onPlay:)];
        
        CCMenuItemImage *lvl3 = [CCMenuItemImage itemFromNormalImage:@"Maze 3 Icon.png"
                                                         selectedImage:@"Maze 3 Icon.png"
                                                                target:self
                                                              selector:@selector(onPlay:)];
//        }
     

        CCMenu *levels = [CCMenu menuWithItems: lvl1, lvl2, lvl3, nil];
        levels.scale = .6;

        [levels alignItemsHorizontallyWithPadding:5];
//        levels.position = ccp(screenSize.width/2,screenSize.height/2);
        [self addChild:levels];
        
        
        
        
     // Read in selected chapter levels
//        CCMenu *levelMenu = [CCMenu menuWithItems: nil]; 
//        NSMutableArray *overlay = [NSMutableArray new];
//        
//        Levels *selectedLevels = [LevelParser loadLevelsForChapter:1];
//    
//
//     // Create a button for every level
//        for (Level *level in selectedLevels.levels) {
//            
//            NSString *normal =   [NSString stringWithFormat:@"%@-Normal-%@.png", selectedChapterName, self.device];
//            NSString *selected = [NSString stringWithFormat:@"%@-Selected-%@.png", selectedChapterName, self.device];
//
//            CCMenuItemImage *item = [CCMenuItemImage itemFromNormalImage:normal
//                                                           selectedImage:selected
//                                                                  target:self 
//                                                                selector:@selector(onPlay:)];
//            [item setTag:level.number]; // note the number in a tag for later usage
//            [item setIsEnabled:level.unlocked];  // ensure locked levels are inaccessible
//            [levelMenu addChild:item];
//            
//            if (!level.unlocked) {
//                
//                NSString *overlayImage = [NSString stringWithFormat:@"Locked-%@.png", self.device];
//                CCSprite *overlaySprite = [CCSprite spriteWithFile:overlayImage];
//                [overlaySprite setTag:level.number];
//                [overlay addObject:overlaySprite];
//            }
//            else {
//                
//                NSString *stars = [[NSNumber numberWithInt:level.stars] stringValue];
//                NSString *overlayImage = [NSString stringWithFormat:@"%@Star-Normal-%@.png",stars, self.device];
//                CCSprite *overlaySprite = [CCSprite spriteWithFile:overlayImage];
//                [overlaySprite setTag:level.number];
//                [overlay addObject:overlaySprite];
//            }
//
//        }
//
//        [levelMenu alignItemsInColumns:
//          [NSNumber numberWithInt:6],
//          [NSNumber numberWithInt:6],
//          [NSNumber numberWithInt:6],
//          nil];
//
//     // Move the whole menu up by a small percentage so it doesn't overlap the back button
//        CGPoint newPosition = levelMenu.position;
//        newPosition.y = newPosition.y + (newPosition.y / 10);
//        [levelMenu setPosition:newPosition];
//        
//        [self addChild:levelMenu z:-3];
//
//
//     // Create layers for star/padlock overlays & level number labels
//        CCLayer *overlays = [[CCLayer alloc] init];
//        CCLayer *labels = [[CCLayer alloc] init];
//
//        
//        for (CCMenuItem *item in levelMenu.children) {
//
//         // create a label for every level
//            
//            CCLabelTTF *label = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%i",item.tag] 
//                                                        fontName:@"Marker Felt" 
//                                                        fontSize:smallFont];
//            
//            [label setAnchorPoint:item.anchorPoint];
//            [label setPosition:item.position];
//            [labels addChild:label];
//            
//            
//         // set position of overlay sprites
//         
//            for (CCSprite *overlaySprite in overlay) {
//                if (overlaySprite.tag == item.tag) {
//                    [overlaySprite setAnchorPoint:item.anchorPoint];
//                    [overlaySprite setPosition:item.position];
//                    [overlays addChild:overlaySprite];
//                }
//            }
//        }

        //        ADD BACKGROUND IMAGE
        CCSprite *background = [CCSprite spriteWithFile:@"Maze Page.png"];
        background.position = ccp(screenSize.width/2+60, screenSize.height/2+50);
        background.scale = .6;
        background.zOrder = -100;
        [self addChild:background];

     // Put the overlays and labels layers on the screen at the same position as the levelMenu
//        
//        [overlays setAnchorPoint:levelMenu.anchorPoint];
//        [labels setAnchorPoint:levelMenu.anchorPoint];
//        [overlays setPosition:levelMenu.position];
//        [labels setPosition:levelMenu.position];
//        [self addChild:overlays];
//        [self addChild:labels];
//        [overlays release];
//        [labels release];
        
        
     // Add back button
        
        [self addBackButton]; 
    }
    return self;
}

@end
