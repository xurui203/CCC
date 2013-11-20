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
}
-(void) initMenu: (NSArray *) spArray;


//INSTANCE VARIBABLES (PUBLIC AKA OTHER CLASSES CAN USE) - MUST BE SYNTHESIZED

@property (nonatomic) CCMenu *BGmenu;
@property (nonatomic) CCMenu *spIconMenu;
@property (nonatomic) CCMenuItemImage *iconDrawerImage;

@end
