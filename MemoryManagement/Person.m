//
//  Person.m
//  iOS9-MemoryManagement
//
//  Created by Paul Solt on 11/13/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import "Person.h"
#import "Car.h"
#import "LSILog.h"

@implementation Person

- (instancetype)initWithCar:(Car *)car
{
    self = [super init];
    if (self) {
        _car = [car retain]; // Retain count: +1
        NSLog(@"-[Person init]: %@", _car);
        // TODO: Implement initWithCar with MRC
        
    }
    return self;
}

- (void)dealloc
{
    // TODO: Implement dealloc with MRC (order is important)
    
    NSLog(@"-[Person dealloc]: %@", _car);
    
    [_car release]; // Retain count -1
    
    [super dealloc];
}

// TODO: Implement setCar with MRC
- (void)setCar:(Car *)car
{
    
    if (_car != car) {
        [_car release]; // Release the honda civic
          
          
        _car = [car retain];// Hold onto hummer
    }
    
  
}

@end
