//
//  FlockOfBirds.h
///  BirdFlockNoARCAutoRelPool
//
//  Created by Роман Колосов on 21.12.2020.
//

#import <Foundation/Foundation.h>

@class BirdLeader, Bird;

NS_ASSUME_NONNULL_BEGIN

@interface FlockOfBirds : NSObject

// Some properties
@property (nonatomic, strong) BirdLeader *birdLeader;
@property (nonatomic, copy) NSArray<Bird *> *birds;

// Configure method
- (void)configureWithBirdLeader:(BirdLeader *)birdLeader andBirds:(NSArray<Bird *> *)birds;

@end

NS_ASSUME_NONNULL_END
