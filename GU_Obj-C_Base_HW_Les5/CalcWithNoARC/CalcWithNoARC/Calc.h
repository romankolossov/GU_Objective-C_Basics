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

@property (nonatomic, strong) NSNumber *x;
@property (nonatomic, strong) NSNumber *y;
@property (nonatomic) MathOperation mathOperation;

// MARK: - Major methods

- (NSNumber *)summingWithX:(NSNumber *)x andY:(NSNumber*)y;
- (NSNumber *)differenceWithX:(NSNumber *)x andY:(NSNumber*)y;

- (NSNumber *)multiplicationWithX:(NSNumber *)x andY:(NSNumber*)y;
- (NSNumber *)divisionWithX:(NSNumber *)x andY:(NSNumber*)y;

- (NSNumber *)modulDivisionWithX:(NSNumber *)x andY:(NSNumber*)y;

- (void)configureWithX:(NSNumber *)x andY:(NSNumber *)y andMathOperation:(MathOperation)mathOperation;
- (void)calculate;

//- (void)dealloc; 

@end

NS_ASSUME_NONNULL_END
