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



@interface ViewController ()

@property(nonatomic, weak) UIImageView *paddleTop;
@property(nonatomic, weak) UIImageView *paddleBottom;
@property(nonatomic, weak) UIView *gridView;
@property(nonatomic, weak) UIView *ballView;
@property(nonatomic, weak) UILabel *scoreTop;
@property(nonatomic, weak) UILabel *scoreBottom;

@property(nonatomic, strong) UITouch *touchTop;
@property(nonatomic, strong) UITouch *touchBottom;
@property(nonatomic, strong) NSTimer *timmer;

@property(nonatomic, assign) float dx;
@property(nonatomic, assign) float dy;
@property(nonatomic, assign) float speed;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config];
}

- (void)config {
    self.view.backgroundColor = [UIColor colorWithRed:100.0/255.0 green:135.0/255.0 blue:191.0/255 alpha:1];
    
    UIView *grid =[[UIView alloc] initWithFrame:CGRectMake(0.0, HALF_SCREEN_HEIGHT - 2.0, SCREEN_WIDTH, 4.0)];
    grid.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:grid];
    self.gridView = grid;
    
    UIImageView *top = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paddleTop"]];
    top.frame = CGRectMake(30.0, 40.0, 90.0, 60.0);
    top.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:top];
    self.paddleTop = top;
    
    UIImageView *bottom = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paddleBot"]];
    top.frame = CGRectMake(30.0, SCREEN_HEIGHT - 90, 90.0, 60.0);
    top.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:bottom];
    self.paddleBottom = bottom;
    
    UIView *ball = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x - 10.0, self.view.center.y - 10.0, 20.0, 20.0)];
    ball.backgroundColor = [UIColor whiteColor];
    ball.layer.cornerRadius = 10.0;
    ball.hidden = YES;
    [self.view addSubview:ball];
    self.ballView = ball;
    
    UILabel *topScore = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70.0, HALF_SCREEN_HEIGHT - 70, 50.0, 50.0)];
    topScore.textColor = [UIColor whiteColor];
    topScore.text = @"0";
    topScore.font = [UIFont systemFontOfSize:40.0 weight:UIFontWeightLight];
    topScore.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:topScore];
    self.scoreTop = topScore;
    
    UILabel *botScore = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70.0, HALF_SCREEN_HEIGHT + 20, 50.0, 50.0)];
    botScore.textColor = [UIColor whiteColor];
    botScore.text = @"0";
    botScore.font = [UIFont systemFontOfSize:40.0 weight:UIFontWeightLight];
    botScore.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:botScore];
    self.scoreBottom = botScore;
    
}

@end
