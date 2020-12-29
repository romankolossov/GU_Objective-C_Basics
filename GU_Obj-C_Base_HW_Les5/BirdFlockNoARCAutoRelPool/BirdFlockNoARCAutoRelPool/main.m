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
    NSAutoreleasePool *pool;
    pool = [NSAutoreleasePool new];
    
    // Initialising
    FlockOfBirds *flockOfBirds = [[FlockOfBirds alloc] init];
    [flockOfBirds autorelease];
    
    Bird *bird1 = [[Bird alloc] initWithNumber:@1];
    Bird *bird2 = [[Bird alloc] initWithNumber:@2];
    Bird *bird3 = [[Bird alloc] initWithNumber:@3];
    Bird *bird4 = [[Bird alloc] initWithNumber:@4];
    Bird *bird5 = [[Bird alloc] initWithNumber:@5];
    Bird *bird6 = [[Bird alloc] initWithNumber:@6];
    [bird1 autorelease];
    [bird2 autorelease];
    [bird3 autorelease];
    [bird4 autorelease];
    [bird5 autorelease];
    [bird6 autorelease];
    
    NSArray *birds = [[NSArray alloc] initWithObjects:bird1, bird2, bird3, bird4, bird5, bird6, nil];
    [birds autorelease];
    
    // Initialising
    NSMutableString *leader = [@"Super Leader" mutableCopy];
    BirdLeader *birdLeader = [[BirdLeader alloc] initWithLeader: leader];
    [birdLeader autorelease];
    
    // shows difference between copy and no copy in class BirdLeader
    [leader replaceOccurrencesOfString:@"Super" withString:@"Ultimate" options:0 range:NSMakeRange(0, leader.length)];
    
    // Configure
    [flockOfBirds configureWithBirdLeader: birdLeader andBirds: birds];
    
    NSLog(@"Flock of birds is ready");
    
    [pool release];
    
    return 0;
}
