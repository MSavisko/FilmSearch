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
#import "UIImage+MSTheme.h"

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

    if (self) {
    }

    return self;
}

- (instancetype)copy
{
    return self;
}

#pragma mark - Public Methods

- (void)applyAppearance
{
    [self customizeNavigationBar:[UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[ [UINavigationController class] ]]];
    [self customizeTabBar:[UITabBar appearanceWhenContainedInInstancesOfClasses:@[ [FSTabBarController class] ]]];
}

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

- (void)customizeButton:(__kindof UIButton *)button
{
    button.adjustsImageWhenHighlighted = NO;
    button.adjustsImageWhenDisabled = NO;

    UIColor *titleTintColor = [UIColor ms_buttonTextColor];
    UIColor *titleHighlightTintColor = [UIColor ms_buttonBackgroundColor];
    UIColor *imageTintColor = [UIColor ms_buttonTextColor];
    UIColor *imageHighlightTintColor = [UIColor ms_buttonTextColor];
    UIColor *imageDisabledTintColor = [titleTintColor colorWithAlphaComponent:0.48f];

    UIImage *normalImage = [UIImage ms_buttonOutlinedImage];
    UIImage *highlightedImage = [UIImage ms_buttonOutlinedImage];

    [button setTitleColor:titleTintColor forState:UIControlStateNormal];
    [button setTitleColor:titleHighlightTintColor forState:UIControlStateHighlighted];
    [button setTitleColor:titleHighlightTintColor forState:UIControlStateSelected];
    [button setTitleColor:[titleTintColor colorWithAlphaComponent:0.64f] forState:UIControlStateDisabled];

    [button setBackgroundImage:normalImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightedImage forState:UIControlStateSelected];
    [button setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
    [button setBackgroundImage:normalImage forState:UIControlStateDisabled];

    switch (button.state) {
        case UIControlStateNormal: {
            button.tintColor = imageTintColor;
            break;
        }
        case UIControlStateHighlighted: {
            button.tintColor = imageHighlightTintColor;
            ;
            break;
        }
        case UIControlStateDisabled: {
            button.tintColor = imageDisabledTintColor;
            ;
            break;
        }
        case UIControlStateSelected: {
            button.tintColor = imageHighlightTintColor;
            break;
        }
        case UIControlStateFocused: {

            break;
        }
        case UIControlStateApplication: {

            break;
        }
        case UIControlStateReserved: {

            break;
        }

        default: {

            if ((button.state & UIControlStateDisabled) == UIControlStateDisabled) {
                button.tintColor = imageDisabledTintColor;
            }

            break;
        }
    }
}

- (void)customizeTextView:(__kindof UITextField *)textField
{
    [self customizeTextView:textField withPlaceholderText:nil];
}

- (void)customizeTextView:(__kindof UITextField *)textField withPlaceholderText:(NSString *)placeholderText
{
    textField.layer.cornerRadius = 8.0f;
    textField.layer.masksToBounds = YES;
    textField.layer.borderColor = [[UIColor ms_primaryGreyColor] CGColor];
    textField.layer.borderWidth = 1.0f;

    [textField setTintColor:[UIColor ms_primaryRedColor]];
    [textField setTextColor:[UIColor ms_primaryRedColor]];

    if (placeholderText.length > 0) {
        textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholderText attributes:@{NSForegroundColorAttributeName : [UIColor ms_primaryGreyColor], NSFontAttributeName : [UIFont ms_regularFontWithWeight:UIFontWeightRegular]}];
    }
}

@end
