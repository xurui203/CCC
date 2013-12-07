
#import "Player.h"
#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Defines.h"
#import "Superpower.h"
#import "CaptainSP.h"
#import "Kangaroo.h"
#import "World.h"

@interface Captain : Player {
    CCSpriteBatchNode *humanSpriteSheet;
    
}

//actions
@property(nonatomic,retain) CCAction *idleAction;
@property(nonatomic,retain)id spAction;
@property(nonatomic,retain)id walkAction;
@property(nonatomic,retain)id failAction;
@property(nonatomic,retain)id crawlAction;
@property(nonatomic,retain)id jumpAction;
@property(nonatomic,retain)id breakAction;
@property(nonatomic,retain)id climbAction;


// FIXTURE STUFF
//@property(nonatomic,assign) b2FixtureDef fixtureDef;
//@property(nonatomic,assign) b2FixtureDef crawlFixtureDef;

@property(nonatomic,retain)id transformAction;

//transform animations
//@property(nonatomic, strong) CCAnimation* transformFromAnimation; //transform from captain
//@property(nonatomic, strong) CCAnimation* transformIntoAnimation; //transform into captain
@property(nonatomic, retain) Superpower* currentSuperpower;
//- (void)changeSuperpower:(Superpower *) superpower;


//states
@property(nonatomic,assign)ActionState actionState;
@property(nonatomic,assign) Boolean reactivated;
@property(nonatomic,assign) Boolean upright;

//attributes
@property(nonatomic,assign)float walkSpeed;
@property(nonatomic,assign)float hitPoints;
@property(nonatomic,assign)float damage;

//movement
@property(nonatomic,assign)CGPoint velocity;
@property(nonatomic,assign)CGPoint desiredPosition;

//measurements
@property(nonatomic,assign)float centerToSides;
@property(nonatomic,assign)float centerToBottom;

//action methods
//-(void)superPower;//attack
//-(void)hurtWithDamage:(float)damage;
-(void)idle;
-(void)walk;
-(void) moveBackwards;
-(void) crawl;
-(void) jump;
-(void) climb: (b2Vec2) direction;
-(void)breakWall;
-(void) specialAction;

-(void) transform:(Superpower *)sp;
-(void) setUpright: (Boolean) wantUpright;
- (void) reset;
@end
