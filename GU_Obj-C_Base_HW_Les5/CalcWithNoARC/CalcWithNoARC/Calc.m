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
            NSNumber *res = @([self.x floatValue] + [self.y floatValue]);
            NSLog(@"Calculations: %@ + %@ = %.@", self.x, self.y, res);
        }
            break;
        case subtrac: {
            NSNumber *res = @([self.x floatValue] - [self.y floatValue]);
            NSLog(@"Calculations: %@ - %@ = %.@", self.x, self.y, res);
        }
            break;
        case multiply: {
            NSNumber *res = @([self.x floatValue] * [self.y floatValue]);
            NSLog(@"Calculations: %@ * %@ = %.@", self.x, self.y, res);
        }
            break;
        case divide: {
            NSNumber *res = @([self.x floatValue] / [self.y floatValue]);
            NSLog(@"Calculations: %@ / %@ = %.@", self.x, self.y, res);
        }
            break;
        case divideByModul: {
            NSNumber *res = @([self.x intValue] % [self.y intValue]);
            NSLog(@"Calculations: %@ %% %@ = %.@", self.x, self.y, res);
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
- (void)dealloc {
    NSLog(@"Calc dealocated");
    [_x release];
    [_y release];
    [super dealloc];
}

@end
