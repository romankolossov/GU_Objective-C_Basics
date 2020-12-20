//
//  Calc.m
//  CalcWithNoARC
//
//  Created by Роман Колосов on 20.12.2020.
//

#import "Calc.h"

@implementation Calc

// MARK: - Major methods

- (void)calculate {
    switch (_mathOperation) {
        case add: {
            double res = [self.x doubleValue] + [self.y doubleValue];
            NSLog(@"Calculations: %@ + %@ = %.3f", self.x, self.y, res);
        }
            break;
        case subtrac: {
            double res = [self.x doubleValue] - [self.y doubleValue];
            NSLog(@"Calculations: %@ - %@ = %.3f", self.x, self.y, res);
        }
            break;
        case multiply: {
            double res = [self.x doubleValue] * [self.y doubleValue];
            NSLog(@"Calculations: %@ * %@ = %.3f", self.x, self.y, res);
        }
            break;
        case divide: {
            double res = [self.x doubleValue] / [self.y doubleValue];
            NSLog(@"Calculations: %@ / %@ = %.3f", self.x, self.y, res);
        }
            break;
        case divideByModul: {
            long res = [self.x longValue] % [self.y longValue];
            NSLog(@"Calculations: %@ %% %@ = %ld", self.x, self.y, res);
        }
            break;
        default:
            break;
    }
};

// MARK: - Configure

- (void)configureWithX:(NSNumber *)x andY:(NSNumber *)y andMathOperation:(MathOperation)mathOperation {
    _mathOperation = mathOperation;
    
    [x retain];
    [_x release];
    _x = x;
    NSLog(@"X added to the calc with value of %@ ", _x);
    
    [y retain];
    [_y release];
    _y = y;
    NSLog(@"Y added to the calc with value of %@ ", _y);
}

// MARK: - Initializer

- (instancetype) init {
    self = [super init];
    if (self) {
        NSLog(@"Calc created");
    }
    return self;
};

// MARK: - Dealoc

- (void)dealloc {
    NSLog(@"Calc dealocated");
    [_x release];
    [_y release];
    [super dealloc];
}

@end
