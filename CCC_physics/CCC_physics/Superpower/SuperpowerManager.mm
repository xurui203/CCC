//
//  SuperpowerManager.m
//  CCC_physics
//
//  Created by Xu Rui on 14/11/13.
//
//

#import "SuperpowerManager.h"
@class Player;
@implementation SuperpowerManager
//
@synthesize superpowers, currentSuperPower, iconDrawer, initiatedSPs, iconsArrayCopy;

-(id) init {
    if ([super init]) {
        //add new superpower classes to this array
        superpowers = [[NSMutableArray alloc] initWithObjects: @"CaptainSP", @"Kangaroo", nil];

        
        int spNum = 3;
        initiatedSPs = [[NSMutableArray alloc] initWithCapacity:spNum];
        [self addSPs];
    }
    
    return self;
}


-(void) addSPs
{
    // create the Player object
    Superpower* o = nullptr;
    if (superpowers != nil) {
        CCLOG(@"not nil");
        NSLog(@"array: %@", superpowers);
    }
    for (int x=0; x< 2; x++) {

        //initialize an instance of the selected superpower class
        CCLOG([superpowers objectAtIndex:x]);
        
        NSString *tempClassName = [superpowers objectAtIndex:x];
        o = [[NSClassFromString(tempClassName) alloc] init];
        [initiatedSPs addObject:o];
    }
    
    if( o != nullptr )
    {
        //    o->addBodyToWorld(this->world);
        //    self->addChild(o);
    }
    
    
    //initialize icon drawer
    
    iconDrawer = [[IconDrawer alloc] init];
    [iconDrawer initMenu:initiatedSPs];
    
    iconsArrayCopy = [iconDrawer getIconsArray];
//    return o;
}

-(CCMenu *) getIconsMenu {
    return [iconDrawer getIconsMenu];
}

@end
