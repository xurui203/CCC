//
//  Collectible.m
//  CCC_physics
//
//  Created by Ann Niou on 11/14/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Collectible.h"


@implementation Collectible

- (id) init {
	if ((self = [super init])) {

 
	}
	return self;
}


-(void) consume
{
    if(!consumed)
    {
        // set consumed
        consumed = YES;
        
        // fade & shrink object
        // and delete after animation
        [self runAction:
         [CCSequence actions:
          [CCSpawn actions:
           [CCFadeOut actionWithDuration:0.1],
           [CCScaleTo actionWithDuration:0.2 scale:0.0],
           nil],
          [CCCallFunc actionWithTarget:self selector:@selector(deleteNow)],
          nil]
         ];
        
        // play the item consumed sound
        // pan it depending on the position of the monkey
        // add some randomness to the pitch
//        [[SimpleAudioEngine sharedEngine] playEffect:@"gulp.caf"
//                                               pitch:gFloatRand(0.8,1.2)
//                                                 pan:(self.ccNode.position.x-240.0f) / 240.0f
//                                                gain:1.0 ];
    }
}

@end
