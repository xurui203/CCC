//
//  World.mm
//  CCC_physics
//
//  Created by Ann Niou on 11/26/13.
//
//
//now you can call things like myworld.player.health etc. and it will be the same for all

#import "World.h"

static World *sharedMyWorld = nil;

@implementation World

@synthesize CCCplayer, currentLevel;

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
        CCCplayer = [[Captain alloc] initWithFile:@"Lat Capt Human-Standing0001.png"];
        CCLOG(@"world inits captain");
//        currentLevel = 1;
        NSLog(@"%@", CCCplayer.currentSuperpower);
    }
    return self;
}


+ (id)allocWithZone:(NSZone *)zone {
    return [[self sharedWorld] retain];
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
