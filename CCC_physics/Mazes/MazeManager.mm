//
//  MazeManager.m
//  CCC_physics
//
//  Created by Xu Rui on 30/11/13.
//
//

#import "MazeManager.h"
#import "Defines.h"

@implementation MazeManager{
   // NSArray * _levels;
    int currentMapID;
}

@synthesize currentMazeID;

+ (MazeManager *)sharedInstance {
    static dispatch_once_t once;
    static MazeManager * sharedInstance; dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    if ((self = [super init])) {
        currentMapID = 0;
//        currentMazeID = 1;
    }
    return self;
}

- (CCTMXTiledMap*) getMapWithID: (int) mapID {
    if (mapID == KL_MAZE_ID) {
<<<<<<< HEAD:CCC_physics/Mazes/MazeManager.mm
        return [[[CCTMXTiledMap alloc] initWithTMXFile:@"test_map.tmx"] autorelease];
=======
        return [[CCTMXTiledMap alloc] initWithTMXFile:@"kangarooMaze1.tmx"];
>>>>>>> 960f5ab1aeb5d1ec1f6186d64af871bcfbf601e9:CCC_physics/Mazes/MazeManager.mm
    }
    if (mapID == GECKO_MAZE_ID) {
        return [[CCTMXTiledMap alloc] initWithTMXFile:@"gecko.tmx"];
    }
    if (mapID == MAIN_ONE_ID) {
        return [[[CCTMXTiledMap alloc] initWithTMXFile:@"test_map.tmx"] autorelease];
    }
    else {
        return nil;
    }
}

- (int) currentMapID{
    return currentMapID;
}


- (void)dealloc {
    //[_levels release];
   // _levels = nil;
    [super dealloc];
}

@end
