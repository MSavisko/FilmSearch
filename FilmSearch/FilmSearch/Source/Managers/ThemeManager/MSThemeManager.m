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
