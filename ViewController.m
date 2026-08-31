#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor colorWithRed:0.04 green:0.05 blue:0.08 alpha:1.0];
    
    UIView *borderView = [[UIView alloc] initWithFrame:CGRectInset(self.view.bounds, 20, 20)];
    borderView.layer.borderColor = [UIColor cyanColor].CGColor;
    borderView.layer.borderWidth = 2.0;
    borderView.userInteractionEnabled = NO;
    [self.view addSubview:borderView];
    
    self.statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 40, self.view.bounds.size.width - 80, 60)];
    self.statusLabel.numberOfLines = 2;
    self.statusLabel.font = [UIFont fontWithName:@"CourierNewPS-BoldMT" size:12];
    self.statusLabel.textColor = [UIColor cyanColor];
    self.statusLabel.text = @"SYSTEM: ANTIGRAVITY KIOSK\nNETWORK: OFFLINE | BATT: 100%";
    [self.view addSubview:self.statusLabel];
    
    self.aiStatusLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 150, self.view.bounds.size.width - 80, 40)];
    self.aiStatusLabel.font = [UIFont fontWithName:@"CourierNewPS-BoldMT" size:18];
    self.aiStatusLabel.textColor = [UIColor greenColor];
    self.aiStatusLabel.textAlignment = NSTextAlignmentCenter;
    self.aiStatusLabel.text = @"AI: IDLE";
    [self.view addSubview:self.aiStatusLabel];
    
    CGFloat btnSize = 80;
    self.pttButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.pttButton.frame = CGRectMake((self.view.bounds.size.width - btnSize) / 2, self.view.bounds.size.height - 120, btnSize, btnSize);
    self.pttButton.backgroundColor = [UIColor cyanColor];
    self.pttButton.layer.cornerRadius = btnSize / 2;
    [self.pttButton setTitle:@"PTT" forState:UIControlStateNormal];
    [self.pttButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.pttButton.titleLabel.font = [UIFont fontWithName:@"CourierNewPS-BoldMT" size:20];
    
    [self.pttButton addTarget:self action:@selector(pttDown) forControlEvents:UIControlEventTouchDown];
    [self.pttButton addTarget:self action:@selector(pttUp) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    [self.view addSubview:self.pttButton];
}

- (void)pttDown {
    self.pttButton.backgroundColor = [UIColor redColor];
    self.aiStatusLabel.text = @"LISTENING...";
    self.aiStatusLabel.textColor = [UIColor redColor];
}

- (void)pttUp {
    self.pttButton.backgroundColor = [UIColor cyanColor];
    self.aiStatusLabel.text = @"THINKING...";
    self.aiStatusLabel.textColor = [UIColor yellowColor];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.aiStatusLabel.text = @"AI: IDLE";
        self.aiStatusLabel.textColor = [UIColor greenColor];
    });
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
