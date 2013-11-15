
//  Created by Xu Rui on 13/11/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Player.h"

@interface Superpower : CCLayer

@property(strong, nonatomic) NSString* name;
@property(strong, nonatomic) CCAnimation* transformIntoAnimation; //transforms into superpower
@property(strong, nonatomic) CCAnimation* transformFromAnimation; //transforms from superpower

@property(strong, nonatomic) CCAnimation* specialActionAnimation; //special action transformation

@property(strong, nonatomic) CCAnimation* walkAnimation; // walk transformation
@property(strong, nonatomic) CCAnimation* crawlAnimation; //crawl transformation
//@property(strong, nonatomic) CCAnimation* jumpAnimation; //jump transformation
@property(strong, nonatomic) CCAnimation* idleAnimation; //idle transformation


@property(strong, nonatomic) UIImage* icon;
@property(nonatomic) BOOL isLocked;


//- (void*) useSuperpower;

- (CCAnimation*) makeTransformIntoAnimation;
- (CCAnimation*) makeTransformFromAnimation;

- (CCAnimation*) makeWalkAnimation;
- (CCAnimation*) makeCrawlAnimation;
//- (CCAnimation*) makeJumpAnimation;
- (CCAnimation*) makeIdleAnimation;


- (void) jump: (Player*) player;
- (void) moveRight: (Player*) player;
- (void) crawl: (Player*) player;


@end
