
//  Created by Xu Rui on 13/11/13.
//
//

#import "Kangaroo.h"

@implementation Kangaroo

- (id)init{
    if (self = [super init]){
        NSString *myName = @"kangaroo";
        self.name = myName;
        self.icon = @"KangarooIcon.png";

        self.canWalk = TRUE;
        self.canCrawl = FALSE;
        self.canJump = TRUE;
        
        self.jumpAnimation = self.makeJumpAnimation;
    }
    return self;
}

//25
//Ant Capt Transistion-From KL0001
# define NUM_TRANSFORM_FROM 25
-(CCAnimation*) makeTransformFromAnimation{
    CCArray *superPowerActionFrames = [CCArray arrayWithCapacity:NUM_TRANSFORM_FROM];
    for (int i = 1; i <= NUM_TRANSFORM_FROM; i++  ) {
        
        //CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Ant Capt Transistion-From KL00%d.png", i]];
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Ant Capt Transistion-From KL00%d", i]];

        [superPowerActionFrames addObject:frame];
    }
    CCAnimation *transformFromAnimation = [CCAnimation animationWithFrames:[superPowerActionFrames getNSArray] delay:1.0/24.0];
    return transformFromAnimation;

}

//Ant Capt Trainsition-KL0001

# define NUM_TRANSFORM_INTO 29
-(CCAnimation*) makeTransformIntoAnimation{
    CCArray *superPowerActionFrames = [CCArray arrayWithCapacity:NUM_TRANSFORM_INTO];
    for (int j = 1; j <= NUM_TRANSFORM_INTO; j++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Ant Capt Trainsition-KL00%d.png", j]];
        [superPowerActionFrames addObject:frame];
    }
    CCAnimation *transformIntoAnimation = [CCAnimation animationWithFrames:[superPowerActionFrames getNSArray] delay:1.0/24.0];
    return transformIntoAnimation;
    
}

# define NUM_TRANSFORM_WALK 15

- (CCAnimation *) makeWalkAnimation {
    
    CCArray *walkFrames = [CCArray arrayWithCapacity:NUM_TRANSFORM_WALK];
    for (int i = 1; i <= NUM_TRANSFORM_WALK; i++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Lat Capt KL-Running00%d", i]];
        [walkFrames addObject:frame];
    }
    
    CCAnimation *walk = [CCAnimation animationWithFrames:[walkFrames getNSArray] delay:1.0/12.0];
    
    return walk;
    
}



# define NUM_TRANSFORM_IDLE 1
- (CCAnimation *) makeIdleAnimation {
    
    CCArray *idleFrames = [CCArray arrayWithCapacity:NUM_TRANSFORM_IDLE];
    for (int i = 1; i <= NUM_TRANSFORM_IDLE; i++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"lat capt KL"]];
        [idleFrames addObject:frame];
    }
    
    CCAnimation *idleAnimation = [CCAnimation animationWithFrames:[idleFrames getNSArray] delay:1.0/12.0];
    
    return idleAnimation;
}

# define NUM_TRANSFORM_JUMP 31
-(CCAnimation*) makeJumpAnimation{
    CCArray *jumpFrames = [CCArray arrayWithCapacity:NUM_TRANSFORM_JUMP];
    for (int k = 1; k <= NUM_TRANSFORM_JUMP; k++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Lat Capt KL-Jumping00%d.png", k]];
        [jumpFrames addObject:frame];
    }
    CCAnimation *jumpAnimation = [CCAnimation animationWithFrames:[jumpFrames getNSArray] delay:1.0/24.0];
    return jumpAnimation;
}

-(void) jump: (Player*) player {
    b2Vec2 impulse = b2Vec2(4.0f, 15.0f);
    
    player.body->ApplyLinearImpulse(impulse, player.body->GetWorldCenter());
}

-(void) moveRight: (Player*) player{
    b2Vec2 impulse = b2Vec2(1.0f, 0.0f);
    player.body->ApplyLinearImpulse(impulse, player.body->GetWorldCenter());
    player.body->SetLinearVelocity(b2Vec2(4.5, 0));
}


@end
