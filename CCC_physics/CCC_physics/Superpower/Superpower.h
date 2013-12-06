
//  Created by Xu Rui on 13/11/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Player.h"
#import "Defines.h"
@interface Superpower : CCLayer

@property(strong, nonatomic) NSString* name;
@property(strong, nonatomic) CCAnimation* transformIntoAnimation; //transforms into superpower
@property(strong, nonatomic) CCAnimation* transformFromAnimation; //transforms from superpower

@property(strong, nonatomic) CCAnimation* specialActionAnimation; //special action transformation

@property(strong, nonatomic) CCAnimation* walkAnimation; // walk transformation
@property(strong, nonatomic) CCAnimation* crawlAnimation; //crawl transformation
@property(strong, nonatomic) CCAnimation* jumpAnimation; //jump transformation
@property(strong, nonatomic) CCAnimation* idleAnimation; //idle transformation
@property(strong, nonatomic) CCAnimation* breakAnimation; //special transformation

@property(strong, nonatomic) CCAnimation* spAnimation; //special transformation

@property(strong, nonatomic) NSString *disabledIconImage;
@property(strong, nonatomic) NSString* icon;
@property(nonatomic) BOOL isLocked;
@property(nonatomic) BOOL canWalk;
@property(nonatomic) BOOL canCrawl;
@property(nonatomic) BOOL canJump;
@property(nonatomic) BOOL canFly;
@property(nonatomic) BOOL canBreak;
@property(nonatomic) BOOL canClimb;

@property(nonatomic) int mazeID;


@property(strong, nonatomic) NSString* LMVideo;

//- (void*) useSuperpower;

- (CCAnimation*) getTransformIntoAnimation;
- (CCAnimation*) getTransformFromAnimation;

- (CCAnimation*) getWalkAnimation;
- (CCAnimation*) getCrawlAnimation;
- (CCAnimation*) getJumpAnimation;
- (CCAnimation*) getIdleAnimation;
- (CCAnimation*) getSpAnimation;
- (CCAnimation*) getBreakAnimation;


- (void) jump: (Player*) player;
-(void) moveLeft: (Player*) player;
- (void) moveRight: (Player*) player;
- (void) crawl: (Player*) player;
- (void) breakWall: (Player*) player;
- (void) climb: (Player*) p
              dir: (b2Vec2) direction;


# define NUM_TRANSFORM_JUMP 31
-(CCAnimation*) makeAnimation: (int) numFrames : (NSString*) filename;
@end
