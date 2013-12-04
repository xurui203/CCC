//
//  GameObject.m
//  SimpleBox2dScroller
//
//  Created by min on 3/17/11.
//  Copyright 2011 Min Kwon. All rights reserved.
//

#import "GameObject.h"

@implementation GameObject
@synthesize type;

- (id)init
{
    self = [super init];
    if (self) {
        type = kGameObjectNone;
    }
    
    return self;
}

-(id)initWithSpriteFrameName:(NSString*)spriteFrameName
{
    if ( self = [super init] ){
        if ((self = [super initWithSpriteFrameName:spriteFrameName])) {
            NSLog(@"Super initing with sprite frame");
            NSAssert(spriteFrameName!=nil, @"Invalid spriteFrameName for sprite");
            
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:spriteFrameName];
            return [super initWithSpriteFrame:frame];
        }
        
    }

}

-(void) playObjectAnimation: (CCAnimation*) animation
{
    CCAction *animationAction = [CCSequence actions:[CCAnimate actionWithAnimation: animation], nil];
    [self runAction: animationAction];
}

- (void)dealloc
{
    [super dealloc];
}

-(CCAnimation*) makeAnimation: (int) numFrames : (NSString*) filename{
    CCAnimation *anim = [CCAnimation animation];
    [anim setDelayPerUnit: 1.0/24.0];
    if (numFrames > 9){
        for (int k = 1; k <= 9; k++ ) {
            [anim addFrameWithFilename:[NSString stringWithFormat:@"%@000%d.png", filename, k]];
        }
        for (int k = 10; k <= numFrames; k++ ) {
            [anim addFrameWithFilename:[NSString stringWithFormat:@"%@00%d.png", filename, k]];
        }
        
    } else{
        for (int k = 1; k <= numFrames; k++ ) {
            [anim addFrameWithFilename:[NSString stringWithFormat:@"%@000%d.png", filename, k]];
        }
    }
    return anim;
}

@end
