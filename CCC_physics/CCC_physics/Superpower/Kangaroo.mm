
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
        self.mazeID = KL_MAZE_ID;
    }
    return self;
}

//25
//Ant Capt Transistion-From KL0001
# define NUM_TRANSFORM_FROM 25
-(CCAnimation*) getTransformFromAnimation{
    if (self.transformFromAnimation == nil){
        self.transformFromAnimation = [self makeAnimation:NUM_TRANSFORM_FROM :[NSString stringWithFormat:@"Ant Capt Transistion-From KL"]];    }
    return self.transformFromAnimation;

}

//Ant Capt Trainsition-KL0001

# define NUM_TRANSFORM_INTO 29
-(CCAnimation*) getTransformIntoAnimation{
    if (self.transformIntoAnimation == nil){
        self.transformIntoAnimation = [self makeAnimation:NUM_TRANSFORM_INTO :[NSString stringWithFormat:@"Ant Capt Trainsition-KL"]];
    }
    return self.transformIntoAnimation;
}

# define NUM_TRANSFORM_WALK 15

- (CCAnimation *) getWalkAnimation {
    if (self.walkAnimation == nil){
        self.walkAnimation = [self makeAnimation:NUM_TRANSFORM_WALK :[NSString stringWithFormat:@"Lat Capt KL-Running"]];    }
    return self.walkAnimation;
    
}

# define NUM_TRANSFORM_IDLE 1
- (CCAnimation *) getIdleAnimation {
    if (self.idleAnimation == nil){
        self.idleAnimation = [self makeAnimation:NUM_TRANSFORM_IDLE :[NSString stringWithFormat:@"lat capt KL"]];
    }
    return self.idleAnimation;
}

# define NUM_TRANSFORM_JUMP 31
-(CCAnimation*) getJumpAnimation{
    if (self.jumpAnimation == nil){
        self.jumpAnimation = [self makeAnimation:NUM_TRANSFORM_JUMP :[NSString stringWithFormat:@"Lat Capt KL-Jumping"]];
    }
    return self.jumpAnimation;
}

# define NUM_TRANSFORM_SP 31
-(CCAnimation*) getSpAnimation{
    if (self.spAnimation == nil){
        self.spAnimation = [self makeAnimation:NUM_TRANSFORM_SP :[NSString stringWithFormat:@"Lat Capt KL-Jumping"]];
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
