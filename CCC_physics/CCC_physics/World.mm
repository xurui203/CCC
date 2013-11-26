//
//  World.mm
//  CCC_physics
//
//  Created by Ann Niou on 11/26/13.
//
//


#import "World.h"

static World *sharedMyWorld = nil;

@implementation World

@synthesize CCCplayer;

#pragma mark Singleton Methods

+(id) sharedWorld {
    @synchronized(self) {
        if(sharedMyWorld == nil)
            sharedMyWorld = [[super allocWithZone:NULL] init];
    }
    return sharedMyWorld;
}

- (id)init {
    if (self = [super init]) {
        
        
        //INIT CAPTAIN
        CCCplayer = [Captain spriteWithSpriteFrameName:@"Lat Capt Human-Standing001.png"];
        
    
    }
    return self;
}


+ (id)allocWithZone:(NSZone *)zone {
    return [[self sharedMyWorld] retain];
}
- (id)copyWithZone:(NSZone *)zone {
    return self;
}
- (id)retain {
    return self;
}
- (unsigned)retainCount {
    return UINT_MAX; //denotes an object that cannot be released
}
- (oneway void)release {
    // never release
}
- (id)autorelease {
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
    [CCCplayer release];
    [super dealloc];
}


@end
