//
//  Calc.h
//  CalcWithNoARC
//
//  Created by Роман Колосов on 20.12.2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// MARK: - MathOperation

typedef enum {
    add,
    subtrac,
    multiply,
    divide,
    divideByModul
} MathOperation;

@interface Calc : NSObject

// Some properties
@property (nonatomic, strong) NSNumber *x;
@property (nonatomic, strong) NSNumber *y;
// Simple type property
@property (nonatomic, assign) MathOperation mathOperation;

// MARK: - Major methods

- (void)configureWithX:(NSNumber *)x andY:(NSNumber *)y andMathOperation:(MathOperation)mathOperation;

- (void)calculate;

@end

NS_ASSUME_NONNULL_END
