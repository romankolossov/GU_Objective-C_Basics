//
//  BirdLeader.m
//  BirdFlockNoARC
//
//  Created by Роман Колосов on 20.12.2020.
//

#import "BirdLeader.h"

@implementation BirdLeader

// MARK: - Initializer

- (instancetype)initWithLeader:(NSString *)leader {
    self = [super init];
    if (self) {
        _leader = [leader copy];
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
