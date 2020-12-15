//
//  main.m
//  Calc
//
//  Created by Роман Колосов on 08.12.2020.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        double x = 0;
        double y = 0;
        double z = 0;
        
        double sum = 0;
        double diff = 0;
        double mult = 0;
        double div = 0;
        double average = 0;
        
        printf("Enter first number, x: ");
        scanf("%lf", &x);
        printf("Enter second number, y: ");
        scanf("%lf", &y);
        printf("Enter third number, z: ");
        scanf("%lf", &z);
        
        sum = x + y;
        diff = x - y;
        mult = x * y;
        div = x / y;
        average = (x + y + z) / 3;
        
        printf("\nx + y = %f\n", sum);
        printf("x - y = %f\n", diff);
        printf("x * y = %f\n", mult);
        printf("x / y = %f\n", div);
        printf("the average of x, y and z  is %f\n\n", average);
        
        NSLog(@"%f + %f = %f", x, y, sum);
        NSLog(@"%f - %f = %f", x, y, diff);
        NSLog(@"%f * %f = %f", x, y, mult);
        NSLog(@"%f / %f = %f", x, y, div);
        NSLog(@"the average of %f, %f and %f is %f", x, y, z, average);
    }
    return 0;
}
