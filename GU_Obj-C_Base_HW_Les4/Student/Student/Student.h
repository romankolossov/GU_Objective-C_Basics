//
//  Student.h
//  Student
//
//  Created by Роман Колосов on 20.12.2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

// Some properties
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *surname;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, readonly, strong) NSNumber *age;
// Simple property
@property (nonatomic, assign) int ageIncrement;

// Calculatable properties
- (NSNumber *)getAge;
- (NSString *)description;

// Some methods
- (void)increaseAgeBy:(int)years;

// Initializer
- (instancetype)initWithName:(NSString *)name andSurname:(NSString *)surname withAge:(NSNumber *)age;

@end

NS_ASSUME_NONNULL_END
