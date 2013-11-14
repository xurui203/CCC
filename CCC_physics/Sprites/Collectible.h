//
//  Collectible.h
//  CCC_physics
//
//  Created by Ann Niou on 11/14/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameObject.h"

@interface Collectible : GameObject {
@protected
    bool consumed;
}
-(void)consume;

@end
