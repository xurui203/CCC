
//  Created by Xu Rui on 13/11/13.
//
//

#import "Superpower.h"

@implementation Superpower

-(id)init{
    self.transformFromAnimation = self.makeTransformFromAnimation;
    self.transformIntoAnimation = self.makeTransformIntoAnimation;

    self.walkAnimation = self.makeWalkAnimation;
    self.crawlAnimation = self.makeCrawlAnimation;
    self.jumpAnimation = self.makeJumpAnimation;
    self.idleAnimation = self.makeIdleAnimation;
    return self;
}


- (CCAnimation *) makeTransformFromAnimation{
    return nil;
}

- (CCAnimation *) makeTransformIntoAnimation{
    return nil;
}

- (CCAnimation *) makeJumpAnimation{
    return nil;
}
- (void) jump:(Player *)player{
    
}



@end
