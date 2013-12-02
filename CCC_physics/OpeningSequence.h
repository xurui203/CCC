//
//  OpeningSequence.h
//  CCC_physics
//
//  Created by Ann Niou on 11/19/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Defines.h"
#import "SceneManager.h"
#import "CCVideoPlayer.h"

@interface OpeningSequence : CCLayer <CCVideoPlayerDelegate> {
    
}
@property (nonatomic, assign) BOOL iPad;
@end
