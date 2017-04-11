//
//  MSThemeManager.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/11/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "MSThemeManager.h"
#import "UIColor+MSTheme.h"
#import "UIFont+MSTheme.h"

#import "FSTabBarController.h"

@implementation MSThemeManager

#pragma mark - Singleton

+ (instancetype)sharedInstance
{
    static dispatch_once_t pred;
    static id sharedInstance = nil;
    dispatch_once(&pred, ^{
        sharedInstance = [[super alloc] initUniqueInstance];
    });
    
    return sharedInstance;
}

- (instancetype)initUniqueInstance
{
    self = [super init];
    
    if ( self )
    {
        
    }
    
    return self;
}

- (instancetype)copy
{
    return self;
}

- (void)applyAppearance
{
    [self customizeNavigationBar:[UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[UINavigationController class]]]];
    [self customizeTabBar:[UITabBar appearanceWhenContainedInInstancesOfClasses:@[[FSTabBarController class]]]];
}

- (void)customizeNavigationBar:(__kindof UINavigationBar *)navigationBar
{
    [navigationBar setTitleTextAttributes:@{
                                            NSForegroundColorAttributeName : [UIColor ms_navigationTitleColor],
                                            NSFontAttributeName : [UIFont ms_navigationBartTitleFontWithWeight:UIFontWeightBold],
                                            NSKernAttributeName : @(1.f)
                                            }];
}

- (void)customizeTabBar:(__kindof UITabBar *)tabBar
{
    [tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
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
