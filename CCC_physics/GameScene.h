//
//  GameScene.h
//  

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Defines.h"
#import "SceneManager.h"
#import "Box2D.h"
#import "TRBox2D.h"
#import "MazeLayer.h"
#import "HudLayer.h"
#import "ContactListener.h"
#import "SimpleAudioEngine.h"
#import "IconDrawer.h"
@class MazeLayer;
@class IconDrawer;
@class SuperpowerManager;

@interface GameScene : CCScene {
    b2World *world;
    GLESDebugDraw *debugDraw;
    CCSprite *pauseButton;
    CCSprite *pausedSprite;
    CCMenu *pausedMenu;
    int currentMazeID;


}

@property (nonatomic, assign) BOOL iPad;
@property (nonatomic, assign) NSString *device;

@property (nonatomic, retain)MazeLayer *mazeLayer;
@property(nonatomic, retain)HudLayer *hudLayer;
@property(nonatomic, retain) SuperpowerManager *spM;

@property(nonatomic, retain)IconDrawer *icondrawer;

- (id) initWithMaze: (int) mazeID;
@end
