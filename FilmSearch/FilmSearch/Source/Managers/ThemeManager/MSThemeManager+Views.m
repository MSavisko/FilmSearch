//
//  MSThemeManager+Views.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/16/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "MSThemeManager+Views.h"
#import "UIColor+MSTheme.h"
#import "UIFont+MSTheme.h"

@implementation MSThemeManager (Views)

- (void)customizeTextView:(__kindof UITextField *)textField
{
    [self customizeTextView:textField withPlaceholderText:nil];
}

- (void)customizeTextView:(__kindof UITextField *)textField withPlaceholderText:(NSString *)placeholderText
{
    textField.layer.cornerRadius = 8.0f;
    textField.layer.masksToBounds = YES;
    textField.layer.borderColor = [[UIColor ms_textFieldBorderColor] CGColor];
    textField.layer.borderWidth = 1.0f;

    [textField setTintColor:[UIColor ms_primaryRedColor]];
    [textField setTextColor:[UIColor ms_primaryRedColor]];

    if (placeholderText.length > 0) {
        textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholderText attributes:@{NSForegroundColorAttributeName : [UIColor ms_primaryGreyColor], NSFontAttributeName : [UIFont ms_regularFontWithWeight:UIFontWeightRegular]}];
    }
}

@end
