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
@interface IconDrawer : CCLayer {
    
    //INSTANCE VARIABLE DECLARATION (PRIVATE)
    
    bool open;
}
-(void) initMenu: (Superpower *) sp;

//INSTANCE VARIBABLES (PUBLIC AKA OTHER CLASSES CAN USE) - MUST BE SYNTHESIZED

@property (nonatomic) CCMenu *menu;
@property (nonatomic) CCMenu *menu2;
@property (nonatomic) CCMenuItemImage *iconDrawerImage;

@end
