//
//  DASharedDataClass.m
//  DrwApp
//
//  Created by Presley on 27/05/15.
//  Copyright (c) 2015 Double Apps Inc. All rights reserved.
//

#import "DASharedDataClass.h"

@implementation DASharedDataClass



#pragma mark Singleton Implementation
static DASharedDataClass *BrushDetailsObject;

+ (DASharedDataClass*)sharedInstance
{
    if (BrushDetailsObject == nil) {
        BrushDetailsObject = [[super allocWithZone:NULL] init];
    }
    return BrushDetailsObject;
}

#pragma mark Shared Public Methods
+(int)getTransparency{
    // Ensure we are using the shared instance
    DASharedDataClass *shared = [DASharedDataClass sharedInstance];
    return shared.brushTransparency;
}

+(int)getBrushSize{
    // Ensure we are using the shared instance
    DASharedDataClass *shared = [DASharedDataClass sharedInstance];
    return shared.brushSizeValue;
}

+(void) setBrushDetails:(int)brushSizeValue  brushTransparency:(int)brushTransparencyValue{
    // Ensure we are using the shared instance
    DASharedDataClass *shared = [DASharedDataClass sharedInstance];
    shared.brushSizeValue = brushSizeValue;
    shared.brushTransparency = brushTransparencyValue;
}

+(void) setBrushSize:(int)BrushSize{
    // Ensure we are using the shared instance
    DASharedDataClass *shared = [DASharedDataClass sharedInstance];
   // shared.brushSizeValue = &(BrushSize);
    shared.brushSizeValue = BrushSize;
}

+(void) setBrushTransparency:(int)BrushTransparency{
    // Ensure we are using the shared instance
    DASharedDataClass *shared = [DASharedDataClass sharedInstance];
   shared.brushTransparency = BrushTransparency;
}

@end
