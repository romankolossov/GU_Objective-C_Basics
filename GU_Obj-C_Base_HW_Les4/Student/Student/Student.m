//
//  Student.m
//  Student
//
//  Created by Роман Колосов on 20.12.2020.
//

#import "Student.h"

@implementation Student

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
};
- (NSString *)description {
    return [NSString stringWithFormat:@"%@ of age %@", self.fullName, self.getAge];
};

- (void)increaseAgeBy:(int)years {
    _ageIncrement = years;
};
- (NSNumber *)getAge {
    return @([self.age intValue] + self.ageIncrement);
};


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
- (void)dealloc {
    NSLog(@"Dealloc student %@", _name);
}

@end
