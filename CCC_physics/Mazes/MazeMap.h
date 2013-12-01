//
//  MazeMap.h
//  CCC_physics
//
//  Created by Xu Rui on 30/11/13.
//
//

#import "CCTMXTiledMap.h"

@interface MazeMap : CCTMXTiledMap

@property(nonatomic, assign) int _mapID;

- (id) initWithTMXFileAndID: (int) mapId: (NSString*) filename;

@end
