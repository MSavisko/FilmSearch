//
//  FSBorderedButton.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/12/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "FSBorderedButton.h"
#import "MSThemeManager+Controls.h"

@implementation FSBorderedButton

#pragma mark - Initialization

- (void) awakeFromNib
{
    [super awakeFromNib];
    
    [self setupUI];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if ( self )
    {
        [self setupUI];
    }
    
    return self;
}

#pragma mark - Private

- (void) setupUI
{
    self.exclusiveTouch = YES;
    
    [self updateButtonTheme];
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    
    [self updateButtonTheme];
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    
    [self updateButtonTheme];
}

- (void) updateButtonTheme
{
    [[MSThemeManager sharedInstance] customizeButton:self];
}

@end
