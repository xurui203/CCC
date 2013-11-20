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

@interface IconDrawer : CCLayer {
    
    //INSTANCE VARIABLE DECLARATION (PRIVATE)
    NSArray *SuperpowersToDisplayArray;
    bool open;
    Captain *captain;
   
    CCSprite *iconDrawer;
}
-(void) initMenu: (NSArray *) spArray;


//INSTANCE VARIBABLES (PUBLIC AKA OTHER CLASSES CAN USE) - MUST BE SYNTHESIZED
@property (strong, nonatomic) NSMutableArray *SPMutableArray;
@property (strong, nonatomic) CCMenu *BGmenu;
@property (strong, nonatomic) CCMenu *spIconMenu;
@property (strong, nonatomic) CCMenuItemImage *iconDrawerImage;
@property (strong, nonatomic) NSMutableArray *iconsArray;
-(void) addSuperpowersToDrawer: (NSMutableArray *)SPArray;
-(NSMutableArray *) getIconsArray;
- (CCMenu*) getIconsMenu;
@end
