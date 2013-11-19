
//
//  Created by Xu Rui on 13/11/13.
//
//

#import "CaptainSP.h"

@implementation CaptainSP

- (id)init{

    if (self = [super init]){
//        
//        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"ActionsSheet.plist"];
//        CCSpriteBatchNode *sheet2 = [CCSpriteBatchNode batchNodeWithFile:@"ActionsSheet.png"];
//        [self addChild:sheet2];
        
//        self.transformFromAnimation = self.makeTransformFromAnimation;
//        self.transformIntoAnimation = self.makeTransformIntoAnimation;
//        
//        self.walkAnimation = self.makeWalkAnimation;
//        self.crawlAnimation = self.makeCrawlAnimation;
//        //self.jumpAnimation = self.makeJumpAnimation;
//        self.idleAnimation = self.makeIdleAnimation;
//        
        
        NSString *myName = @"captainSP";
        self.name = myName;
        self.canWalk = TRUE;
        self.canCrawl = TRUE;
        self.canJump = TRUE;
        
//        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"ActionsSheet.plist"];
//        CCSpriteBatchNode *sheet2 = [CCSpriteBatchNode batchNodeWithFile:@"ActionsSheet.png"];
//        [self addChild:sheet2];
        //self.icon = [UIImage imageNamed: (NSString*) @"Kangaroo Icon"];
        NSLog(@"Making transformation animations");

    }
    return self;
}

# define NUM_TRANSFORM_INTO 1

- (CCAnimation *) makeTransformIntoAnimation { //Ant Capt Trainsition-Human0001.png
    //action animation - runs once and then returns to idle
    CCArray *superPowerActionFrames = [CCArray arrayWithCapacity:NUM_TRANSFORM_INTO];
    for (int i = 1; i <= NUM_TRANSFORM_INTO; i++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Ant Capt Transition-From Human00%d.png", i]];
        [superPowerActionFrames addObject:frame];
    }
    CCAnimation *actionAnimation = [CCAnimation animationWithFrames:[superPowerActionFrames getNSArray] delay:1.0/24.0];
    
    return actionAnimation;
}


//Ant Capt Transition-From Human0001
# define NUM_TRANSFORM_FROM 27

- (CCAnimation *) makeTransformFromAnimation { //Ant Capt Transition-From Human0002.png
    //action animation - runs once and then returns to idle
    CCArray *superPowerActionFrames = [CCArray arrayWithCapacity:NUM_TRANSFORM_FROM];
    for (int i = 1; i <= NUM_TRANSFORM_FROM; i++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Ant Capt Transition-From Human00%d.png", i]];
        [superPowerActionFrames addObject:frame];
    }
    CCAnimation *actionAnimation = [CCAnimation animationWithFrames:[superPowerActionFrames getNSArray] delay:1.0/24.0];
    return actionAnimation;
    
}

//# define NUM_TRANSFORM_FROM 9
//-(CCAnimation*) makeTransformFromAnimation{
//
//    CCArray *superPowerActionFrames = [CCArray arrayWithCapacity:NUM_TRANSFORM_FROM];
//    for (int i = 1; i <= NUM_TRANSFORM_FROM; i++  ) {
//        
//        //CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Ant Capt Transistion-From KL00%d.png", i]];
//        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"lat capt gf000%d.png", i]];
//        
//        [superPowerActionFrames addObject:frame];
//    }
//    CCAnimation *transformFromAnimation = [CCAnimation animationWithFrames:[superPowerActionFrames getNSArray] delay:1.0/24.0];
//    return transformFromAnimation;
//    
//}


# define NUM_TRANSFORM_WALK 18

- (CCAnimation *) makeWalkAnimation {
    
    CCArray *walkFrames = [CCArray arrayWithCapacity:NUM_TRANSFORM_WALK];
    for (int i = 1; i < NUM_TRANSFORM_WALK; i++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Lat Capt Human-Walking00%d", i]];
        [walkFrames addObject:frame];
    }
    
    CCAnimation *walk = [CCAnimation animationWithFrames:[walkFrames getNSArray] delay:1.0/12.0];
    
    return walk;
    
}

# define NUM_TRANSFORM_CRAWL 20
- (CCAnimation *) makeCrawlAnimation {
    
    CCArray *crawlFrames = [CCArray arrayWithCapacity: NUM_TRANSFORM_CRAWL];
    for (int i = 1; i < NUM_TRANSFORM_CRAWL; i++) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Lat Capt Human-Crawling00%d.png", i]];
        [crawlFrames addObject:frame];
    }
    
    CCAnimation *crawl = [CCAnimation animationWithFrames:[crawlFrames getNSArray] delay:1.0/12.0];
    
    return crawl;
    
}

# define NUM_TRANSFORM_IDLE 6
- (CCAnimation *) makeIdleAnimation {
    
    CCArray *idleFrames = [CCArray arrayWithCapacity:NUM_TRANSFORM_IDLE];
    for (int i = 1; i < NUM_TRANSFORM_IDLE; i++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Lat Capt Human-Standing00%d.png", i]];
        [idleFrames addObject:frame];
    }
    
    CCAnimation *idleAnimation = [CCAnimation animationWithFrames:[idleFrames getNSArray] delay:1.0/12.0];
    
    return idleAnimation;
}

# define NUM_TRANSFORM_JUMP 9
- (CCAnimation *) makeJumpAnimation {
    
    CCArray *jumpFrames = [CCArray arrayWithCapacity:NUM_TRANSFORM_JUMP];
    for (int i = 1; i < NUM_TRANSFORM_JUMP; i++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Lat Capt Human-Leaping000%d.png", i]];
        [jumpFrames addObject:frame];
    }
    
    CCAnimation *jumpAnimation = [CCAnimation animationWithFrames:[jumpFrames getNSArray] delay:1.0/12.0];
    
    return jumpAnimation;
}



-(void) jump: (Player*) player {
    b2Vec2 impulse = b2Vec2(4.0f, 15.0f);
    player.body->ApplyLinearImpulse(impulse, player.body->GetWorldCenter());
}


-(void) moveRight: (Player*) player{
    b2Vec2 impulse = b2Vec2(1.0f, 0.0f);
    player.body->ApplyLinearImpulse(impulse, player.body->GetWorldCenter());
    player.body->SetLinearVelocity(b2Vec2(6.5, 0));
}

-(void) crawl: (Player*) player {
    b2Vec2 impulse = b2Vec2(1.0f, 0.0f);
    player.body->ApplyLinearImpulse(impulse, player.body->GetWorldCenter());
    player.body->SetLinearVelocity(b2Vec2(5.5, 0));
    
}


@end
