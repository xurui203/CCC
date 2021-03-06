//
//  MazeManager.h
//  CCC_physics
//
//  Created by Xu Rui on 30/11/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface MazeManager : NSObject
+ (MazeManager *)sharedInstance;
@property (nonatomic) int currentMapID;
//- (int)curLevel;
//- (void)nextLevel;
- (void)reset;
- (int) nextLevel;
- (CCTMXTiledMap*) getMapWithID: (int) mapID;

@end
