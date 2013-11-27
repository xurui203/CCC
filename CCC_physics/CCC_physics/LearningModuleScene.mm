//
//  LearningModule.m
//  CCC_physics
//
//  Created by guest user on 11/19/13.
//
//

#import "LearningModuleScene.h"

@implementation LearningModuleScene
@synthesize iPad, device, LMLayer;

- (void)onBack: (id) sender {
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
//- (id) initWithMovie: (NSString *) movie {
//    if( (self=[super init])) {
//        
//        // Determine Device
//        self.iPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
//        if (self.iPad) {
//            self.device = @"iPad";
//        }
//        else {
//            self.device = @"iPhone";
//        }
//        
//        // Determine Screen Size
//        CGSize screenSize = [CCDirector sharedDirector].winSize;
//        
//        
//        //  Put a 'back' button in the scene
//        [self addBackButton];
//        
//        [self createScene];
//        
//
//
//        
//    }
//    return self;
//
//}
- (id) init {
    
    if( (self=[super init])) {
        
        // Determine Device
      //  self.iPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
        if (self.iPad) {
            self.device = @"iPad";
        }
        else {
            self.device = @"iPhone";
        }
        
        // Determine Screen Size
        CGSize screenSize = [CCDirector sharedDirector].winSize;
        
        
        //  Put a 'back' button in the scene
        [self addBackButton];
        
        [self createScene];
        
        [CCVideoPlayer setDelegate: self];
        [CCVideoPlayer playMovieWithFile:@"Opening Sequence.m4v"];
    }
    return self;
}





-(void) createScene {
    
    LMLayer = [LearningModuleLayer node];
//    LMLayer.videoName = x;
    
    [self addChild:LMLayer z:0];
    
}

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	LearningModuleScene *layer = [LearningModuleScene node];
//
	// add layer as a chisld to scene
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
