//
//  IconDrawer.m
//  CCC_physics
//
//  Created by Ann Niou on 11/16/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "IconDrawer.h"


@implementation IconDrawer

@synthesize BGmenu, spIconMenu, SPMutableArray, iconsArray;
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
//

//ICONS IN DRAWER

-(NSMutableArray *) getIconsArray {
    return iconsArray;
}

-(void) initMenu:(NSMutableArray *) SParray {
    //create an empty menu
    spIconMenu = [CCMenu menuWithItems:nil];
    iconsArray = [[NSMutableArray alloc] initWithCapacity:SParray.count];
    
    //add to scene
    [self addChild:spIconMenu];
    CCLOG(@"%d", SParray.count);
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
        item.zOrder = 100000;
        [spIconMenu addChild:item];
        
        //add menu item to icons array
        [iconsArray addObject:item];

    }
    [spIconMenu alignItemsHorizontallyWithPadding:3.0];
    spIconMenu.position = ccp(200, 185);
    spIconMenu.zOrder = 5000;
   //    [self addChild: spIconMenu z:100];
        spIconMenu.visible = YES;
    
    
}

- (CCMenu*) getIconsMenu {
    return spIconMenu;
}


//-(id)init {
//    if ((self = [super init])) {
//        //        _dPad = [DirectionPad dPadWithFile:@"pd_dpad.png" radius:500];
//
//        
//        //        ADD ENERGY BAR
//        iconDrawer = [CCSprite spriteWithFile:@"Icon Drawer.png"];
//        [self addChild:iconDrawer];
//        CCLOG(@"added icon Drawer");
//        iconDrawer.position = ccp(350,240);
//        iconDrawer.scale = .5;
//        
//        open = NO;
//       
//    }
//    return self;
//}
//-(void) addSuperpowersToDrawer: (NSMutableArray *)SPArray {
//    int posX = 100;
//    int posY = 100;
//    iconsArray = [[NSMutableArray alloc] initWithCapacity:SPArray.count];
//    CCLOG(@"%d", SPArray.count);
//    for(int i = 0; i < SPArray.count; i++)
//            {
//                CCSprite *icon;
//                Superpower *sp = [SPArray objectAtIndex: i];
//                if (sp.isLocked == YES) {
//                    NSString *iconStr = sp.icon;
//                    icon = [[CCSprite alloc] initWithFile:@"Kangaroo Icon.png"];
//                    CCLOG(@"width: %f, Height: %f", icon.contentSize.width, icon.contentSize.height);
//                }
//                else if (sp.isLocked == NO) {
//                    NSString *iconStr = sp.icon;
//                    icon = [[CCSprite alloc] initWithFile:@"CCC icon.png"];
//
//                    CCLOG(@"width: %f, Height: %f", icon.contentSize.width, icon.contentSize.height);
//
//                }
//                icon.position = ccp(posX, posY);
//                [self addChild:icon];
//                [iconsArray addObject:icon];
//                posX += 15;
//}
//}

-(void) clickDrawer{
    if (open == YES) {
        
        [iconDrawer runAction:
         
         [CCSequence actions:
          [CCSpawn actions:
           [CCMoveBy actionWithDuration:1.0f position:ccp(0, 70)], nil],
          nil]
         ];
        
        open = NO;
    }
    else if (open == NO) {
        
        
        [iconDrawer runAction:
         
         [CCSequence actions:
          [CCSpawn actions:
           [CCMoveBy actionWithDuration:1.0f position:ccp(0, -70)], nil],
          nil]
         ];
        open = YES;
    }
    
    CCLOG(@"ICON DRAWER PRESSED");
}

-(Superpower *) iconButtonTapped:(id) sender
{

//    CCMenuItemFont *itm = (CCMenuItemFont *)sender;
//       Superpower *s =  (Superpower *)itm.userData;
//    [captain transform: s];
    
}


-(void) updateIcons: (NSArray *)spArray {
    for (int x=0; x<spArray.count ; x++) {
        
    }
}

@end
