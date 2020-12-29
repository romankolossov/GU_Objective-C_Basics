//
//  Student.m
//  Student
//
//  Created by Роман Колосов on 20.12.2020.
//

#import "Student.h"

@implementation Student

// MARK: - Calculateble properties

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
};
- (NSNumber *)getAge {
    int age = [self.age intValue] + self.ageIncrement;
    return [NSNumber numberWithInt: age];
};

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ of age %@", self.fullName, self.getAge];
};

// MARK: - Some methods

- (void)increaseAgeBy:(int)years {
    _ageIncrement = years;
    // error handling
    // it is possible to change the member of the class variable _age inspide the self.age is read only property:
    //_age = [NSNumber numberWithInt: [_age intValue] + years];
};

// MARK: - Initializer

- (instancetype)initWithName:(NSString *)name andSurname:(NSString *)surname withAge:(NSNumber *)age {
    self = [super init];
    if (self) {
        self.name = name;
        self.surname = surname;
        _age = age;
        self.ageIncrement = 0;
    }
    return self;
}

// MARK: - Dealloc

- (void)dealloc {
    NSLog(@"Dealloc student %@", _name);
}

@end
