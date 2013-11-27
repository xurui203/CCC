//
//  IconDrawer.m
//  CCC_physics
//
//  Created by Ann Niou on 11/16/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "IconDrawer.h"


@implementation IconDrawer

@synthesize BGmenu, spIconMenu, SPMutableArray, iconsArray, LMiconsArray, LMspIconMenu;
@synthesize iconDrawerImage;


-(id) init {
    if ((self = [super init])) {
    }
        return self;
}
-(void)initDrawer {
    
        spIconMenu.visible = NO;
        //        ADD ICON DRAWER
        
        iconDrawerImage = [CCMenuItemImage itemFromNormalImage:@"Icon Drawer.png" selectedImage:@"Icon Drawer.png" target:self selector:@selector(pressed:)];
        iconDrawerImage.scale = .5;
        BGmenu = [CCMenu menuWithItems:iconDrawerImage, nil];
        [self addChild:BGmenu z:0];
        CCLOG(@"added iconDrawer");
        BGmenu.position = ccp(300, 340);
        open = NO;
    BGmenu.zOrder = 5;
    
    
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
                    [CCCallFunc actionWithTarget:self selector:@selector(makeVisible)],
           [CCMoveBy actionWithDuration:1.0f position:ccp(0, -70)], nil],
 
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

- (CCMenu *) initMenu:(NSMutableArray *) SParray{
    //create an empty menu
    spIconMenu = [CCMenu menuWithItems:nil];
    iconsArray = [[NSMutableArray alloc] initWithCapacity:SParray.count];
    
    //add to scene
//    [self addChild:spIconMenu];
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
        [spIconMenu addChild:item];
        spIconMenu.scale = .3;
        //add menu item to icons array
        [iconsArray addObject:item];

    }
    [spIconMenu alignItemsHorizontallyWithPadding:3.0];

  
    return spIconMenu;
    
}

- (CCMenu *) initLMMenu:(NSMutableArray *) SParray{
    //create an empty menu
    LMspIconMenu = [CCMenu menuWithItems:nil];
    LMiconsArray = [[NSMutableArray alloc] initWithCapacity:SParray.count];
    
    //add to scene
    //    [self addChild:spIconMenu];
    CCLOG(@"%d", SParray.count);
    //go through every superpower instance variable in the initialized array and add its icon to the menu
    for(int i = 0; i < SParray.count; i++)
    {
        Superpower *sp = [SParray objectAtIndex: i];
        
        CCMenuItemFont *item = [CCMenuItemImage
                                itemFromNormalImage:sp.icon
                                selectedImage:sp.icon
                                disabledImage:sp.disabledIconImage
                                target:self selector:@selector(LMiconButtonTapped:)];
        item.userData = sp;
        //make item enabled or disabled based on whether or not it is locked
        if (sp.isLocked) {
            item.isEnabled = NO;
        } else if (sp.isLocked == NO) {
            item.isEnabled = YES;
        }
        [LMspIconMenu addChild:item];
        LMspIconMenu.scale = .3;
        //add menu item to icons array
        [LMiconsArray addObject:item];
        CCLOG(@"here in lmmenuinit");
    }
    [LMspIconMenu alignItemsHorizontallyWithPadding:3.0];
    CCLOG(@"init LMMenu finished");
    
    return LMspIconMenu;
    
}


-(void) LMiconButtonTapped:(CCMenuItemImage *) sender
{
    
    CCLOG(@"superpower icon pressed");
    CCMenuItemFont *itm = (CCMenuItemFont *)sender;
    Superpower *s =  (Superpower *)itm.userData;
    CCLOG(@"%@", s.name);
    NSString *movieName = s.LMVideo;
//        LMScene = [[LearningModuleScene alloc] initWithMovie:movieName];
    [SceneManager goLearningModuleScene:movieName];
    
}

-(void) iconButtonTapped:(CCMenuItemFont *) sender
{
    
    CCLOG(@"superpower icon pressed");
    CCMenuItemFont *itm = (CCMenuItemFont *)sender;
       Superpower *s =  (Superpower *)itm.userData;
    [[[World sharedWorld] CCCplayer] transform: s];
    
}


-(void) updateIcons: (NSArray *)spArray {
    for (int x=0; x<spArray.count ; x++) {
        
    }
}

@end
