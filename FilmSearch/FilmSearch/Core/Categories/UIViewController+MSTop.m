//
//  UIViewController+MSTop.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/11/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "UIViewController+MSTop.h"

@implementation UIViewController (MSTop)

- (UIViewController *)ms_topViewController
{
    if ( [self isKindOfClass:[UINavigationController class]] )
    {
        return [(UINavigationController *)self topViewController];
    }
    else if ( [self isKindOfClass:[UITabBarController class]] )
    {
        return [(UITabBarController *)self selectedViewController];
    }
    
    return self;
}

- (UIViewController *)ms_visibleViewController
{
    if ( [self isKindOfClass:[UINavigationController class]] )
    {
        return [(UINavigationController *)self visibleViewController];
    }
    else if ( [self isKindOfClass:[UITabBarController class]] )
    {
        return [[self ms_topViewController] ms_visibleViewController];
    }
    
    return self;
}

- (UIViewController *)ms_topPresentedViewController
{
    UIViewController *presentedViewController = self;
    
    while (presentedViewController.presentedViewController) {
        
        presentedViewController = presentedViewController.presentedViewController;
    }
    
    return presentedViewController;
}

@end
