//
//  Calculator.m
//  Blocks
//
//  Created by Роман Колосов on 22.12.2020.
//

#import "Calculator.h"

// MARK: - Blocks

ArithmeticBlock summing = ^(double x, double y) {
    double sum = x + y;
    NSLog(@"%.3f + %.3f = %.3f", x, y, sum);
    
    return sum;
};
ArithmeticBlock difference = ^(double x, double y) {
    double diff = x - y;
    NSLog(@"%.3f - %.3f = %.3f", x, y, diff);
    
    return diff;
};

ArithmeticBlock multiplication = ^(double x, double y) {
    double mult = x * y;
    NSLog(@"%.3f * %.3f = %.3f", x, y, mult);
    
    return mult;
};
ArithmeticBlock division = ^(double x, double y) {
    double div = x / y;
    NSLog(@"%.3f / %.3f = %.3f", x, y, div);
    
    return div;
};

ArithmeticBlock modulDivision = ^(double x, double y) {
    double modulDiv = (double)((int)x % (int)y);;
    NSLog(@"%d %% %d = %d", (int)x, (int)y, (int)modulDiv);
    
    return modulDiv;
};

@implementation Calculator

// MARK: - Static method

+ (double)calculateWithMathOperation:(MathOperation)mathOperation firstNumber: (double)x secondNumber: (double)y {
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    switch (mathOperation) {
        case add: {
            __block double res;
            
            dispatch_sync(globalQueue, ^{
                res = summing(x, y);
            });
            return res;
        }
            break;
        case subtrac: {
            __block double res;
            
            dispatch_sync(globalQueue, ^{
                res = difference(x, y);
            });
            return res;
        }
            break;
        case multiply: {
            __block double res;
            
            dispatch_sync(globalQueue, ^{
                res = multiplication(x, y);
            });
            return res;
        }
            break;
        case divide: {
            __block double res;
            
            dispatch_sync(globalQueue, ^{
                res = division(x, y);
            });
            return res;
        }
            break;
        case divideByModul: {
            __block double res;
            
            dispatch_sync(globalQueue, ^{
                res = modulDivision(x, y);
            });
            return res;
        }
            break;
    }
};

@end
