//
//  main.m
//  AlphabetEng
//
//  Created by Роман Колосов on 12.12.2020.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *engAlphabet = @"abcdefghijklmnopqrstuvwxyz";
        char inputChar;
        
        NSString *inputStr, *inputLowerCaseStr;
        NSString *exitStr = @"0";
        
        while (true) {
            printf("\nEnter a letter\n(or '0' for exit): ");
            scanf("%c", &inputChar);
            
            inputStr = [NSString stringWithFormat:@"%c", inputChar];
            inputLowerCaseStr = [inputStr lowercaseString];
            
            if ( [inputStr isEqualToString: exitStr] ) {
                break;
            } else if ( [engAlphabet containsString: inputLowerCaseStr] ) {
                NSLog(@"entered letter '%@' is in English alphabet", inputStr);
            } else {
                NSLog(@"entered letter '%@' is out of the English alphabet", inputStr);
            }
            getchar();
        }
    }
    return 0;
}
