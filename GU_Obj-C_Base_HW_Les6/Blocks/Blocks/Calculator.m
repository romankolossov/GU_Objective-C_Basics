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
    
    switch (mathOperation) {
        case add: {
            return summing(x, y);
        }
            break;
        case subtrac: {
            return difference(x, y);
        }
            break;
        case multiply: {
            return multiplication(x, y);
        }
            break;
        case divide: {
            return division(x, y);
        }
            break;
        case divideByModul: {
            return modulDivision(x, y);
        }
            break;
    }
};

@end
