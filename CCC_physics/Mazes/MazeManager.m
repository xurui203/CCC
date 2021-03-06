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

}
@synthesize currentMapID;


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

-(int) nextLevel {
    currentMapID ++;
    return currentMapID;
}

- (CCTMXTiledMap*) getMapWithID: (int) mapID {
    if (mapID == KL_MAZE_ID) {
        return [[[CCTMXTiledMap alloc] initWithTMXFile:@"kangarooPractice.tmx"] autorelease];
    }
    if (mapID == GECKO_MAZE_ID) {
        return [[[CCTMXTiledMap alloc] initWithTMXFile:@"geckoPractice.tmx"] autorelease];
    }
    if (mapID == RAM_MAZE_ID) {
        return [[[CCTMXTiledMap alloc] initWithTMXFile:@"ramPractice.tmx"] autorelease];
    }
    if (mapID == MAIN_ONE_ID) {
        return [[[CCTMXTiledMap alloc] initWithTMXFile:@"mainMazeRam.tmx"] autorelease];
    }
    
    if (mapID == MAIN_TWO_ID) {
        return [[[CCTMXTiledMap alloc] initWithTMXFile:@"mainMaze2.tmx"] autorelease];
    }
    
    if (mapID == CAPTAIN_MAZE_ID) {
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
