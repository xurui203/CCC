//
//  LearningModuleLayer.mm
//  CCC_physics
//
//  Created by Ann Niou on 11/20/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "LearningModuleLayer.h"


@implementation LearningModuleLayer
-(id) init {
     if ((self = [super init])) {
         
         // Determine Device
//         self.iPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
         
         // Determine Screen Size
         CGSize screenSize = [CCDirector sharedDirector].winSize;
         
         // Calculate Large Font Size
         int largeFont = screenSize.height / 9;
         
         // Create a label
         CCLabelTTF *label = [CCLabelTTF labelWithString:@"Learning Module"
                                                fontName:@"Marker Felt"
                                                fontSize:largeFont];
         // Center label
         label.position = ccp( screenSize.width/2, screenSize.height/2);
         //        IconDrawer *
         // Add label to this scene
         		[self addChild:label z:0];
     }
    return self;
}


+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
    
	// 'layer' is an autorelease object.
	LearningModuleLayer   *layer = [LearningModuleLayer node];
    
	// add layer as a child to scene
	[scene addChild: layer];
    
	// return the scene
	return scene;
}



@end
