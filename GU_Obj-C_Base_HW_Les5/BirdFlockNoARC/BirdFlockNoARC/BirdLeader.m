//
//  BirdLeader.m
//  BirdFlockNoARCAutoRelPool
//
//  Created by Роман Колосов on 21.12.2020.
//

#import "BirdLeader.h"

@implementation BirdLeader

// MARK: - Initializer

- (instancetype)initWithLeader:(NSString *)leader {
    self = [super init];
    if (self) {
        // copy case
        _leader = [leader copy];
        
        // no copy case
        // [leader retain];
        // [_leader release];
        // _leader = leader;
        
        NSLog(@"Bird leader created with name %@", _leader);
    }
    return self;
}

// MARK: - Dealoc

- (void)dealloc {
    NSLog(@"Dealloc leader with name %@", _leader);
    _leader = nil;
    [super dealloc];
}

@end
