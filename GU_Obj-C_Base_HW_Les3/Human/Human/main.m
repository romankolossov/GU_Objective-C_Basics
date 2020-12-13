//
//  main.m
//  Human
//
//  Created by Роман Колосов on 13.12.2020.
//

#import <Foundation/Foundation.h>

// MARK: - Gender

enum Gender {
    male,
    female
};

// MARK: - Human

struct Human {
    NSString *name;
    NSInteger age;
    enum Gender gender;
};

// MARK: - Main

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        struct Human man;
        struct Human woman;
        
        NSString *manGender = @"male";
        NSString *womanGender = @"female";
        
        man.name = @"John";
        man.gender = male;
        man.age = 33;
        // NSNumber *manAge = @33;
        // man.age = [manAge integerValue];
        
        woman.name = @"Marry";
        woman.gender = female;
        woman.age = 30;
        
        if (man.gender != male) {
            manGender = @"not defined";
        }
        if (woman.gender != female) {
            womanGender = @"not defined";
        }
        NSLog(@"\n\nPerson first:\nName: %@\nGender: %@\nAge: %ld", man.name, manGender, man.age);
        
        NSLog(@"\n\nPerson second:\nName: %@\nGender: %@\nAge: %ld", woman.name, womanGender, woman.age);
    }
    return 0;
}
