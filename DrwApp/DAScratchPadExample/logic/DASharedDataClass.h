//
//  DASharedDataClass.h
//  DrwApp
//
//  Created by Presley on 27/05/15.
//  Copyright (c) 2015 Double Apps Inc. All rights reserved.
//https://github.com/JAgostoni/iOS-Best-Practices/blob/master/BigBallOfMud/BigBallOfMud/SingletonSample.h

#import <Foundation/Foundation.h>

@interface DASharedDataClass : NSObject {
    
    int brushSizeValue;
    int brushTransparency;
    BOOL isNewlyLoaded;
}

@property(nonatomic) int  brushSizeValue;
@property(nonatomic) int  brushTransparency;
@property(nonatomic) BOOL isNewlyLoaded;


+(DASharedDataClass *) SharedInstance;

+(int) getTransparency;
+(int) getBrushSize;
+(void) setBrushDetails:(int)brushSizeValue  brushTransparency:(int)brushTransparencyValue;
+(void) setBrushSize:(int)BrushSize;
+(void) setBrushTransparency:(int)BrushTransparency;
+(void) setIsNewlyLoaded:(BOOL)isNewlyLoadedYESNO;
+(BOOL) getNewlyLoadedYESNO;
@end
