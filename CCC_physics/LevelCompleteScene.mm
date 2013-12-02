//
//  LevelCompleteScene.m
//  CCC_physics
//
//  Created by Ann Niou on 11/6/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "LevelCompleteScene.h"



@implementation LevelCompleteScene
@synthesize iPad;

- (void)onHome: (id) sender {
        [SceneManager goMainMenu];
}

//- (void)addBackButton {
//    
//    if (self.iPad) {
//        // Create a menu image button for iPad
//        CCMenuItemImage *goHome = [CCMenuItemImage itemFromNormalImage:@"Home icon.png"
//                                                         selectedImage:@"Home icon.png"
//                                                                target:self
//                                                              selector:@selector(onHome:)];
//        // Add menu image to menu
//        CCMenu *home = [CCMenu menuWithItems: goHome, nil];
//        // Determine Screen Size
//        CGSize screenSize = [CCDirector sharedDirector].winSize;
//        // position menu in the bottom left of the screen (0,0 starts bottom left)
//        home.position = ccp(screenSize.width/2, screenSize.height/3);
//        
//        // Add menu to this scene
//        [self addChild: home];
//    }
//    else {
//        // Create a menu image button for iPhone / iPod Touch
//        CCMenuItemImage *goHome = [CCMenuItemImage itemFromNormalImage:@"Home icon.png"
//                                                         selectedImage:@"Home icon.png"
//                                                                target:self
//                                                              selector:@selector(onHome:)];
//        goHome.scale = .6;
//        // Add menu image to menu
//        CCMenu *home = [CCMenu menuWithItems: goHome, nil];
//        // Determine Screen Size
//        CGSize screenSize = [CCDirector sharedDirector].winSize;
//        // position menu in the bottom left of the screen (0,0 starts bottom left)
//        home.position = ccp(screenSize.width/2, screenSize.height/3);
//        
//        // Add menu to this scene
//        [self addChild: home];
//        
//    }
//}
//
- (id)init {
    
    if( (self=[super init])) {
        
        // Determine Device
        self.iPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
        
        // Determine Screen Size
        CGSize screenSize = [CCDirector sharedDirector].winSize;
        
        // Calculate Large Font Size
        int largeFont = screenSize.height / kFontScaleLarge;
        
        
        // Create font based items ready for CCMenu
     
        
      

        
        // Create a label
        CCMenuItemFont *label = [CCMenuItemFont itemFromString:@"Level Completed!" target:self selector:nil];
        CCMenuItemFont *item1 = [CCMenuItemFont itemFromString:@"Next Level" target:self selector:@selector(onNextLevel:)];
        CCMenuItemImage *goHome = [CCMenuItemImage itemFromNormalImage:@"Home icon.png"
                                                         selectedImage:@"Home icon.png"
                                                                target:self
                                                              selector:@selector(onHome:)];
        goHome.scale = .5;
          CCMenu *menu = [CCMenu menuWithItems:label,item1,goHome, nil];
        
        
		// Center label
		menu.position = ccp( screenSize.width/2, screenSize.height/2);
        [menu alignItemsVerticallyWithPadding:3.0];
        // Add label to this scene
		[self addChild:menu z:0];
        
        //  Put a 'back' button in the scene
//        [self addBackButton];
        
    }
    return self;
}

-(void) onNextLevel:(id)selector {
    [SceneManager goMaze:[[MazeManager sharedInstance] nextLevel]];
}

@end
