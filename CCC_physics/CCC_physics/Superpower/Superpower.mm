
//  Created by Xu Rui on 13/11/13.
//
//

#import "Superpower.h"

@implementation Superpower

-(id)init{
    self.transformFromAnimation = self.makeTransformFromAnimation;
    self.transformIntoAnimation = self.makeTransformIntoAnimation;
    return self;
}


- (CCAnimation *) makeTransformFromAnimation{
    return nil;
}

- (CCAnimation *) makeTransformIntoAnimation{
    return nil;
}

- (void) jump:(Player *)player{
    
}


@end
