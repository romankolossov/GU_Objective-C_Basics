//
//  main.m
//  CalcImproved
//
//  Created by Роман Колосов on 13.12.2020.
//

#import <Foundation/Foundation.h>

// MARK: - MathOperation

typedef enum {
    add,
    subtrac,
    multiply,
    divide,
    divideByModul
} MathOperation;

// MARK: - Major methods

double summing(double x, double y) {
    return x + y;
}
double difference(double x, double y) {
    return x - y;
}
double multiplication(double x, double y) {
    return x * y;
}
double division(double x, double y) {
    return x / y;
}
int modulDivision(double x, double y) {
    return (int)x % (int)y;
}

// MARK: - Main

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Some properties
        MathOperation mathOperation;
        double x, y;
        
        char actionChar;
        NSString *defActions = @"12345+-*/%";
        NSString *action;
        
        printf("Enter first number, x: ");
        scanf("%lf", &x);
        printf("Enter second number, y: ");
        scanf("%lf", &y);
        
        do {
            printf("Enter an action to perform:\n1 - sum, +\n2 - difference, -\n3 - multiplication, *\n4 - division, /\n5 - division by modul, %%\n");
            scanf("%c", &actionChar);
            
            action = [NSString stringWithFormat:@"%c", actionChar];
        } while ( ![defActions containsString: action] );
        
        BOOL provedSum = [action isEqualToString: @"+"] || [action isEqualToString: @"1"];
        BOOL provedDifference = [action isEqualToString: @"-"] || [action isEqualToString: @"2"];
        BOOL provedMultiplication = [action isEqualToString: @"*"] || [action isEqualToString: @"3"];
        BOOL provedDivision = [action isEqualToString: @"/"] || [action isEqualToString: @"4"];
        BOOL provedDivisionByModul = [action isEqualToString: @"%"] || [action isEqualToString: @"5"];
        
        if (provedSum) {
            mathOperation = add;
        } else if (provedDifference) {
            mathOperation = subtrac;
        } else if (provedMultiplication) {
            mathOperation = multiply;
        } else if (provedDivision) {
            mathOperation = divide;
        } else if (provedDivisionByModul) {
            mathOperation = divideByModul;
        } else {
            return  0;
        }
        
        switch (mathOperation) {
            case add: {
                double sum = summing(x, y);
                NSLog(@"%.3f + %.3f = %.3f", x, y, sum);
            }
                break;
            case subtrac: {
                double diff = difference(x, y);
                NSLog(@"%.3f - %.3f = %.3f", x, y, diff);
            }
                break;
            case multiply: {
                double mult = multiplication(x, y);
                NSLog(@"%.3f * %.3f = %.3f", x, y, mult);
            }
                break;
            case divide: {
                double div = division(x, y);
                NSLog(@"%.3f / %.3f = %.3f", x, y, div);
            }
                break;
            case divideByModul: {
                int modulDiv = modulDivision(x, y);
                NSLog(@"%d %% %d = %d", (int)x, (int)y, modulDiv);
            }
                break;
            default:
                break;
        }
    }
    return 0;
}

