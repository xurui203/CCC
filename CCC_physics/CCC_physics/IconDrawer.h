//
//  IconDrawer.h
//  CCC_physics
//
//  Created by Ann Niou on 11/16/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Player.h"
#import "Captain.h"

#import "ContactListener.h"
#import "HudLayer.h"
#import "SimpleAudioEngine.h"
#import "CocosDenshion.h"
#import "GameScene.h"
#import "SuperpowerManager.h"
#import "World.h"
#import "LearningModuleScene.h"
@interface IconDrawer : CCLayer {
    
    //INSTANCE VARIABLE DECLARATION (PRIVATE)
    NSArray *SuperpowersToDisplayArray;
    bool open;
    Captain *captain;
   
    CCSprite *iconDrawer;
}

//INSTANCE VARIBABLES (PUBLIC AKA OTHER CLASSES CAN USE) - MUST BE SYNTHESIZED
@property (strong, nonatomic) NSMutableArray *SPMutableArray;
@property (strong, nonatomic) CCMenu *BGmenu;
@property (strong, nonatomic) CCMenu *spIconMenu;

@property (strong, nonatomic) CCMenu *LMspIconMenu;
@property (strong, nonatomic) CCMenuItemImage *iconDrawerImage;
@property (strong, nonatomic) NSMutableArray *iconsArray;
@property (strong, nonatomic) NSMutableArray *LMiconsArray;
-(NSMutableArray *) getIconsArray;
- (CCMenu*) getIconsMenu;
- (void) initDrawer;
-(CCMenu*) initMenu:(NSMutableArray *)SParray;
-(void) LMiconButtonTapped:(CCMenuItemFont *) sender;
-(CCMenu*) initLMMenu:(NSMutableArray *)SParray;
@end
