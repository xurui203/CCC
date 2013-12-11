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
        [[World sharedWorld] CCCplayer].inLearningModules = YES;
        CCMenu *IconsMenu = [iconsDrawer initLMMenu:spM.initiatedSPs];
        [self addChild:IconsMenu];
        IconsMenu.position = ccp(170,100);
        IconsMenu.scale = .7;
        IconsMenu.visible = YES;
        
        
        
        //        ADD BACKGROUND IMAGE
        CCSprite *background = [CCSprite spriteWithFile:@"Icon-Page.png"];
                background.scale = .5;
        background.position = ccp(screenSize.width/2, screenSize.height/2);

        background.zOrder = -100;
        [self addChild:background];

        
        

    }
    return self;
}


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