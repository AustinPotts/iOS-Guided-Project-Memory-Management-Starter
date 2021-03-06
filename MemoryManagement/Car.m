//
//  Car.m
//  iOS9-MemoryManagement
//
//  Created by Paul Solt on 11/13/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import "Car.h"
#import "LSILog.h"

@implementation Car

- (instancetype)initWithMake:(NSString *)make
{
    self = [super init];
    if (self) {
        NSLog(@"-[Car init]: %@", make);
        _make = [make copy]; // retain: +1
    }
    return self;
}

// TODO: Implement autoreleased class car method


- (void)dealloc
{
    NSLog(@"-[Car dealloc]: %@", self);
    // TODO: Implement dealloc with MRC
     
    [_make release]; // We have to subtract one retain: -1
    _make = nil;
    
    [super dealloc];
}

- (NSString *)description
{
    // TODO: Implement a standard autoreleasing method.
   // NSString *description = [[[NSString alloc] initWithFormat:@"Car: %@", self.make] autorelease];
    return [[[NSString alloc] initWithFormat:@"Car: %@", self.make] autorelease];
}

@end
