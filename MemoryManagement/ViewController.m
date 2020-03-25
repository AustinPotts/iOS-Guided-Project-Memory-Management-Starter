//
//  ViewController.m
//  MemoryManagement
//
//  Created by Paul Solt on 1/29/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import "Person.h"
#import "LSILog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //  Disable ARC in settings
    
   // Manual Reference Counting
    NSString *name = [[NSString alloc] initWithString:@"Austin"]; //Retain 1
    NSLog(@"Name: %@", name);
    
    NSString *alias = [name retain]; // retain: 2
    NSLog(@"Alias: %@", alias);
    
    
    [alias release];
    alias = nil;
    
    
    [name release]; // Retain: 0 (memory is freed, and another object can use it)
    name = nil; // Prevents you from accidentally using an object after its been cleaned up
    
    
//    NSArray *array2 = [NSArray arrayWithObjects:@1, @1, nil];
//
    NSString *path = @"aaa/ggg/gggg";
    NSString *subpath = [path stringByDeletingLastPathComponent]; //auto release
    NSLog(@"subpath: %@", subpath);
    
    Car *audi = [[Car alloc] initWithMake:@"A4"]; // car retain: 1
    Person *person = [[Person alloc] initWithCar:audi]; // person ratain: 1, car retain: 2
    
    [audi release]; // transofrming ownership car 1
    audi = nil;
    
    // Hand off ownership
    //1. releasing after passing the data
    //2. use autorelease object
    
    //MARK: - AUTORELEASE + MANUAL
    
    // Use Autorelease
//    Car *hummer = [[[Car alloc] initWithMake:@"H2"] autorelease];
//    person.car = hummer;
    
    // Use manual release after Setting
    Car *hummer = [[Car alloc] initWithMake:@"H2"]; // hummer: 1 +1
    person.car = hummer;
    [hummer release];
    hummer = nil; // PROTECTION Prevent a dangling hanger
    
    // Potenital problem with self assigment
    person.car = hummer;
    
    //Release after setting
    
    // Clean up the memory 
    [person release];
    person = nil;
    
    
    // Is the object autoreleased? Why?
    NSString *name2 = [NSString stringWithFormat:@"%@ %@", @"John", @"Miller"];
    // yes
    
    NSDate *today = [NSDate date];
    // yes
    
    
    NSDate *now = [NSDate new];
    // no
    
    NSDate *tomorrow2 = [NSDate dateWithTimeIntervalSinceNow:60*60*24];
    // yes
    
    NSDate *nextTomorrow = [tomorrow2 copy];
    // no
    
    NSArray *words = [@"This sentence is the bomb" componentsSeparatedByString:@" "];
    // yes
    
    NSString *idea = [[NSString alloc] initWithString:@"Hello Ideas"];
   // no
    
    Car *redCar = [Car car];
   // yes
    
    NSString *idea2 = [[[NSString alloc] initWithString:@"Hello Ideas"] autorelease];
    // yes
    
    NSString *idea3 = [[NSString alloc] initWithString:@"Hello Ideas"];
    // no at this point (if you put logic here) ITS BETTER TO HAVE IT CHAINED
    [idea3 autorelease];
    // yes at this point
    
    
}


@end
