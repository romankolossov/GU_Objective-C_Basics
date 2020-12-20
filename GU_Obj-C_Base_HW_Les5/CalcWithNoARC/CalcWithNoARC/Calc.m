//
//  Calc.m
//  CalcWithNoARC
//
//  Created by Роман Колосов on 20.12.2020.
//

#import "Calc.h"

@implementation Calc

// MARK: - Major methods

- (NSNumber *)summingWithX:(NSNumber *)x andY:(NSNumber*)y {
    NSNumber *res = @([x floatValue] + [y floatValue]);
    return res;
};
- (NSNumber *)differenceWithX:(NSNumber *)x andY:(NSNumber*)y {
    NSNumber *res = @([x floatValue] - [y floatValue]);
    return res;
};

- (NSNumber *)multiplicationWithX:(NSNumber *)x andY:(NSNumber*)y {
    NSNumber *res = @([x floatValue] * [y floatValue]);
    return res;
};
- (NSNumber *)divisionWithX:(NSNumber *)x andY:(NSNumber*)y {
    NSNumber *res = @([x floatValue] / [y floatValue]);
    return res;
};

- (NSNumber *)modulDivisionWithX:(NSNumber *)x andY:(NSNumber*)y {
    NSNumber *res = @([x intValue] % [y intValue]);
    return res;
};

- (void)calculate {
    switch (_mathOperation) {
        case add: {
            NSNumber *res = @([self.x floatValue] + [self.y floatValue]);
            NSLog(@"%@ + %@ = %.@", self.x, self.y, res);
        }
            break;
        case subtrac: {
            NSNumber *res = @([self.x floatValue] - [self.y floatValue]);
            NSLog(@"%@ + %@ = %.@", self.x, self.y, res);
        }
            break;
        case multiply: {
            NSNumber *res = @([self.x floatValue] * [self.y floatValue]);
            NSLog(@"%@ + %@ = %.@", self.x, self.y, res);
        }
            break;
        case divide: {
            NSNumber *res = @([self.x floatValue] / [self.y floatValue]);
            NSLog(@"%@ + %@ = %.@", self.x, self.y, res);
        }
            break;
        case divideByModul: {
            NSNumber *res = @([self.x intValue] % [self.y intValue]);
            NSLog(@"%@ + %@ = %.@", self.x, self.y, res);
        }
            break;
        default:
            break;
    }
};

- (instancetype) init {
    self = [super init];
    if (self) {
        NSLog(@"Create Calc");
    }
    return self;
};
- (void)dealloc {
    NSLog(@"Dealloc x and y");
    [_x release];
    [_y release];
    [super dealloc];
}

- (void)configureWithX:(NSNumber *)x andY:(NSNumber *)y andMathOperation:(MathOperation)mathOperation {
    _mathOperation = mathOperation;
    
    [x retain];
    [_x release];
    _x = x;
    NSLog(@"Add x %@ to the calc", _x);
    
    [y retain];
    [_y release];
    _y = y;
    NSLog(@"Add y %@ to the calc", _y);
}

@end
