//
//  SceneManager.m
// 

#import "SceneManager.h"

@interface SceneManager ()

+(void) go: (CCLayer *) layer;
+(void) goToScene: (CCScene *) scene;

+(CCScene *) wrap: (CCLayer *) layer;

@end


@implementation SceneManager

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
    [[World sharedWorld] CCCplayer].inLearningModules = NO;

    [SceneManager go:[LevelSelect node]];
}

+(void) goGameOverLayer {
    [SceneManager go:[GameOverLayer node]];
}

//Learning Module Methods
+(void) goLearningModuleScene {
    [[World sharedWorld] CCCplayer].inLearningModules = YES;

    [SceneManager go:[LearningModuleScene node]];
}

+(void) goLearningModulesMenu {
    [[World sharedWorld] CCCplayer].inLearningModules = YES;
    [SceneManager go:[LearningModulesMenu node]];
}

//Maze methods
+(void) goMaze: (int) mazeID {
    [SceneManager goToScene:[[[GameScene alloc] initWithMaze: mazeID] autorelease]];

}

+(void) goParentPage {
    [SceneManager go:[ParentPage node]];
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
