//
//  MazeMap.m
//  CCC_physics
//
//  Created by Xu Rui on 30/11/13.
//
//

#import "MazeMap.h"

@implementation MazeMap

- (id) initWithTMXFileAndID: (int) mapId: (NSString*) filename{
    if (self = [super initWithTMXFile:filename]){
        self._mapID = mapId;
    }
    return self;
}
@end
