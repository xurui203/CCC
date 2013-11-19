
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
        
        NSString *myName = @"CaptainSP";
        self.name = myName;
//        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"ActionsSheet.plist"];
//        CCSpriteBatchNode *sheet2 = [CCSpriteBatchNode batchNodeWithFile:@"ActionsSheet.png"];
//        [self addChild:sheet2];
        //self.icon = [UIImage imageNamed: (NSString*) @"Kangaroo Icon"];
        NSLog(@"Making transformation animations");

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


//Ant Capt Transition-From Human0001

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

- (CCAnimation *) makeWalkAnimation {
    
    CCArray *walkFrames = [CCArray arrayWithCapacity:8];
    for (int i = 1; i < 9; i++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Lat Capt Human-Walking000%d.png", i]];
        [walkFrames addObject:frame];
    }
    
    CCAnimation *walk = [CCAnimation animationWithFrames:[walkFrames getNSArray] delay:1.0/12.0];
    
    return walk;
    
}

- (CCAnimation *) makeCrawlAnimation {
    
    CCArray *crawlFrames = [CCArray arrayWithCapacity:8];
    for (int i = 1; i < 9; i++) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Lat Capt Human-Crawling000%d.png", i]];
        [crawlFrames addObject:frame];
    }
    
    CCAnimation *crawl = [CCAnimation animationWithFrames:[crawlFrames getNSArray] delay:1.0/12.0];
    
    return crawl;
    
}

- (CCAnimation *) makeIdleAnimation {
    
    CCArray *idleFrames = [CCArray arrayWithCapacity:2];
    for (int i = 1; i < 3; i++  ) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Lat Capt Human-Standing000%d.png", i]];
        [idleFrames addObject:frame];
    }
    
    CCAnimation *idleAnimation = [CCAnimation animationWithFrames:[idleFrames getNSArray] delay:1.0/12.0];
    
    return idleAnimation;
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
    player.body->SetLinearVelocity(b2Vec2(6.5, 0));
    
}


@end
