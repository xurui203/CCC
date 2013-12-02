
//
//  Created by Xu Rui on 13/11/13.
//
//

#import "CaptainSP.h"

@implementation CaptainSP

- (id)init{
    if (self = [super init]){
        NSString *myName = @"CaptainSP";
        self.name = myName;
        //self.icon = [UIImage imageNamed: (NSString*) @"Kangaroo Icon"];
        
        //Necessary?
        NSLog(@"Making transformation animations");
        self.transformFromAnimation = self.makeTransformFromAnimation;
        self.transformIntoAnimation = self.makeTransformIntoAnimation;
       // self.jumpAnimation = self.makeJumpAnimation;
    }
    return self;
}

- (CCAnimation *) makeTransformIntoAnimation { //Ant Capt Trainsition-Human0001.png
    //action animation - runs once and then returns to idle
    CCArray *superPowerActionFrames = [CCArray arrayWithCapacity:85];
    for (int i = 1; i <= 25; i++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Ant Capt Transistion-From KL00%d.png", i]];
        [superPowerActionFrames addObject:frame];
    }
    for (int j = 1; j <= 29; j++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Ant Capt Trainsition-KL00%d.png", j]];
        [superPowerActionFrames addObject:frame];
    }
    for (int k = 1; k <= 31; k++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Lat Capt KL-Jumping00%d.png", k]];
        [superPowerActionFrames addObject:frame];
    }
    CCAnimation *actionAnimation = [CCAnimation animationWithFrames:[superPowerActionFrames getNSArray] delay:1.0/24.0];
    
    return actionAnimation;
}

- (CCAnimation *) makeTransformFromAnimation { //Ant Capt Transition-From Human0002.png
    //action animation - runs once and then returns to idle
    CCArray *superPowerActionFrames = [CCArray arrayWithCapacity:54];
    for (int i = 1; i <= 25; i++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Ant Capt Transistion-From KL00%d.png", i]];
        [superPowerActionFrames addObject:frame];
    }
    for (int j = 1; j <= 29; j++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Ant Capt Trainsition-KL00%d.png", j]];
        [superPowerActionFrames addObject:frame];
    }
    for (int k = 1; k <= 31; k++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Lat Capt KL-Jumping00%d.png", k]];
        [superPowerActionFrames addObject:frame];
    }
    CCAnimation *actionAnimation = [CCAnimation animationWithFrames:[superPowerActionFrames getNSArray] delay:1.0/24.0];
    
    return actionAnimation;
}

-(void) jump: (Player*) player {
    b2Vec2 impulse = b2Vec2(4.0f, 15.0f);
    player.body->ApplyLinearImpulse(impulse, player.body->GetWorldCenter());
}


@end
