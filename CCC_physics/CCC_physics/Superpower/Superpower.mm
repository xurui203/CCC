
//  Created by Xu Rui on 13/11/13.
//
//

#import "Superpower.h"

@implementation Superpower

-(id)init{
//    self.transformFromAnimation = self.makeTransformFromAnimation;
//    self.transformIntoAnimation = self.makeTransformIntoAnimation;
//
//    self.crawlAnimation = self.makeCrawlAnimation;
//    self.jumpAnimation = self.makeJumpAnimation;
//    self.idleAnimation = self.makeIdleAnimation;
    return self;
}


- (CCAnimation *) getTransformFromAnimation{
    return nil;
}

- (CCAnimation *) getTransformIntoAnimation{
    return nil;
}

- (CCAnimation *) getJumpAnimation{
    return nil;
}

- (CCAnimation *) getSpAnimation{
    return nil;
}

- (CCAnimation *) getCrawlAnimation{
    return nil;
}
- (void) jump:(Player *)player{
    
}

-(CCAnimation*) makeAnimation: (int) numFrames : (NSString*) filename{
    CCAnimation *anim = [CCAnimation animation];
    [anim setDelayPerUnit: 1.0/24.0];
    if (numFrames > 9){
        for (int k = 1; k <= 9; k++ ) {
            [anim addFrameWithFilename:[NSString stringWithFormat:@"%@000%d.png", filename, k]];
            NSLog(@"Adding filename %@000%d.png", filename, k);
        }
        for (int k = 10; k <= numFrames; k++ ) {
            [anim addFrameWithFilename:[NSString stringWithFormat:@"%@00%d.png", filename, k]];
            NSLog(@"Adding filename %@000%d.png", filename, k);

        }
        
    } else{
        for (int k = 1; k <= numFrames; k++ ) {
            [anim addFrameWithFilename:[NSString stringWithFormat:@"%@000%d.png", filename, k]];
            NSLog(@"Adding filename %@000%d.png", filename, k);
        }
    }

//        CCArray *frames = [CCArray arrayWithCapacity:numFrames];
//    if (numFrames > 9){
//        for (int k = 1; k <= 9; k++ ) {
//            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"%@000%d.png", filename, k]];
//            [frames addObject:frame];
//        }
//        for (int k = 10; k <= numFrames; k++ ) {
//            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"%@00%d.png", filename, k]];
//            [frames addObject:frame];
//        }
//
//    } else{
//        for (int k = 1; k <= numFrames; k++ ) {
//            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"%@000%d.png", filename, k]];
//            [frames addObject:frame];
//        }
//    }
//    CCAnimation *animation = [CCAnimation animationWithFrames:[frames getNSArray] delay:1.0/24.0];
    return anim;
}

@end
