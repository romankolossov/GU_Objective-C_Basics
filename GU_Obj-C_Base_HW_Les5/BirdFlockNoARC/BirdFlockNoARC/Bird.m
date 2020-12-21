//
//  Bird.m
//  BirdFlockNoARCAutoRelPool
//
//  Created by Роман Колосов on 21.12.2020.
//

#import "Bird.h"

@implementation Bird

// MARK: - Initializer

- (instancetype)initWithNumber:(NSNumber *)number {
    if (self = [super init]) {
        _number = [number retain];
        NSLog(@"Bird %@ created", _number);
    }
    return self;
}

// MARK: - Dealloc

- (void)dealloc {
    NSLog(@"Bird %@ deallocated", _number);
    [_number release];
    [super dealloc];
}

@end
