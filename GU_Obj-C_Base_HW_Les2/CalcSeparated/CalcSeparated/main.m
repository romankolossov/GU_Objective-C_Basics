//
//  main.m
//  CalcSeparated
//
//  Created by Роман Колосов on 13.12.2020.
//

#import <Foundation/Foundation.h>

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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
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
            double sum = summing(x, y);
            NSLog(@"%f + %f = %f", x, y, sum);
        } else if (provedDifference) {
            double diff = difference(x, y);
            NSLog(@"%f - %f = %f", x, y, diff);
        } else if (provedMultiplication) {
            double mult = multiplication(x, y);
            NSLog(@"%f * %f = %f", x, y, mult);
        } else if (provedDivision) {
            double div = division(x, y);
            NSLog(@"%f / %f = %f", x, y, div);
        } else if (provedDivisionByModul) {
            int modulDiv = modulDivision(x, y);
            NSLog(@"%d %% %d = %d", (int)x, (int)y, modulDiv);
        } else {
            return  0;
        }
    }
    return 0;
}
