
#import "BSSkeletonView.h"

#import <Masonry/Masonry.h>
#import "UIColor+BSMatch.h"

#define RGBACOLOR(r, g, b, a) [UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b) / 255.0f alpha:(a)]


@interface BSSkeletonView ()

@property (nonatomic, strong) CAGradientLayer *bgLayer;
@property (nonatomic, strong) CAGradientLayer *skeletonAnimationLayer;

@end


@implementation BSSkeletonView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initViews];
    }

    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self initViews];
    }

    return self;
}

- (void)initViews {
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.startPoint = CGPointMake(0.5, 0);
    gl.endPoint = CGPointMake(0.5, 1.0);
    NSArray *colors = @[(__bridge id)UIColor.yellowColor.CGColor, (__bridge id)UIColor.purpleColor.CGColor];
//    NSArray *colors = @[(__bridge id)BSCustomColor(@"#F9F9F9").CGColor, (__bridge id)BSCustomColor(@"#F9F9F9").CGColor];
    
    [gl setColors:colors];
    
    gl.locations = @[@(0), @(1.0f)];
    self.bgLayer = gl;
    [self.layer insertSublayer:self.bgLayer atIndex:0];

    CAGradientLayer *calayer = [CAGradientLayer layer];
    calayer.colors = @[(__bridge id)RGBACOLOR(0, 0, 0, 0.1).CGColor,
                       (__bridge id)RGBACOLOR(80, 80, 80, 0.1).CGColor,
                       (__bridge id)RGBACOLOR(0, 0, 0, 0.1).CGColor,
                       (__bridge id)RGBACOLOR(80, 80, 80, 0.1).CGColor,
                       (__bridge id)RGBACOLOR(0, 0, 0, 0.1).CGColor];
    calayer.locations = @[@-1.0, @-0.5, @0, @0.5, @1.0];
    calayer.startPoint = CGPointMake(0, 0);
    calayer.endPoint = CGPointMake(1.0, 1.0);

    CABasicAnimation *rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"locations"];
    rotationAnimation.fromValue = @[@-1.0, @-0.5, @0, @0.5, @1.0];
    rotationAnimation.toValue = @[@0, @0.5, @1.0, @1.5, @2.0];
    rotationAnimation.duration = 1;
    rotationAnimation.repeatCount = MAXFLOAT;
    rotationAnimation.removedOnCompletion = NO;
    [calayer addAnimation:rotationAnimation forKey:nil];
    self.skeletonAnimationLayer = calayer;
    [self.layer addSublayer:calayer];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.skeletonAnimationLayer.frame = self.bounds;
    self.bgLayer.frame = self.bounds;
}

@end
