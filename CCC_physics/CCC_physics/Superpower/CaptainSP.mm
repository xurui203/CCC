
//
//  Created by Xu Rui on 13/11/13.
//
//

#import "CaptainSP.h"

@implementation CaptainSP

- (id)init{

    if (self = [super init]){
//
        NSString *myName = @"captainSP";
        self.name = myName;
         self.LMVideo =  @"Opening Sequence.m4v";
        self.canWalk = TRUE;
        self.canCrawl = TRUE;
        self.canJump = TRUE;
        self.mazeID = CAPTAIN_MAZE_ID;
        self.isLocked = NO;
        self.icon = @"CCC icon.png";
        CCLOG(@"Making transformation animations");

    }
    return self;
}

# define NUM_TRANSFORM_SP 31

-(CCAnimation*) getSpAnimation{
    if (self.spAnimation == nil){
        self.spAnimation = [self makeAnimation:NUM_TRANSFORM_SP :[NSString stringWithFormat:@"Lat Capt KL-Jumping"]];
    }
    return self.spAnimation;
}


# define NUM_TRANSFORM_INTO 35

- (CCAnimation *) getTransformIntoAnimation { //Ant Capt Trainsition-Human0001.png
    //action animation - runs once and then returns to idle
    if (self.transformIntoAnimation == nil){
        self.transformIntoAnimation = [self makeAnimation:NUM_TRANSFORM_INTO :[NSString stringWithFormat:@"Captain"]];
    }
    return self.transformIntoAnimation;
}


//Ant Capt Transition-From Human0001
# define NUM_TRANSFORM_FROM 27

- (CCAnimation *) getTransformFromAnimation { //Ant Capt Transition-From Human0002.png
    //action animation - runs once and then returns to idle
    if (self.transformFromAnimation == nil){
        self.transformFromAnimation = [self makeAnimation:NUM_TRANSFORM_FROM :[NSString stringWithFormat:@"Ant Capt Transition-From Human"]];
    }
    return self.transformFromAnimation;
}

# define NUM_TRANSFORM_WALK 18

- (CCAnimation *) getWalkAnimation {
    if (self.walkAnimation == nil){
        self.walkAnimation = [self makeAnimation:NUM_TRANSFORM_WALK :[NSString stringWithFormat:@"Lat Capt Human-Walking"]];
    }
    return self.walkAnimation;
    
}

# define NUM_TRANSFORM_CRAWL 20
- (CCAnimation *) getCrawlAnimation {
    if (self.crawlAnimation == nil){
        self.crawlAnimation = [self makeAnimation:NUM_TRANSFORM_CRAWL :[NSString stringWithFormat:@"Lat Capt Human-Crawling"]];
    }
    return self.crawlAnimation;
    
}

# define NUM_TRANSFORM_IDLE 6
- (CCAnimation *) getIdleAnimation {
    if (self.idleAnimation == nil){
        self.idleAnimation = [self makeAnimation:NUM_TRANSFORM_IDLE :[NSString stringWithFormat:@"Lat Capt Human-Standing"]];
    }
    return self.idleAnimation;
}

# define NUM_TRANSFORM_JUMP 11
- (CCAnimation *) getJumpAnimation {
    if (self.jumpAnimation == nil){
        self.jumpAnimation = [self makeAnimation:NUM_TRANSFORM_JUMP :[NSString stringWithFormat:@"lat capt human"]];
    }
    return self.jumpAnimation;
}



-(void) jump: (Player*) player {
//    [player setUpright:true];
    b2Vec2 impulse = b2Vec2(2.0f, 4.0f);
    player.body->ApplyLinearImpulse(impulse, player.body->GetWorldCenter());
    NSLog(@"Player jumping");
}


-(void) moveRight: (Player*) player{
//    [player setUpright:true];
    b2Vec2 impulse = b2Vec2(2.0f, 0.0f);
    player.body->ApplyLinearImpulse(impulse, player.body->GetWorldCenter());
    player.body->SetLinearVelocity(b2Vec2(6.5, 0));
    NSLog(@"Player moving right");

}

-(void) crawl: (Player*) player {
    b2Vec2 impulse = b2Vec2(1.0f, 0.0f);
//    [player setUpright:false];
    player.body->ApplyLinearImpulse(impulse, player.body->GetWorldCenter());
    player.body->SetLinearVelocity(b2Vec2(5.5, 0));
    NSLog(@"Player crawling");

    
}

-(void) moveLeft: (Player*) player{
    //    [player setUpright:true];
    b2Vec2 impulse = b2Vec2(-2.0f, 0.0f);
    player.body->ApplyLinearImpulse(impulse, player.body->GetWorldCenter());
    player.body->SetLinearVelocity(b2Vec2(-3.5, 0));
    NSLog(@"Player moving right");
    
}


@end
