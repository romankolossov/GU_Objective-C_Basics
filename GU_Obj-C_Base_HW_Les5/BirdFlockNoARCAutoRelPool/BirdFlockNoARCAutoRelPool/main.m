//
//  main.m
//  BirdFlockNoARCAutoRelPool
//
//  Created by Роман Колосов on 21.12.2020.
//

#import <Foundation/Foundation.h>

#import "BirdLeader.h"
#import "Bird.h"
#import "FlockOfBirds.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Initialising
        FlockOfBirds *flockOfBirds = [[FlockOfBirds alloc] init];

        Bird *bird1 = [[Bird alloc] initWithNumber:@1];
        Bird *bird2 = [[Bird alloc] initWithNumber:@2];
        Bird *bird3 = [[Bird alloc] initWithNumber:@3];
        Bird *bird4 = [[Bird alloc] initWithNumber:@4];
        Bird *bird5 = [[Bird alloc] initWithNumber:@5];
        Bird *bird6 = [[Bird alloc] initWithNumber:@6];
        
        NSArray *birds = [[NSArray alloc] initWithObjects:bird1, bird2, bird3, bird4, bird5, bird6, nil];
        [bird1 release];
        [bird2 release];
        [bird3 release];
        [bird4 release];
        [bird5 release];
        [bird6 release];
        
        // Initialising
        NSMutableString *leader = [@"Super Leader" mutableCopy];
        BirdLeader *birdLeader = [[BirdLeader alloc] initWithLeader: leader];
        
        // shows difference between copy and no copy in class BirdLeader
        [leader replaceOccurrencesOfString:@"Super" withString:@"Ultimate" options:0 range:NSMakeRange(0, leader.length)];
        
        // Configure
        [flockOfBirds configureWithBirdLeader: birdLeader andBirds: birds];
        [birdLeader release];
        [birds release];

        NSLog(@"Flock of birds is ready");

        [flockOfBirds release];
    }
    return 0;
}
