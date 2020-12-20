//
//  FlockOfBirds.m
//  BirdFlockNoARC
//
//  Created by Роман Колосов on 20.12.2020.
//

#import "FlockOfBirds.h"
#import "BirdLeader.h"
#import "Bird.h"

@implementation FlockOfBirds

// MARK: Initializer

- (instancetype)init {
    if (self = [super init]) {
        NSLog(@"Flock created");
    }
    return self;
}

// MARK: - Dealloc

- (void)dealloc {
    NSLog(@"Flock deallocated");
    _birdLeader = nil;
    _birds = nil;
    [super dealloc];
}

// MARK: - Configure

- (void)configureWithBirdLeader:(BirdLeader *)birdLeader andBirds:(NSArray<Bird *> *)birds {
    [birdLeader retain];
    [_birdLeader release];
    _birdLeader = birdLeader;
    NSLog(@"Add leader %@ to the flock", _birdLeader.leader);

    NSArray *copy = [birds copy];
    [_birds release];
    _birds = copy;
    for (Bird *bird in _birds) {
        NSLog(@"Add bird %@ to the flock", bird.number);
    }
}

@end
