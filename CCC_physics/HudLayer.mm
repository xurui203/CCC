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
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"energy.plist"];
//        _dPad = [DirectionPad dPadWithFile:@"pd_dpad.png" radius:500];
//        _dPad.position = ccp(250.0, 64.0);
//        _dPad.opacity = 0;
//        [self addChild:_dPad];
        
        
//        ADD ENERGY BAR
        energyBar = [CCSprite spriteWithFile:@"Energy Score Bar0010.png"];
        [self addChild:energyBar];
        CCLOG(@"added energy bar");
        energyBar.position = ccp(50,300);
        energyBar.scale = .5;


    }
    return self;
}


-(void) setHealth:(int) health
{
    // 1 - Change current health
    currentHealth = health;
    CCLOG(@"setHealth");
    CCLOG(@"%d", currentHealth);
    NSString* newSprite = [NSString stringWithFormat:@"Energy Score Bar00%d.png", currentHealth];
    
    CCLOG(@"Energy Score Bar00%d.png", currentHealth);
        CCSpriteFrameCache* cache = [CCSpriteFrameCache sharedSpriteFrameCache];
        [energyBar setDisplayFrame:[cache spriteFrameByName:newSprite]];
    energyBar.position = ccp(50, 300);
    energyBar.scale = .5;
}


@end
