//
//  HelloWorldLayer.h
//  ActionSprite
//
//  Created by Randall Nickerson on 2/2/13.
//  Copyright Threadbare Games 2013. All rights reserved.
//


#import <GameKit/GameKit.h>
#import "cocos2d.h"
#import "ActionSprite.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    CGSize winSize;
    CGPoint centerScreen;
    ActionSprite* actionSprite;
    CCLabelTTF *label;
    int actionCounter;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
