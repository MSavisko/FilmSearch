//
//  FSTabBarController.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/11/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "FSTabBarController.h"
#import "MSTabBarItemViewControllerProtocol.h"

#import "MSThemeManager+Navigation.h"

static NSInteger const FSInitialViewControllerIndex = 0;

@interface FSTabBarController () <UITabBarControllerDelegate, UITabBarDelegate> {
    NSInteger _tapCount;
}

@end

@implementation FSTabBarController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.delegate = self;

    [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {

        if (idx == FSInitialViewControllerIndex) {
            self.selectedIndex = idx;
        }
    }];

    [[MSThemeManager sharedInstance] customizeTabBar:self.tabBar];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if (tabBarController.selectedViewController == viewController) {
        _tapCount += 1;

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

            _tapCount = 0;
        });

        if (_tapCount == 2) {
            _tapCount = 0;

            BOOL shouldPop = YES;

            UIViewController *visibleViewController = [viewController ms_visibleViewController];

            if ([visibleViewController respondsToSelector:@selector(shouldPopToRootViewControllerAfterTappingOnTabBarItem)]) {
                shouldPop = [(id<MSTabBarItemViewControllerProtocol>)visibleViewController shouldPopToRootViewControllerAfterTappingOnTabBarItem];
            }

            return shouldPop;
        }

        return NO;
    } else {
        _tapCount = 0;
    }

    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}

@end
