//
//  main.m
//  Human
//
//  Created by Роман Колосов on 13.12.2020.
//

#import <Foundation/Foundation.h>

// MARK: - Gender

typedef enum: char {
    male = 'm',
    female = 'f'
} Gender;

// MARK: - Human

typedef struct {
    __unsafe_unretained NSString *name;
    NSInteger age;
    Gender gender;
} Human;

// MARK: - Main

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Human man;
        Human woman;
        
        man.name = @"John";
        man.gender = male;
        man.age = 33;
        // NSNumber *manAge = @33;
        // man.age = [manAge integerValue];
        
        woman.name = @"Marry";
        woman.gender = female;
        woman.age = 30;
        
        NSString *manGender = (man.gender == male) ? @"male" : @"not defined";
        NSString *womanGender = (woman.gender == female) ? @"female" : @"not defined";
        
        NSLog(@"\n\nPerson first:\nName: %@\nGender: %@\nAge: %ld", man.name, manGender, man.age);
        NSLog(@"\n\nPerson second:\nName: %@\nGender: %@\nAge: %ld", woman.name, womanGender, woman.age);
        
        // NSLog(@"\n\nPerson first:\nName: %@\nGender: %c\nAge: %ld", man.name, man.gender, man.age);
        // NSLog(@"\n\nPerson second:\nName: %@\nGender: %c\nAge: %ld", woman.name, woman.gender, woman.age);
    }
    return 0;
}
