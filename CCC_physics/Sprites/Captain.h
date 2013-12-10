
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
@property(nonatomic,strong) CCAction *idleAction;
@property(nonatomic,strong)id spAction;
@property(nonatomic,strong)id walkAction;
@property(nonatomic,strong)id failAction;
@property(nonatomic,strong)id crawlAction;
@property(nonatomic,strong)id jumpAction;
//@property(nonatomic,strong)id breakAction;
@property(nonatomic,strong)id climbAction;
@property(nonatomic,strong)id transformAction;

//transform animations
//@property(nonatomic, strong) CCAnimation* transformFromAnimation; //transform from captain
//@property(nonatomic, strong) CCAnimation* transformIntoAnimation; //transform into captain
@property(nonatomic, strong) Superpower* currentSuperpower;
- (void)changeSuperpower:(Superpower *) superpower;


//states
@property(nonatomic,assign)ActionState actionState;
@property(nonatomic,assign) Boolean reactivated;
@property(nonatomic,assign) Boolean upright;
@property(nonatomic,assign) Boolean executingSpecialAction;


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
-(void)idle;
-(void)walk;
-(void) moveBackwards;
-(void) crawl;
-(void) jump;
-(void) climb: (b2Vec2) direction;
//-(void)breakWall;
-(void) specialAction;

-(void) transform:(Superpower *)sp;
-(void) setUpright: (Boolean) wantUpright;
- (void) reset;
@end
