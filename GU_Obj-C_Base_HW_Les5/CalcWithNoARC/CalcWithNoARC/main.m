//
//  main.m
//  CalcWithNoARC
//
//  Created by Роман Колосов on 20.12.2020.
//

#import <Foundation/Foundation.h>
#import "Calc.h"

// MARK: - Main

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Some properties
        double x, y;
        char actionChar;
        NSString *defActions = @"12345+-*/%";
        NSString *action;
        
        Calc *calc = [[Calc alloc] init];
        MathOperation mathOperation;
        
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
        [calc configureWithX: [NSNumber numberWithDouble: x] andY: [NSNumber numberWithDouble: y] andMathOperation: mathOperation];
        
        [calc calculate];
        
        [defActions release];
        [action release];
        [calc release];
    }
    return 0;
}

