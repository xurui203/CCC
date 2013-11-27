//
//  LearningModuleLayer.mm
//  CCC_physics
//
//  Created by Ann Niou on 11/20/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "LearningModuleLayer.h"


@implementation LearningModuleLayer
-(id) init {
     if ((self = [super init])) {
         
         // Determine Device
//         self.iPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
         
         // Determine Screen Size
         CGSize screenSize = [CCDirector sharedDirector].winSize;
         
         // Calculate Large Font Size
         int largeFont = screenSize.height / 9;
//                 [self playMovie];
         // Create a label
         CCLabelTTF *label = [CCLabelTTF labelWithString:@"Learning Module"
                                                fontName:@"Marker Felt"
                                                fontSize:largeFont];
         // Center label
         label.position = ccp( screenSize.width/2, screenSize.height/2+30);
         //        IconDrawer *
         // Add label to this scene
        [self addChild:label z:0];
       
         
         CCMenuItemFont *playVideo = [CCMenuItemFont itemFromString:@"Video" target:self selector:@selector(onPlayVideo:)];
         
         CCMenuItemFont *practice = [CCMenuItemFont itemFromString:@"Practice" target:self selector:@selector(onPractice:)];
         
         CCMenu *LMOptionsMenu = [CCMenu menuWithItems:playVideo, practice, nil];
         [LMOptionsMenu alignItemsHorizontallyWithPadding:3.0];
         
         [self addChild:LMOptionsMenu];
         LMOptionsMenu.position = ccp( screenSize.width/2, screenSize.height/2 -20);
 
     }
    return self;
}

-(void) onPractice:(id) sender {
    
}

-(void) onPlayVideo:(id) sender {
    [self playMovie];
}


-(void) playMovie {
    [CCVideoPlayer setDelegate: self];
    NSString* moviename = [[World sharedWorld] CCCplayer].currentSuperpower.LMVideo;
    CCLOG(@"moviename = %@ ", moviename);
    [CCVideoPlayer playMovieWithFile:moviename];
}
+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
    
	// 'layer' is an autorelease object.
	LearningModuleLayer *layer = [LearningModuleLayer node];
    
	// add layer as a child to scene
	[scene addChild: layer];
    
	// return the scene
	return scene;
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