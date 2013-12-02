//
//  HudLayer.m
//  CaptainCC
//
//  Created by Ann Niou on 10/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "HudLayer.h"


@implementation HudLayer


-(id)init {
    if ((self = [super init])) {
//        ADD ENERGY BAR
        energyBar = [CCSprite spriteWithFile:@"Energy Score Bar0010.png"];
        [self addChild:energyBar];
        CCLOG(@"added energy bar");
        energyBar.position = ccp(50,300);
        energyBar.scale = .4;
    }
    return self;
}


-(void) setHealth:(int) health
{
    // 1 - Change current health
    currentHealth = health;
  //  CCLOG(@"setHealth");
  //  CCLOG(@"%d", currentHealth);
    NSString* newSprite = [NSString stringWithFormat:@"Energy Score Bar00%d.png", currentHealth];
    //CCTexture2D *tex = [[CCTextureCache sharedTextureCache] addImage: newSprite];
    //[energyBar setTexture: tex];
    energyBar.position = ccp(50, 300);

    energyBar.scale = .4;
}


@end
