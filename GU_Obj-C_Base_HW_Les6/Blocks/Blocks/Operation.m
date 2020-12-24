//
//  Operation.m
//  Blocks
//
//  Created by Роман Колосов on 24.12.2020.
//

#import "Operation.h"

@implementation Operation

- (void)start {
    NSLog(@"Operation started");
}

- (void)main {
    NSLog(@"Result");
}

- (BOOL)isCancelled {
    NSLog(@"isCancelled");
    return [super isCancelled];
}

- (BOOL)isFinished {
    NSLog(@"isFinished");
    return [super isFinished];
}

- (BOOL)isReady {
    NSLog(@"isReady");
    return [super isReady];
}

@end
