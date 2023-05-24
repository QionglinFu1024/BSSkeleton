//
//  ViewController.m
//  BSSkeleton
//
//  Created by bear on 2023/5/24.
//

#import "ViewController.h"

#import "UIViewController+BSSkeleton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.yellowColor;
    
    [self bs_loadSkeletonListView];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self bs_unloadSkeletonView];
//    });
}


@end
