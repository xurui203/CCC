//
//  SuperpowerManager.h
//  CCC_physics
//
//  Created by Xu Rui on 14/11/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Box2D.h"
#import "Player.h"
#import "CaptainSP.h"
#import "Kangaroo.h"
#import "GameScene.h"
#import "IconDrawer.h"
@class IconDrawer;

@interface SuperpowerManager : NSObject {
    Player *player;
    NSArray *superpowersArray;
    Kangaroo *kangaroo;
    CaptainSP *captainSP;
}

-(Superpower*) initSP: (NSString *) s;
@property(strong, nonatomic) Superpower *currentSuperPower;
-(void) updateIconDrawer: (NSArray *)spArray;
@property(strong, nonatomic) NSMutableArray* superpowers;
@property(strong, nonatomic) IconDrawer *iconDrawer;
@property(strong, nonatomic) NSMutableArray* initiatedSPs;

@end
