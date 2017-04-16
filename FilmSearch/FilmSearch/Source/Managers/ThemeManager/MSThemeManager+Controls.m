//
//  MSThemeManager+Controls.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/16/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "MSThemeManager+Controls.h"

#import "UIColor+MSTheme.h"
#import "UIImage+MSTheme.h"

@implementation MSThemeManager (Controls)

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

@end
