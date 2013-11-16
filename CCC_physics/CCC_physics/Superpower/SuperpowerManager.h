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


@interface SuperpowerManager : NSObject {
    Player *player;
}


@property(strong, nonatomic) NSArray* superpowers;
@end
