
//  Created by Xu Rui on 13/11/13.
//
//

#import "Kangaroo.h"

@implementation Kangaroo

- (id)init{
    if (self = [super init]){
        NSString *myName = @"Kangaroo";
        self.name = myName;
        self.icon = [UIImage imageNamed: (NSString*) @"Kangaroo Icon"];

        self.jumpAnimation = self.makeJumpAnimation;
    }
    return self;
}

//25
# define NUM_TRANSFORM_FROM 9
-(CCAnimation*) makeTransformFromAnimation{
    CCArray *superPowerActionFrames = [CCArray arrayWithCapacity:NUM_TRANSFORM_FROM];
    for (int i = 1; i <= NUM_TRANSFORM_FROM; i++  ) {
        
        //CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Ant Capt Transistion-From KL00%d.png", i]];
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"CCC GF-Climbing/lat capt gf000%d.png", i]];

        [superPowerActionFrames addObject:frame];
    }
    CCAnimation *transformFromAnimation = [CCAnimation animationWithFrames:[superPowerActionFrames getNSArray] delay:1.0/24.0];
    return transformFromAnimation;

}

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

# define NUM_ACTION 31
-(CCAnimation*) makeJumpAnimation{
    CCArray *superPowerActionFrames = [CCArray arrayWithCapacity:31];
    for (int k = 1; k <= 31; k++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Lat Capt KL-Jumping00%d.png", k]];
        [superPowerActionFrames addObject:frame];
    }
    CCAnimation *actionAnimation = [CCAnimation animationWithFrames:[superPowerActionFrames getNSArray] delay:1.0/24.0];
    return actionAnimation;
}

-(void) kangarooJump: (Player*) player {
    b2Vec2 impulse = b2Vec2(4.0f, 15.0f);
    
    player.body->ApplyLinearImpulse(impulse, player.body->GetWorldCenter());
}



@end
