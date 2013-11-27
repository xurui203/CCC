
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
        
        self.icon = @"Kangaroo Icon.png";
        self.isLocked = NO;
        self.disabledIconImage = @"Kangaroo Icon.png";
        self.LMVideo =  @"Opening Sequence.m4v";
    }
    return self;
}

//25
//Ant Capt Transistion-From KL0001
# define NUM_TRANSFORM_FROM 25
-(CCAnimation*) getTransformFromAnimation{
    if (self.transformFromAnimation == nil){
    CCArray *superPowerActionFrames = [CCArray arrayWithCapacity:NUM_TRANSFORM_FROM];
    for (int i = 1; i <= NUM_TRANSFORM_FROM; i++  ) {
        
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Ant Capt Transistion-From KL00%d.png", i]];

        [superPowerActionFrames addObject:frame];
    }
    CCAnimation *transformFrom = [CCAnimation animationWithFrames:[superPowerActionFrames getNSArray] delay:1.0/24.0];
        self.transformFromAnimation = transformFrom;
    }
    return self.transformFromAnimation;

}

//Ant Capt Trainsition-KL0001

# define NUM_TRANSFORM_INTO 29
-(CCAnimation*) getTransformIntoAnimation{
    if (self.transformIntoAnimation == nil){
        CCArray *superPowerActionFrames = [CCArray arrayWithCapacity:NUM_TRANSFORM_INTO];
        for (int j = 1; j <= NUM_TRANSFORM_INTO; j++  ) {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Ant Capt Trainsition-KL00%d.png", j]];
            //CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"lat capt gf000%d.png", j]];
            [superPowerActionFrames addObject:frame];
        }
        CCAnimation *transformInto = [CCAnimation animationWithFrames:[superPowerActionFrames getNSArray] delay:1.0/24.0];
        self.transformIntoAnimation = transformInto;
    }
    return self.transformIntoAnimation;
}

//# define NUM_TRANSFORM_INTO 9
//-(CCAnimation*) getTransformIntoAnimation{
//    if (self.transformIntoAnimation == nil){
//        CCAnimation *transformInto = [CCAnimation animation];
//        [transformInto setDelayPerUnit: 1.0/24.0];
//        for (int j = 1; j <= NUM_TRANSFORM_INTO; j++  ) {
//            [transformInto addFrameWithFilename:[NSString stringWithFormat:@"lat capt gf000%d.png", j]];
//        }
//        self.transformIntoAnimation = transformInto;
//    }
//    return self.transformIntoAnimation;
//}

# define NUM_TRANSFORM_WALK 15

- (CCAnimation *) getWalkAnimation {
    if (self.walkAnimation == nil){

    CCArray *walkFrames = [CCArray arrayWithCapacity:NUM_TRANSFORM_WALK];
    for (int i = 1; i <= NUM_TRANSFORM_WALK; i++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Lat Capt KL-Running00%d.png", i]];
        [walkFrames addObject:frame];
    }
    
    CCAnimation *walk = [CCAnimation animationWithFrames:[walkFrames getNSArray] delay:1.0/12.0];
        self.walkAnimation = walk;
    }
    return self.walkAnimation;
    
}



# define NUM_TRANSFORM_IDLE 1
- (CCAnimation *) getIdleAnimation {
    if (self.idleAnimation == nil){

    CCArray *idleFrames = [CCArray arrayWithCapacity:NUM_TRANSFORM_IDLE];
    for (int i = 1; i <= NUM_TRANSFORM_IDLE; i++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"lat capt KL.png"]];
        [idleFrames addObject:frame];
    }
    
    CCAnimation *idle = [CCAnimation animationWithFrames:[idleFrames getNSArray] delay:1.0/12.0];
        self.idleAnimation = idle;
    }
    return self.idleAnimation;
}

# define NUM_TRANSFORM_JUMP 31
-(CCAnimation*) getJumpAnimation{
    if (self.jumpAnimation == nil){
    CCArray *jumpFrames = [CCArray arrayWithCapacity:NUM_TRANSFORM_JUMP];
    for (int k = 1; k <= NUM_TRANSFORM_JUMP; k++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Lat Capt KL-Jumping00%d.png", k]];
        [jumpFrames addObject:frame];
    }
    CCAnimation *jump = [CCAnimation animationWithFrames:[jumpFrames getNSArray] delay:1.0/24.0];
        self.jumpAnimation = jump;
    }
    return self.jumpAnimation;
}

-(CCAnimation*) getSpAnimation{
    if (self.spAnimation == nil){

    CCArray *superPowerActionFrames = [CCArray arrayWithCapacity:31];
    for (int k = 1; k <= 31; k++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Lat Capt KL-Jumping00%d.png", k]];
        [superPowerActionFrames addObject:frame];
    }
    CCAnimation *actionAnimation = [CCAnimation animationWithFrames:[superPowerActionFrames getNSArray] delay:1.0/24.0];
        self.spAnimation = actionAnimation;
    }
    return self.spAnimation;
}


-(void) jump: (Player*) player {
    b2Vec2 impulse = b2Vec2(3.0f, 12.0f);
    player.body->ApplyLinearImpulse(impulse, player.body->GetWorldCenter());
    NSLog(@"PHYSICS JUMPING");

}

-(void) moveRight: (Player*) player{
    b2Vec2 impulse = b2Vec2(3.0f, 0.0f);
    player.body->ApplyLinearImpulse(impulse, player.body->GetWorldCenter());
    player.body->SetLinearVelocity(b2Vec2(4.5, 0));
    NSLog(@"PHYSICS MOVING RIGHT");
}


@end
