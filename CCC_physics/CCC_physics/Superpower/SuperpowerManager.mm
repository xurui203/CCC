//
//  SuperpowerManager.m
//  CCC_physics
//
//  Created by Xu Rui on 14/11/13.
//
// Singleton class to be shared amongst game scenes and learning modules.


#import "SuperpowerManager.h"
@class Player;

static SuperpowerManager *sharedMyManager = nil;

@implementation SuperpowerManager
//
@synthesize superpowers, currentSuperPower, iconDrawer, initiatedSPs, iconsArrayCopy;

+ (id)sharedManager {
    @synchronized(self) {
        if(sharedMyManager == nil)
            sharedMyManager = [[super allocWithZone:NULL] init];
    }
    return sharedMyManager;

}


-(id) init {
    if (self =[super init]) {
        //add new superpower classes to this array
        superpowers = [[NSMutableArray alloc] initWithObjects: @"CaptainSP", @"Kangaroo", @"Gecko", @"Ram", nil];
        int spNum = superpowers.count;
        initiatedSPs = [[NSMutableArray alloc] initWithCapacity:spNum];
        [self addSPs];
    }
    
    return self;
}
-(void)humanButtonTapped:(id) sender{
    NSLog(@"kangaroo selected");
    //Superpower *power = [Superpower init];
    //    _human.superPowerAction = power.superpowerAction;
//    CaptainSP *captainSP = [[CaptainSP alloc] init];
//    [_mazeLayer.getPlayer transform: captainSP];
}


-(void) addSPs
{
    CCLOG(@"adding instantiated superpowers to array");
    // create the Player object
    
    if (superpowers != nil) {
        CCLOG(@"not nil");
        NSLog(@"array: %@", superpowers);
    }
    for (int x=0; x< superpowers.count; x++) {

        //initialize an instance of the selected superpower class
        CCLOG([superpowers objectAtIndex:x]);
        
        NSString *tempClassName = [superpowers objectAtIndex:x];
        CCLOG(@"tempClassName = %@", tempClassName);
       Superpower* o = [[NSClassFromString(tempClassName) alloc] init];
        [initiatedSPs addObject:o];
//        CCLOG(@"%d", initiatedSPs.count);
    }
//    
//    if( o != nullptr )
//    {
//        //    o->addBodyToWorld(this->world);
//        //    self->addChild(o);
//    }
    
    
    //initialize icon drawer
    
}

-(CCMenu *) getIconsMenu {
    return [iconDrawer getIconsMenu];
}

+ (id)allocWithZone:(NSZone *)zone {
    return [[self sharedManager] retain];
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
    [superpowers release];
    [currentSuperPower release];
    [iconDrawer release];
    [initiatedSPs release];

    [iconsArrayCopy release];

    [super dealloc];
}

@end
