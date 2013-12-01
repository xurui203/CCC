//
//  SceneManager.m
// 

#import "SceneManager.h"

@interface SceneManager ()

+(void) go: (CCLayer *) layer;
+(void) goToScene: (CCScene *) scene;

+(CCScene *) wrap: (CCLayer *) layer;

@end


@implementation SceneManager{
//    NSArray * _levels;
//    int _currentLevel;
}

//- (id)init {
//    if ((self = [super init])) {
//        _currentLevel = 0;
//        MainMaze * level1 = [[[MainMaze alloc] initWithLevelNum:1 secsPerSpawn:2 backgroundColor:ccc4(255, 255, 255, 255)] autorelease];
//        MainMaze * level2 = [[[MainMaze alloc] initWithLevelNum:2 secsPerSpawn:1 backgroundColor:ccc4(100, 150, 20, 255)] autorelease];
//        _levels = [@[level1, level2] retain];
//    }
//    return self;
//}


//General Game Play
+(void) goOpeningSequence {
    [SceneManager go:[OpeningSequence node]];
}

+(void) goLevelComplete {
    [SceneManager go:[LevelCompleteScene node]];
}
+(void) goMainMenu {
    [SceneManager go:[MainMenu node]];
}

+(void) goOptionsMenu {
    [SceneManager go:[OptionsMenu node]];
}

+(void) goChapterSelect {
    [SceneManager go:[ChapterSelect node]];
}
//
+(void) goLevelSelect {
    [SceneManager go:[LevelSelect node]];
}

+(void) goGameOverLayer {
    [SceneManager go:[GameOverLayer node]];
}

//Learning Module Methods
+(void) goLearningModuleScene {
    [SceneManager go:[LearningModuleScene node]];
}

+(void) goLearningModulesMenu {
    [SceneManager go:[LearningModulesMenu node]];
}

//Maze methods
+(void) goMaze: (int) mazeID {
    [SceneManager goToScene:[[[GameScene alloc] initWithMaze: mazeID] autorelease]];

}

//Go to methods

+(void) go: (CCLayer *) layer {
    CCDirector *director = [CCDirector sharedDirector];
    CCScene *newScene = [SceneManager wrap:layer];
    if ([director runningScene]) {
        
        [director replaceScene:newScene];
    }
    else {
        [director runWithScene:newScene];
    }
}

+(void) goToScene: (CCScene *) scene {
    CCDirector *director = [CCDirector sharedDirector];
    if ([director runningScene]) {
        
        [director replaceScene:scene];
    }
    else {
        [director runWithScene:scene];
    }
}

+(CCScene *) wrap: (CCLayer *) layer {
    CCScene *newScene = [CCScene node];
    [newScene addChild: layer];
    return newScene;
}


@end
