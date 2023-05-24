
#import <UIKit/UIKit.h>

@class BSSkeletonView;
NS_ASSUME_NONNULL_BEGIN


@interface UIViewController (BSSkeleton)


/// 加载骨架图
/// - Parameter skeletonView: 自定义的view
- (void)bs_loadSkeletonView:(BSSkeletonView *)skeletonView;

/// 加载列表页骨架图
- (void)bs_loadSkeletonListView;


/// 移除骨架图
- (void)bs_unloadSkeletonView;

@end

NS_ASSUME_NONNULL_END
