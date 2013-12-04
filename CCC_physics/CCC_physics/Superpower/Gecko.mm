//
//  Gecko.m
//  CCC_physics
//
//  Created by Xu Rui on 30/11/13.
//
//

#import "Gecko.h"

@implementation Gecko
- (id)init{
    
    if (self = [super init]){
        //
        NSString *myName = @"Gecko";
        self.name = myName;
        self.LMVideo =  @"Gecko Feet Rough.m4v";
        self.canWalk = TRUE;
        self.canCrawl = TRUE;
        self.canJump = FALSE;
        self.mazeID = GECKO_MAZE_ID;
        self.isLocked = NO;
        self.icon = @"Gecko Icon.png";
        CCLOG(@"Making transformation animations");
        
    }
    return self;
}

# define NUM_TRANSFORM_SP 28

-(CCAnimation*) getSpAnimation{
    if (self.spAnimation == nil){
        self.spAnimation = [self makeAnimation:NUM_TRANSFORM_SP :[NSString stringWithFormat:@"lat capt gf"]];
    }
    return self.spAnimation;
}


# define NUM_TRANSFORM_INTO 29

- (CCAnimation *) getTransformIntoAnimation { //Ant Capt Trainsition-Human0001.png
    //action animation - runs once and then returns to idle
    if (self.transformIntoAnimation == nil){
        self.transformIntoAnimation = [self makeAnimation:NUM_TRANSFORM_INTO :[NSString stringWithFormat:@"Ant Capt Trainsition-GF"]];
    }
    return self.transformIntoAnimation;
}


//Ant Capt Transition-From Human0001
# define NUM_TRANSFORM_FROM 28

- (CCAnimation *) getTransformFromAnimation { //Ant Capt Transition-From Human0002.png
    //action animation - runs once and then returns to idle
    if (self.transformFromAnimation == nil){
        self.transformFromAnimation = [self makeAnimation:NUM_TRANSFORM_FROM :[NSString stringWithFormat:@"Ant Capt Tranisition-From GF"]];
    }
    return self.transformFromAnimation;
}

# define NUM_TRANSFORM_WALK 39

- (CCAnimation *) getWalkAnimation {
    if (self.walkAnimation == nil){
        self.walkAnimation = [self makeAnimation:NUM_TRANSFORM_WALK :[NSString stringWithFormat:@"CCC GF-Walking"]];
    }
    return self.walkAnimation;
    
}

# define NUM_TRANSFORM_IDLE 1
- (CCAnimation *) getIdleAnimation {
    if (self.idleAnimation == nil){
        self.idleAnimation = [self makeAnimation:NUM_TRANSFORM_IDLE :[NSString stringWithFormat:@"CCC GF-Walking"]];
    }
    return self.idleAnimation;
}

# define NUM_TRANSFORM_CRAWL 28

-(CCAnimation*) getCrawlAnimation{
    if (self.crawlAnimation == nil){
        self.crawlAnimation = [self makeAnimation:NUM_TRANSFORM_SP :[NSString stringWithFormat:@"lat capt gf"]];
    }
    return self.crawlAnimation;
}



-(void) moveRight: (Player*) player{
    [player setUpright:true];
    b2Vec2 impulse = b2Vec2(2.0f, 0.0f);
    player.body->ApplyLinearImpulse(impulse, player.body->GetWorldCenter());
    player.body->SetLinearVelocity(b2Vec2(6.5, 0));
    NSLog(@"Player moving right");
    
}

//-(void) crawl: (Player*) player {
//    [player setUpright:false];
//    b2World *world = player.body->GetWorld();
//    b2Vec2 gravityVal = b2Vec2(0.0f, 0.0f);
//    world->SetGravity(gravityVal);
//    b2Vec2 impulse = b2Vec2(1.0f, 0.0f);
//    player.body->ApplyLinearImpulse(impulse, player.body->GetWorldCenter());
//    player.body->SetLinearVelocity(b2Vec2(5.5, 0));
//    NSLog(@"Player crawling");
//    
//}

-(void) climb: (Player*) player {
    [player setUpright:false];
    b2World *world = player.body->GetWorld();
    b2Vec2 gravityVal = b2Vec2(0.0f, 0.0f);
    world->SetGravity(gravityVal);
    b2Vec2 impulse = b2Vec2(1.0f, 0.0f);
    player.body->ApplyLinearImpulse(impulse, player.body->GetWorldCenter());
    player.body->SetLinearVelocity(b2Vec2(5.5, 0));
    NSLog(@"Player crawling");
    
}
@end
