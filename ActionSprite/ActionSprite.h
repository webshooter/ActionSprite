//
//  ActionSprite.h
//  ActionSprite
//
//  Created by Randall Nickerson on 2/2/13.
//  Copyright (c) 2013 Threadbare Games. All rights reserved.
//

#import "CCSprite.h"

@interface ActionSprite : CCSprite
{
    NSMutableArray* actionQueue;
    ccTime interval;
}

/* PROPERTIES */


/* METHODS */
-(id)initWithFile:(NSString *)filename;
-(void)addAction:(CCAction*)action;
-(void)setInterval:(ccTime)time;
-(ccTime)getInterval;
-(int)getQuequeActionCount;
-(void)addImediateAction:(CCAction*)action;

@end
