//
//  main.m
//  Student
//
//  Created by Роман Колосов on 20.12.2020.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student *student = [[Student alloc] initWithName:@"John" andSurname:@"Watson" withAge:@33];
        
        NSLog(@"%@", student.description);
        
        [student increaseAgeBy: 3];
        
        NSLog(@"%@", student.description);
    }
    return 0;
}
