//
//  ViewController.m
//  Ping-Pong
//
//  Created by Роман Колосов on 26.12.2020.
//

#import "ViewController.h"

#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height
#define HALF_SCREEN_WIDTH   SCREEN_WIDTH / 2
#define HALF_SCREEN_HEIGHT  SCREEN_HEIGHT / 2
#define MAX_SCORE           6

// MARK: - Major functions

UIImageView *createPaddleView(NSString *position) {
    NSString *imageName;
    CGFloat y;

    if ([position isEqual:@"top"]) {
        imageName = @"paddleTop";
        y = 40;
    } else if ([position isEqual:@"bottom"]) {
        imageName = @"paddleBot";
        y = SCREEN_HEIGHT - 90;
    } else return [UIImageView alloc];

    UIImageView *paddleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    paddleView.frame = CGRectMake(30.0, y, 90.0, 60.0);
    paddleView.contentMode = UIViewContentModeScaleAspectFit;

    return  paddleView;
}

UILabel *createScoreLabel(NSString *position) {
    CGFloat y;
    
    if ([position isEqual:@"top"]) {
        y = HALF_SCREEN_HEIGHT - 70;
    } else if ([position isEqual:@"bottom"]) {
        y = HALF_SCREEN_HEIGHT + 20;
    } else return [UILabel alloc];
    
    UILabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70.0, y, 50.0, 50.0)];
    scoreLabel.textColor = [UIColor whiteColor];
    scoreLabel.text = @"0";
    scoreLabel.font = [UIFont systemFontOfSize:40.0 weight:UIFontWeightLight];
    scoreLabel.textAlignment = NSTextAlignmentCenter;
    
    return scoreLabel;
}

// MARK: - Interface

@interface ViewController ()

@property(nonatomic, weak) UIImageView *paddleTop;
@property(nonatomic, weak) UIImageView *paddleBottom;
@property(nonatomic, weak) UIView *gridView;
@property(nonatomic, weak) UIView *ballView;
@property(nonatomic, weak) UILabel *scoreTop;
@property(nonatomic, weak) UILabel *scoreBottom;

@property(nonatomic, strong) UITouch *touchTop;
@property(nonatomic, strong) UITouch *touchBottom;
@property(nonatomic, strong) NSTimer *timer;

@property(nonatomic, assign) float dx;
@property(nonatomic, assign) float dy;
@property(nonatomic, assign) float speed;

@end

// MARK: - Implementation

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config];
}

// MARK: - Major methods

// MARK: Touches

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint point = [touch locationInView:self.view];
        if (self.touchBottom == nil && point.y > HALF_SCREEN_HEIGHT) {
            self.touchBottom = touch;
            self.paddleBottom.center = point;
        } else if (self.touchTop == nil && point.y < HALF_SCREEN_HEIGHT) {
            self.touchTop = touch;
            self.paddleTop.center = point;
        }
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint point = [touch locationInView:self.view];
        if (self.touchTop == touch) {
            if (point.y > HALF_SCREEN_HEIGHT) {
                point.y = HALF_SCREEN_HEIGHT;
            }
            self.paddleTop.center = point;
        } else if (self.touchBottom == touch) {
            if (point.y < HALF_SCREEN_HEIGHT) {
                point.y = HALF_SCREEN_HEIGHT;
            }
            self.paddleBottom.center = point;
        }
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        if (self.touchTop == touch) {
            self.touchTop = nil;
        } else if (self.touchBottom == touch) {
            self.touchBottom = nil;
        }
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touchesEnded:touches withEvent:event];
}

#pragma mark - Private

// MARK: Config

- (void)config {
    self.view.backgroundColor = [UIColor colorWithRed:100.0/255.0 green:135.0/255.0 blue:191.0/255 alpha:1];
    
    UIView *grid =[[UIView alloc] initWithFrame:CGRectMake(0.0, HALF_SCREEN_HEIGHT - 2.0, SCREEN_WIDTH, 4.0)];
    grid.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:grid];
    self.gridView = grid;
    
    UIView *ball = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x - 10.0, self.view.center.y - 10.0, 20.0, 20.0)];
    ball.backgroundColor = [UIColor whiteColor];
    ball.layer.cornerRadius = 10.0;
    ball.hidden = YES;
    [self.view addSubview:ball];
    self.ballView = ball;
    
    UIImageView *top = createPaddleView(@"top");
    UIImageView * bottom = createPaddleView(@"bottom");
    
    [self.view addSubview:top];
    [self.view addSubview:bottom];
    self.paddleTop = top;
    self.paddleBottom = bottom;
    
    UILabel *topScore = createScoreLabel(@"top");
    UILabel *botScore = createScoreLabel(@"bottom");
    
    [self.view addSubview:topScore];
    [self.view addSubview:botScore];
    self.scoreTop = topScore;
    self.scoreBottom = botScore;
}

- (void)displayMessage:(NSString *)message {
    [self stop];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Ping Pong" message:message preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        if ([self gameOver] != 0) {
            [self newGame];
        } else {
            [self reset];
            [self start];
        }
    }];
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)reset {
    self.dx = ((arc4random() % 2) == 0) ? -1 : 1;
    
    if (self.dy != 0) {
        self.dy = -self.dy;
    } else {
        self.dy = ((arc4random() % 2) == 0) ? -1 : 1;
    }
    self.ballView.center = self.view.center;
    
    self.speed = 2;
}

-(void)start {
    self.ballView.center = self.view.center;
    
    if (self.timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:(1.0 / 60.0) target:self selector:@selector(animate) userInfo:nil repeats:YES];
    }
    self.ballView.hidden = NO;
}

-(void)stop {
    [self.timer invalidate];
    
    self.timer = nil;
    self.ballView.hidden = YES;
}

-(int)gameOver {
    if ([self.scoreTop.text intValue] >= MAX_SCORE) {
        return 1;
    }
    if ([self.scoreBottom.text intValue] >= MAX_SCORE) {
        return 2;
    }
    return 0;
}

-(void)newGame {
    [self reset];
    
    self.scoreTop.text = @"0";
    self.scoreBottom.text = @"0";
    
    [self displayMessage:@"Are you ready?"];
}

-(void)animate {
    // TODO
}

-(void)increaseSpeed {
    self.speed += 0.5;
    if (self.speed > 10.0) {
        self.speed = 10.0;
    }
}

- (BOOL)checkCollision:(CGRect)rect x:(float)x y:(float)y {
    if (CGRectIntersectsRect(self.ballView.frame, rect)) {
        if (x != 0.0) {
            self.dx = x;
        }
        if (y != 0.0) {
            self.dy = y;
        }
        return YES;
    }
    return  NO;
}

@end
