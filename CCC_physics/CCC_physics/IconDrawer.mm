//
//  IconDrawer.m
//  CCC_physics
//
//  Created by Ann Niou on 11/16/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "IconDrawer.h"


@implementation IconDrawer

@synthesize BGmenu, spIconMenu;
@synthesize iconDrawerImage;

-(id)init {
    if ((self = [super init])) {
        
        //        ADD ICON DRAWER
        
        iconDrawerImage = [CCMenuItemImage itemFromNormalImage:@"Icon Drawer.png" selectedImage:@"Icon Drawer.png" target:self selector:@selector(pressed:)];
        iconDrawerImage.scale = .5;
        BGmenu = [CCMenu menuWithItems:iconDrawerImage, nil];
        [self addChild:BGmenu z:90];
        CCLOG(@"added iconDrawer");
        BGmenu.position = ccp(300, 340);
//                [self initMenu];
        open = NO;
       
        
    }
    
    return self;
}

-(void) pressed:(id)sender {
    if (open == YES) {
        
        [BGmenu runAction:
         
         [CCSequence actions:
          [CCSpawn actions:
           [CCMoveBy actionWithDuration:1.0f position:ccp(0, 70)], nil],
          [CCCallFunc actionWithTarget:self selector:@selector(makeVisible)],
          nil]
         ];
        
        open = NO;
    }
    else if (open == NO) {
        
        
        [BGmenu runAction:
         
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
    if (spIconMenu.visible == YES) {
        spIconMenu.visible = NO;
    } else if (spIconMenu.visible ==NO) {
        spIconMenu.visible = YES;
    }
    
}

//ICONS IN DRAWER



-(void) initMenu:(NSMutableArray *) SParray {
    //create an empty menu
    spIconMenu = [CCMenu menuWithItems:nil];
    
    //add to scene
    [self addChild:spIconMenu];
    
    //go through every superpower instance variable in the initialized array and add its icon to the menu
    for(int i = 0; i < SParray.count; i++)
    {
        Superpower *sp = [SParray objectAtIndex: i];
        
        CCMenuItemFont *item = [CCMenuItemImage
                                itemFromNormalImage:sp.icon
                                selectedImage:sp.icon
                                disabledImage:sp.disabledIconImage
                                target:self selector:@selector(iconButtonTapped:)];
        item.userData = sp;
       //make item enabled or disabled based on whether or not it is locked
        if (sp.isLocked) {
            item.isEnabled = NO;
        } else if (sp.isLocked == NO) {
            item.isEnabled = YES;
        }
        
        [spIconMenu addChild:item];
    }
//    CCLOG(spIconMenu.);
    [spIconMenu alignItemsHorizontallyWithPadding:3.0];
    spIconMenu.position = ccp(300, 185);
    spIconMenu.zOrder = 5000;
//    [self addChild: spIconMenu z:100];
        spIconMenu.visible = NO;
}

-(Superpower *) iconButtonTapped:(id) sender
{
//    NSLog(@"%@ selected", sp.name);
//    return sp;
    //
    CCMenuItemFont *itm = (CCMenuItemFont *)sender;
       Superpower *s =  (Superpower *)itm.userData;
    [captain transform: s];
    
    
}


-(void) updateIcons: (NSArray *)spArray {
    for (int x=0; x<spArray.count ; x++) {
        
    }
}

@end
