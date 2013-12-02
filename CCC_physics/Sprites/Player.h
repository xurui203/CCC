//
//  Player.h
//  SimpleBox2dScroller
//
//  Created by min on 3/17/11.
//  Copyright 2011 Min Kwon. All rights reserved.
//

#import "cocos2d.h"
#import "Box2D.h"
#import "GameObject.h"
//#import "SceneManager.h"
#define MAX_HEALTH 50

@interface Player : GameObject {
    b2Body          *body;
    BOOL            contactingGameOver;
        int health;
}
@property (readonly) int health;
@property (nonatomic) bool isDead;
@property (nonatomic) bool levelComplete;
-(void) createBox2dObject:(b2World*)world;
-(void) kangarooJump;
-(void) moveRight;
-(void) updateHealth;
-(void) decreaseHealth;


@property (nonatomic, readwrite) b2Body *body;
@property bool contactingGameOver;
@property bool inLearningModules;
-(void)restoreHealth:(float)amount;


@end
