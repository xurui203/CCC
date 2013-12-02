//
//  OpeningSequence.mm
//  CCC_physics
//
//  Created by Ann Niou on 11/19/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "OpeningSequence.h"


@implementation OpeningSequence
@synthesize iPad;

-(void) onPlay: (id) sender {
    [SceneManager goMainMenu];
}

- (void)onOptions: (id) sender {
    [SceneManager goOptionsMenu];
}

- (void)onLearningModules: (id) sender {
    [SceneManager goLearningModulesMenu];
}

//- (void)addBackButton {
//    
//    if (self.iPad) {
//        // Create a menu image button for iPad
//        CCMenuItemImage *goBack = [CCMenuItemImage itemFromNormalImage:@"Arrow-Normal-iPad.png"
//                                                         selectedImage:@"Arrow-Selected-iPad.png"
//                                                                target:self
//                                                              selector:@selector(onBack:)];
//        // Add menu image to menu
//        CCMenu *back = [CCMenu menuWithItems: goBack, nil];
//        
//        // position menu in the bottom left of the screen (0,0 starts bottom left)
//        back.position = ccp(64, 64);
//        
//        // Add menu to this scene
//        [self addChild: back];
//    }
//    else {
//        // Create a menu image button for iPhone / iPod Touch
//        CCMenuItemImage *goBack = [CCMenuItemImage itemFromNormalImage:@"Back Arrow.png"
//                                                         selectedImage:@"Back Arrow.png"
//                                                                target:self
//                                                              selector:@selector(onBack:)];
//        goBack.scale = .5;
//        // Add menu image to menu
//        CCMenu *back = [CCMenu menuWithItems: goBack, nil];
//        
//        // position menu in the bottom left of the screen (0,0 starts bottom left)
//        back.position = ccp(32, 32);
//        
//        // Add menu to this scene
//        [self addChild: back];
//    }
//}

- (id)init {
    
    if( (self=[super init])) {
        
        // Determine Device
        self.iPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
        
        // Determine Screen Size
        CGSize screenSize = [CCDirector sharedDirector].winSize;
        
        // Calculate Large Font Size
        int smallFont = screenSize.height / kFontScaleSmall;
        
        // Set font settings
        [CCMenuItemFont setFontName:@"Marker Felt"];
        [CCMenuItemFont setFontSize:smallFont];
        

        CCMenuItemImage *explore = [CCMenuItemImage itemFromNormalImage:@"Opening Page.png"
                                                          selectedImage:@"Opening Page.png"
                                                                 target:self
                                                               selector:@selector(onPlay:)];
        //
        //
        explore.zOrder = -50;
        CCMenu *exploreMenu = [CCMenu menuWithItems: explore, nil];
        [self addChild:exploreMenu];
        explore.scale = .5;
        exploreMenu.position = ccp(screenSize.width/2+70,screenSize.height/2-60);
        
        
        [CCVideoPlayer setDelegate: self];
        [CCVideoPlayer playMovieWithFile:@"Opening Sequence.m4v"];
        
        
        self.iPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
        
    }
    return self;
}

- (void) moviePlaybackFinished {
    //    [[CCDirector sharedDirector] startAnimation];
    CCLOG(@"movieplaybackfinished");
}

-(void) movieStartsPlaying {
    [[CCDirector sharedDirector] stopAnimation];
    CCLOG(@"moviestarts");
}



@end
