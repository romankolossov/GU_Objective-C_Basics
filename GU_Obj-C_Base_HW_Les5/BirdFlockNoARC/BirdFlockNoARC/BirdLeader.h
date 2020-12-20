//
//  BirdLeader.h
//  BirdFlockNoARC
//
//  Created by Роман Колосов on 20.12.2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BirdLeader : NSObject

// Some property
@property (nonatomic, copy) NSString *leader;

// Initializer
- (instancetype)initWithLeader:(NSString *)leader;

@end

NS_ASSUME_NONNULL_END
