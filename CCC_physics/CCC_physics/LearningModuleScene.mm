//
//  LearningModule.m
//  CCC_physics
//
//  Created by guest user on 11/19/13.
//
//

#import "LearningModuleScene.h"

@implementation LearningModuleScene
@synthesize iPad, device;

- (void)onBack: (id) sender {
    [SceneManager goLearningModulesMenu];
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
    back.zOrder = 10;
    if (self.iPad) {
        back.position = ccp(64, 64);
        
    }
    else {
        back.position = ccp(32, 270);
    }
    
    [self addChild:back];
}

//}
-(id) init {
    if( (self=[super init])) {

        //  Put a 'back' button in the scene
        [self addBackButton];
        CCLOG(@"here in learning module scene init");

//        [self createScene];
        CGSize screenSize = [CCDirector sharedDirector].winSize;
        CCMenuItemFont *playVideo = [CCMenuItemFont itemFromString:@"Video" target:self selector:@selector(onPlayVideo:)];
        CCMenuItemFont *practice = [CCMenuItemFont itemFromString:@"Practice" target:self selector:@selector(onPractice:)];
        
        CCMenu *LMOptionsMenu = [CCMenu menuWithItems: playVideo, practice, nil];
        [LMOptionsMenu alignItemsHorizontallyWithPadding:10.0];
        
        [self addChild:LMOptionsMenu];
        LMOptionsMenu.position = ccp( screenSize.width/2, screenSize.height/2 -20);
        
        
//        [CCVideoPlayer setDelegate: self];
////        [CCVideoPlayer playMovieWithFile:@"Opening Sequence.m4v"];
//        NSString* moviename = [[World sharedWorld] CCCplayer].currentSuperpower.LMVideo;
//        CCLOG(@"moviename = %@ ", moviename);
//        [CCVideoPlayer playMovieWithFile:moviename];

        
    }
    return self;
}

-(void) onPractice:(id) sender {
    int mazeID = [[World sharedWorld] CCCplayer].currentSuperpower.mazeID;
    [SceneManager goMaze: mazeID];
    
}

-(void) onPlayVideo:(id) sender {
    [SceneManager goMovie];
}

//
//- (void) moviePlaybackFinished {
//    //    [[CCDirector sharedDirector] startAnimation];
//    CCLOG(@"movieplaybackfinished");
//}
//
//-(void) movieStartsPlaying {
//    [[CCDirector sharedDirector] stopAnimation];
//    
//    CCLOG(@"moviestarts");
//}



//
//
//-(void) createScene {
//    LMLayer = [LearningModuleLayer node];
//    [self addChild:LMLayer z:0];
//    
//}
//
//+(CCScene *) scene
//{
//	// 'scene' is an autorelease object.
//	CCScene *scene = [CCScene node];
//	
//	// 'layer' is an autorelease object.
//	LearningModuleScene *layer = [LearningModuleScene node];
////
//	// add layer as a chisld to scene
//	[scene addChild: layer];
//	
//	// return the scene
//	return scene;
//}



@end
