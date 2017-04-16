//
//  MSThemeManager+Navigation.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/16/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "MSThemeManager+Navigation.h"

#import "UIColor+MSTheme.h"
#import "UIFont+MSTheme.h"

@implementation MSThemeManager (Navigation)

#pragma mark - Public

- (void)customizeNavigationBar:(__kindof UINavigationBar *)navigationBar
{
    [navigationBar setTitleTextAttributes:@{
        NSForegroundColorAttributeName : [UIColor ms_navigationTitleColor],
        NSFontAttributeName : [UIFont ms_navigationBartTitleFontWithWeight:UIFontWeightBold],
        NSKernAttributeName : @(1.f)
    }];

    [navigationBar setTintColor:[UIColor ms_primaryRedColor]];
}

- (void)customizeTabBar:(__kindof UITabBar *)tabBar
{
    [tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        [obj setTitleTextAttributes:@{
            NSFontAttributeName : [UIFont ms_tabBarFontWithWeight:UIFontWeightRegular],
            NSForegroundColorAttributeName : [UIColor ms_tabBarItemColor]
        }
                           forState:UIControlStateNormal];

        [obj setTitleTextAttributes:@{
            NSFontAttributeName : [UIFont ms_tabBarFontWithWeight:UIFontWeightRegular],
            NSForegroundColorAttributeName : [UIColor ms_tabBarItemColorSelected]
        }
                           forState:UIControlStateSelected];

    }];
}

@end
