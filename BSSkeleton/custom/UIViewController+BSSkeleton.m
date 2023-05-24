

#import "UIViewController+BSSkeleton.h"

#import <Masonry/Masonry.h>
#import <objc/runtime.h>


#import "BSListSkeletonView.h"
#import "BSSkeletonView.h"


@interface UIViewController ()

@property (nonatomic, strong) BSSkeletonView *skeletonView;

@end


static const char *skeletonViewKey = "skeletonView";


@implementation UIViewController (BSSkeleton)

- (BSSkeletonView *)skeletonView {
    return objc_getAssociatedObject(self, &skeletonViewKey);
}

- (void)setSkeletonView:(BSSkeletonView *)skeletonView {
    objc_setAssociatedObject(self, &skeletonViewKey, skeletonView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)bs_loadSkeletonView:(BSSkeletonView *)skeletonView {
    [self bs_loadSkeletonView:skeletonView edge:UIEdgeInsetsZero];
}

- (void)bs_loadSkeletonView:(BSSkeletonView *)skeletonView edge:(UIEdgeInsets)edge {
    if (self.skeletonView) {
        [self.skeletonView removeFromSuperview];
        self.skeletonView = nil;
    }

    self.skeletonView = skeletonView;
    [self.view addSubview:skeletonView];
    [skeletonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
}

- (void)bs_unloadSkeletonView {
    if (self.skeletonView == nil) {
        return;
    }

    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.skeletonView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.skeletonView removeFromSuperview];
        self.skeletonView.alpha = 1;
    }];
}


- (void)bs_loadSkeletonListView {
    
    BSListSkeletonView *skeletonView =
    (BSListSkeletonView *)[[UINib nibWithNibName:NSStringFromClass([BSListSkeletonView class]) bundle:nil] instantiateWithOwner:nil options:nil].firstObject;
    [self bs_loadSkeletonView:skeletonView];
}


@end
