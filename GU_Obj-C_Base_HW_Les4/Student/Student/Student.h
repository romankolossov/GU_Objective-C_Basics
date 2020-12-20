//
//  Student.h
//  Student
//
//  Created by Роман Колосов on 20.12.2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *surname;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, readonly, strong) NSNumber *age;
@property (nonatomic) int ageIncrement;

- (void)increaseAgeBy:(int)years;
- (NSNumber *)getAge;
- (NSString *)description;

- (instancetype)initWithName:(NSString *)name andSurname:(NSString *)surname withAge:(NSNumber *)age;

@end

NS_ASSUME_NONNULL_END
