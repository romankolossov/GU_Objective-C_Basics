//
//  main.m
//  StringArray
//
//  Created by Роман Колосов on 13.12.2020.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *array = [NSArray arrayWithObjects: @"Hello, ", @"World!", @" ",
                          @"Hello, ", @"everybody!", nil];
        
        for (int i = 0; i < [array count]; i++) {
            NSLog(@"%@", array[i]);
        }
    }
    return 0;
}
