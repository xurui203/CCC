
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
         self.LMVideo =  @"Opening Sequence.mov";
        self.canWalk = TRUE;
        self.canCrawl = TRUE;
        self.canJump = TRUE;
        
        self.isLocked = NO;
//        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"ActionsSheet.plist"];
//        CCSpriteBatchNode *sheet2 = [CCSpriteBatchNode batchNodeWithFile:@"ActionsSheet.png"];
//        [self addChild:sheet2];
        self.icon = @"CCC icon.png";
        CCLOG(@"Making transformation animations");

    }
    return self;
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


# define NUM_TRANSFORM_INTO 35

- (CCAnimation *) getTransformIntoAnimation { //Ant Capt Trainsition-Human0001.png
    //action animation - runs once and then returns to idle
    if (self.transformFromAnimation == nil){
    CCArray *superPowerActionFrames = [CCArray arrayWithCapacity:NUM_TRANSFORM_INTO];
    for (int i = 1; i <= NUM_TRANSFORM_INTO; i++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Captain00%d.png", i]];
        [superPowerActionFrames addObject:frame];
    }
    CCAnimation *actionAnimation = [CCAnimation animationWithFrames:[superPowerActionFrames getNSArray] delay:1.0/24.0];
//        actionAnimation.restoreOriginalFrame = YES;
    self.transformIntoAnimation = actionAnimation;
    }
    return self.transformIntoAnimation;
}


//Ant Capt Transition-From Human0001
# define NUM_TRANSFORM_FROM 27

- (CCAnimation *) getTransformFromAnimation { //Ant Capt Transition-From Human0002.png
    //action animation - runs once and then returns to idle
    if (self.transformFromAnimation == nil){
    CCArray *superPowerActionFrames = [CCArray arrayWithCapacity:NUM_TRANSFORM_FROM];
    for (int i = 1; i <= NUM_TRANSFORM_FROM; i++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Ant Capt Transition-From Human00%d.png", i]];
        [superPowerActionFrames addObject:frame];
    }
    CCAnimation *actionAnimation = [CCAnimation animationWithFrames:[superPowerActionFrames getNSArray] delay:1.0/24.0];
    self.transformFromAnimation = actionAnimation;
    }
    return self.transformFromAnimation;
    
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

- (CCAnimation *) getWalkAnimation {
    if (self.walkAnimation == nil){
    CCArray *walkFrames = [CCArray arrayWithCapacity:NUM_TRANSFORM_WALK];
    for (int i = 1; i < NUM_TRANSFORM_WALK; i++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Lat Capt Human-Walking00%d.png", i]];
        [walkFrames addObject:frame];
    }
    
    CCAnimation *walk = [CCAnimation animationWithFrames:[walkFrames getNSArray] delay:1.0/12.0];
    self.walkAnimation = walk;
    }
    return self.walkAnimation;
    
}

# define NUM_TRANSFORM_CRAWL 20
- (CCAnimation *) getCrawlAnimation {
    if (self.crawlAnimation == nil){
    CCArray *crawlFrames = [CCArray arrayWithCapacity: NUM_TRANSFORM_CRAWL];
    for (int i = 1; i < NUM_TRANSFORM_CRAWL; i++) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Lat Capt Human-Crawling00%d.png", i]];
        [crawlFrames addObject:frame];
    }
    
    CCAnimation *crawl = [CCAnimation animationWithFrames:[crawlFrames getNSArray] delay:1.0/12.0];
    self.crawlAnimation = crawl;
    }
    return self.crawlAnimation;
    
}

# define NUM_TRANSFORM_IDLE 6
- (CCAnimation *) getIdleAnimation {
    if (self.idleAnimation == nil){
    CCArray *idleFrames = [CCArray arrayWithCapacity:NUM_TRANSFORM_IDLE];
    for (int i = 1; i < NUM_TRANSFORM_IDLE; i++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Lat Capt Human-Standing00%d.png", i]];
        [idleFrames addObject:frame];
    }
    
    CCAnimation *idle = [CCAnimation animationWithFrames:[idleFrames getNSArray] delay:1.0/12.0];
    self.idleAnimation = idle;
    }
    return self.idleAnimation;
}

# define NUM_TRANSFORM_JUMP 9
- (CCAnimation *) getJumpAnimation {
    if (self.jumpAnimation == nil){
    CCArray *jumpFrames = [CCArray arrayWithCapacity:NUM_TRANSFORM_JUMP];
    for (int i = 1; i < NUM_TRANSFORM_JUMP; i++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Lat Capt Human-Leaping000%d.png", i]];
        [jumpFrames addObject:frame];
    }
    
    CCAnimation *jump = [CCAnimation animationWithFrames:[jumpFrames getNSArray] delay:1.0/12.0];
        self.jumpAnimation = jump;
    }
    return self.jumpAnimation;
}



-(void) jump: (Player*) player {
    b2Vec2 impulse = b2Vec2(2.0f, 4.0f);
    player.body->ApplyLinearImpulse(impulse, player.body->GetWorldCenter());
    NSLog(@"Player jumping");
}


-(void) moveRight: (Player*) player{
    b2Vec2 impulse = b2Vec2(2.0f, 0.0f);
    player.body->ApplyLinearImpulse(impulse, player.body->GetWorldCenter());
    player.body->SetLinearVelocity(b2Vec2(6.5, 0));
    NSLog(@"Player moving right");

}

-(void) crawl: (Player*) player {
    b2Vec2 impulse = b2Vec2(1.0f, 0.0f);
    player.body->ApplyLinearImpulse(impulse, player.body->GetWorldCenter());
    player.body->SetLinearVelocity(b2Vec2(5.5, 0));
    NSLog(@"Player crawling");

    
}


@end
