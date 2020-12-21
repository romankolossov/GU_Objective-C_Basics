//
//  BirdLeader.h
//  BirdFlockNoARCAutoRelPool
//
//  Created by Роман Колосов on 21.12.2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BirdLeader : NSObject

// Some property
// copy case - when replasing leader in main has no effect to flock leader
@property (nonatomic, copy) NSString *leader;

// no copy case - when replasing leader in main replaces it in flock
//@property (nonatomic, strong) NSString *leader;

// Initializer
- (instancetype)initWithLeader:(NSString *)leader;

@end

NS_ASSUME_NONNULL_END
