//
//  IconDrawer.m
//  CCC_physics
//
//  Created by Ann Niou on 11/16/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "IconDrawer.h"


@implementation IconDrawer

@synthesize menu, menu2;
@synthesize iconDrawerImage;

-(id)init {
    if ((self = [super init])) {
        
        //        ADD ICON DRAWER
        
        iconDrawerImage = [CCMenuItemImage itemFromNormalImage:@"Icon Drawer.png" selectedImage:@"Icon Drawer.png" target:self selector:@selector(pressed:)];
        iconDrawerImage.scale = .5;
        menu = [CCMenu menuWithItems:iconDrawerImage, nil];
        [self addChild:menu z:90];
        CCLOG(@"added iconDrawer");
        menu.position = ccp(300, 340);
        //        [self initMenu];
        open = NO;
        
    }
    
    return self;
}

-(void) pressed:(id)sender {
    if (open == YES) {
        
        [menu runAction:
         
         [CCSequence actions:
          [CCSpawn actions:
           [CCMoveBy actionWithDuration:1.0f position:ccp(0, 70)], nil],
          [CCCallFunc actionWithTarget:self selector:@selector(makeVisible)],
          nil]
         ];
        
        open = NO;
    }
    else if (open == NO) {
        
        
        [menu runAction:
         
         [CCSequence actions:
          [CCSpawn actions:
           [CCMoveBy actionWithDuration:1.0f position:ccp(0, -70)], nil],
          [CCCallFunc actionWithTarget:self selector:@selector(makeVisible)],
          nil]
         ];
        open = YES;
    }
    
    CCLOG(@"ICON DRAWER PRESSED");
}



-(void) makeVisible {
    if (menu2.visible == YES) {
        menu2.visible = NO;
    } else if (menu2.visible ==NO) {
        menu2.visible = YES;
    }
    
}

//ICONS IN DRAWER
-(void) initMenu: (Superpower*) sp {
    //eventually have a for loop to loop through the icons
    CCMenuItem *icon = [CCMenuItemImage
                        itemFromNormalImage:sp.icon
                        selectedImage:sp.icon
                        target:self selector:@selector(iconButtonTapped: sp:)];
    menu2= [CCMenu menuWithItems:icon, nil];
    menu2.position = ccp(400, 285);
    [self addChild: menu2 z:100];
    menu2.visible = NO;
}

-(Superpower *) iconButtonTapped:(id) sender
                       withPower: (Superpower *) sp
{
    NSLog(@"%@ selected", sp.name);
    return sp;
}




@end
