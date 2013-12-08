//
//  Ram.m
//  CCC_physics
//
//  Created by Xu Rui on 2/12/13.
//
//

#import "Ram.h"

@implementation Ram
- (id)init{
    
    if (self = [super init]){
        //
        NSString *myName = @"Ram";
        self.name = myName;
        self.LMVideo =  @"Ram Horn Rough.m4v";
        self.canWalk = TRUE;
        self.canCrawl = FALSE;
        self.canJump = FALSE;
        self.canBreak = TRUE;
        self.canSP = TRUE;
        self.mazeID = CAPTAIN_MAZE_ID;
        self.isLocked = NO;
        self.icon = @"Ram Icon.png";
        CCLOG(@"Making transformation animations");
        
    }
    return self;
}

# define NUM_TRANSFORM_SP 23

-(CCAnimation*) getSpAnimation{
    if (self.spAnimation == nil){
        self.spAnimation = [self makeAnimation:NUM_TRANSFORM_SP :[NSString stringWithFormat:@"Lat Capt Ram-Break Through"]];
    }
    return self.spAnimation;
    
}


# define NUM_TRANSFORM_INTO 52

- (CCAnimation *) getTransformIntoAnimation {
    //action animation - runs once and then returns to idle
    if (self.transformIntoAnimation == nil){
        self.transformIntoAnimation = [self makeAnimation:NUM_TRANSFORM_INTO :[NSString stringWithFormat:@"Captain Into RH"]];
    }
    return self.transformIntoAnimation;
}


//Ant Capt Transition-From Human0001
# define NUM_TRANSFORM_FROM 27

- (CCAnimation *) getTransformFromAnimation {
    //action animation - runs once and then returns to idle
    if (self.transformFromAnimation == nil){
        self.transformFromAnimation = [self makeAnimation:NUM_TRANSFORM_FROM :[NSString stringWithFormat:@"Captain From RH"]];
    }
    return self.transformFromAnimation;
}

# define NUM_TRANSFORM_WALK 24

- (CCAnimation *) getWalkAnimation {
    if (self.walkAnimation == nil){
        self.walkAnimation = [self makeAnimation:NUM_TRANSFORM_WALK :[NSString stringWithFormat:@"Lat Capt Ram-Running"]];
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


-(void) jump: (Player*) player {
    //    [player setUpright:true];
    b2Vec2 impulse = b2Vec2(2.0f, 4.0f);
    player.body->ApplyLinearImpulse(impulse, player.body->GetWorldCenter());
    NSLog(@"Player jumping");
}

-(void) spAction:(Player *)player {
    b2Vec2 impulse = b2Vec2(3.0f, 0.0f);
    player.body->ApplyLinearImpulse(impulse, player.body->GetWorldCenter());
    player.body->SetLinearVelocity(b2Vec2(6.5, 0));
    NSLog(@"SP:Ram class: Player breaking wall");
}


-(void) moveLeft: (Player*) player{
    //    [player setUpright:true];
    b2Vec2 impulse = b2Vec2(-4.0f, 0.0f);
    player.body->ApplyLinearImpulse(impulse, player.body->GetWorldCenter());
    player.body->SetLinearVelocity(b2Vec2(-3.5, 0));
    NSLog(@"Player moving right");
    
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
@end
