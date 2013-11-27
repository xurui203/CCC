//
//  LearningModulesMenu.h
//  CCC_physics
//
//  Created by Ann Niou on 11/6/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
//#import "Constants.h"
#import "Defines.h"
#import "SceneManager.h"
#import "SuperpowerManager.h"

@class SuperpowerManager;
@class IconDrawer;

@interface LearningModulesMenu : CCLayer {
    CCSpriteBatchNode *humanSpriteSheet;
    CCLayer *actionSpriteSheet;
    CCTextureCache *sharedCache;
    IconDrawer *iconsDrawer;
}
@property (nonatomic, assign) BOOL iPad;


@property(nonatomic)    SuperpowerManager *spM;
@property(nonatomic) NSMutableArray *iconsArray;
@property(nonatomic) CCMenu *menu;
@end
