//
//  Calculator.h
//  Blocks
//
//  Created by Роман Колосов on 22.12.2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef double (^ArithmeticBlock) (double a, double b);

// MARK: - MathOperation

typedef enum {
    add,
    subtrac,
    multiply,
    divide,
    divideByModul
} MathOperation;

@interface Calculator : NSObject

// MARK: - Static method

+ (double)calculateWithMathOperation:(MathOperation)mathOperation firstNumber: (double)x secondNumber: (double)y;

@end

NS_ASSUME_NONNULL_END
