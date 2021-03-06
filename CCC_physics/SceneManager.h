//
//  SceneManager.h
//  

#import <Foundation/Foundation.h>
#import "cocos2d.h"

/*  ___Template___________________________________

    Step 1 - Import header of your SceneName
    ______________________________________________
 
#import "SceneName.h"
 
*/
#import "Defines.h"
#import "MainMenu.h"
#import "OptionsMenu.h"
#import "ChapterSelect.h"
#import "LevelSelect.h"
#import "GameScene.h"
//#import "GameOverScene.h"
#import "GameOverLayer.h"
#import "LevelCompleteScene.h"
#import "LearningModulesMenu.h"
#import "OpeningSequence.h"
#import "LearningModuleScene.h"
#import "MazeLayer.h"
#import "ParentPage.h"
#import "LearningModuleLayer.h"
//#import "GceckMaze.h"
//#import "MainMazeOne.h"


@interface SceneManager : NSObject {
    
}

/*  ___Template___________________________________
    
    Step 2 - Add interface scene calling method
    ______________________________________________
 
+(void) goSceneName; 
 
*/

+(void) goMainMenu;
+(void) goOptionsMenu;
+(void) goChapterSelect;
+(void) goLevelSelect;
+(void) goParentPage;
//+(void) goGameScene;
+(void) goLevelComplete;
+(void) goGameOverLayer;
+(void) goLearningModulesMenu;
+(void) goOpeningSequence;
+(void) goLearningModuleScene;
+(void) goMaze: (int) mazeID;
+(void) goMovie;
@end
