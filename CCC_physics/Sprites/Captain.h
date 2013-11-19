
#import "Player.h"
#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Defines.h"
#import "Superpower.h"
#import "CaptainSP.h"
#import "Kangaroo.h"


@interface Captain : Player {
    
}

//actions
@property(nonatomic,strong) CCAction *idleAction;
@property(nonatomic,strong)id superPowerAction;
@property(nonatomic,strong)id walkAction;
@property(nonatomic,strong)id failAction;
@property(nonatomic,strong)id crawlAction;
@property(nonatomic,strong)id jumpAction;

@property(nonatomic,strong)id transformAction;

//transform animations
//@property(nonatomic, strong) CCAnimation* transformFromAnimation; //transform from captain
//@property(nonatomic, strong) CCAnimation* transformIntoAnimation; //transform into captain
@property(nonatomic, strong) Superpower* currentSuperpower;


//states
@property(nonatomic,assign)ActionState actionState;
@property(nonatomic,assign) Boolean reactivated;


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
-(void)superPower;//attack
//-(void)hurtWithDamage:(float)damage;
-(void)walk;
-(void) crawl;
-(void) transform:(Superpower *)sp;
@end
