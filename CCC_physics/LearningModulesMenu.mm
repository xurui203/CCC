//
//  LearningModulesMenu.m
//  CCC_physics
//
//  Created by Ann Niou on 11/6/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "LearningModulesMenu.h"


@implementation LearningModulesMenu
@synthesize iPad, spM, menu, iconsArray;

- (id)init {
    
    if( (self=[super init])) {
        
        // Determine Device
        self.iPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
        
        // Determine Screen Size
        CGSize screenSize = [CCDirector sharedDirector].winSize;
        
        NSLog(@"LOADING PLISTS!!!");
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"BetaSheet.plist"];
        humanSpriteSheet = [CCSpriteBatchNode batchNodeWithFile:@"BetaSheet.png"];
        [humanSpriteSheet.texture setAliasTexParameters];
        [self addChild:humanSpriteSheet z:2];
        //  Put a 'back' button in the scene
        [self addBackButton];
        
        spM = [SuperpowerManager sharedManager];
        iconsDrawer = [IconDrawer node];
        [self addChild:iconsDrawer];
//        CCLOG(@"alsdjlaksdf: %d", spM.initiatedSPs.count);
        CCMenu *IconsMenu = [iconsDrawer initLMMenu:spM.initiatedSPs];
                [self addChild:IconsMenu];
        IconsMenu.position = ccp(170,100);
        IconsMenu.scale = .7;
        IconsMenu.visible = YES;
//        CCLOG(@"IDJAODSFKLASDJFAD: %d", IconsMenu.contentSize);
//        for (int x=0; x<getMenuItems.count; x++) {
//            CCMenuItemImage *item = [getMenuItems objectAtIndex:x];
//            [IconsMenu addChild:item];
//        }


//        CCMenu *iconsMenu = [iconsDrawer initMenu:spM.initiatedSPs];
//        [self addChild:iconsMenu];
//        [self createMenu];
    }
    return self;
}

//-(void) createMenu{
//
//    CCMenuItemImage *CCCicon = [CCMenuItemImage itemFromNormalImage:@"CCC icon.png" selectedImage:@"CCC icon.png" disabledImage:@"CCC icon.png" target:self selector:@selector(iconButtonTapped:)];
//    CCCicon.tag = 1;
//        CCMenuItemImage *Kangarooicon = [CCMenuItemImage itemFromNormalImage:@"Kangaroo Icon.png" selectedImage:@"Kangaroo Icon.png" disabledImage:@"Kangaroo Icon.png" target:self selector:@selector(iconButtonTapped:)];
//    Kangarooicon.tag = 2;
//        CCMenuItemImage *Dogicon = [CCMenuItemImage itemFromNormalImage:@"Dog Icon.png" selectedImage:@"Dog Icon.png" disabledImage:@"Dog Icon.png" target:self selector:@selector(iconButtonTapped:)];
//    
//    Dogicon.tag = 3;
//       menu = [CCMenu menuWithItems: CCCicon, Kangarooicon, Dogicon, nil];
//    
//    
//    [menu alignItemsHorizontallyWithPadding:20];
//    [self addChild:menu];
//}

//
//-(void) iconButtonTapped:(id) sender {
////    LearningModuleScene *LMScene;
//    NSString *movieName;
//    if ([(CCMenuItemImage *)sender tag] == 1) {
//        movieName = @"Opening Sequence.mov";
//    }if ([(CCMenuItemImage *)sender tag] == 2) {
//        movieName = @"Opening Sequence.mov";
//    }if ([(CCMenuItemImage *)sender tag] == 3) {
//        movieName = @"Opening Sequence.mov";
//    }
// 
////    LMScene = [[LearningModuleScene alloc] initWithMovie:movieName];
//    [SceneManager goLearningModuleScene];
//}
//-(void) KangarooiconButtonTapped:(id) sender {
//    [SceneManager goLearningModuleScene];
//}
//-(void) DogiconButtonTapped:(id) sender {
//    [SceneManager goLearningModuleScene];
//}



- (void)onHome: (id) sender {
    [SceneManager goMainMenu];
}

- (void)addBackButton {
    
    if (self.iPad) {
        // Create a menu image button for iPad
        CCMenuItemImage *goHome = [CCMenuItemImage itemFromNormalImage:@"Home icon.png"
                                                         selectedImage:@"Home icon.png"
                                                                target:self
                                                              selector:@selector(onHome:)];
        // Add menu image to menu
        CCMenu *home = [CCMenu menuWithItems: goHome, nil];
        // Determine Screen Size
        CGSize screenSize = [CCDirector sharedDirector].winSize;
        // position menu in the bottom left of the screen (0,0 starts bottom left)
        home.position = ccp(screenSize.width/2, screenSize.height/3);
        
        // Add menu to this scene
        [self addChild: home];
    }
    else {
        // Create a menu image button for iPhone / iPod Touch
        CCMenuItemImage *goHome = [CCMenuItemImage itemFromNormalImage:@"Home icon.png"
                                                         selectedImage:@"Home icon.png"
                                                                target:self
                                                              selector:@selector(onHome:)];
        goHome.scale = .5;
        // Add menu image to menu
        CCMenu *home = [CCMenu menuWithItems: goHome, nil];
        // Determine Screen Size
        CGSize screenSize = [CCDirector sharedDirector].winSize;
        // position menu in the bottom left of the screen (0,0 starts bottom left)
        home.position = ccp(screenSize.width/2, screenSize.height/3 -50);
        
        // Add menu to this scene
        [self addChild: home];
        
    }
}



@end