//
//  Bird.h
//  BirdFlockNoARC
//
//  Created by Роман Колосов on 20.12.2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Bird : NSObject

// Some property
@property (nonatomic, readonly, strong) NSNumber *number;

// Initializer
- (instancetype)initWithNumber:(NSNumber *)number;

@end

NS_ASSUME_NONNULL_END
