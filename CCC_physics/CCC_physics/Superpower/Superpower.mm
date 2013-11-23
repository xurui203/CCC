
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



@end
