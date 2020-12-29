//
//  main.m
//  Blocks
//
//  Created by Роман Колосов on 22.12.2020.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"
#import "Operation.h"

// MARK: - Main

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Some properties
        MathOperation mathOperation;
        double x, y;
        __block double result;
        
        char actionChar;
        NSString *defActions = @"12345+-*/%";
        NSString *action;
        
        printf("Enter first number, x: ");
        scanf("%lf", &x);
        printf("Enter second number, y: ");
        scanf("%lf", &y);
        
        do {
            getchar();
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
        
        NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
        // Operation *operation = [[Operation alloc] init];
        // [mainQueue addOperation:operation];
        
        [mainQueue addBarrierBlock: ^{
            result = [Calculator calculateWithMathOperation: mathOperation firstNumber: x secondNumber: y];
        }];
        sleep(1);
        
        NSLog(@"\nThe result of calculations is %f", result);
    }
    return 0;
}

