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

@class Captain;
@interface World : NSObject {

}


+(id) sharedWorld;

@property(nonatomic, retain) Captain *CCCplayer;
@property(nonatomic) NSInteger *currentLevel;

@end
