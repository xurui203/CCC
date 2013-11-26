//
//  World.h
//  CCC_physics
//
//  Created by Ann Niou on 11/26/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Box2D.h"
#import "Player.h"
#import "Captain.h"

@interface World : NSObject {

}


+(id) sharedWorld;

@property(nonatomic, retain) Player* CCCplayer;
@property(nonatomic, retain) NSInteger *currentLevel;

@end
