//
//  GameObject.h
//  SimpleBox2dScroller
//
//  Created by min on 3/17/11.
//  Copyright 2011 Min Kwon. All rights reserved.
//

#import "cocos2d.h"
#import "Constants.h"

@interface GameObject : CCSprite {
    GameObjectType  type;
}

-(void) playObjectAnimation: (CCAnimation*) animation;
-(CCAnimation*) makeAnimation: (int) numFrames : (NSString*) filename;

@property (nonatomic, readwrite) GameObjectType type;
@property (nonatomic) BOOL hasRunAnimation;

@end
