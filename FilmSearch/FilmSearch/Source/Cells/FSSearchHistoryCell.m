//
//  FSSearchHistoryCell.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/13/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "FSSearchHistoryCell.h"

#import "FSHistoryItemManagedModel.h"
#import "FSFilmManagedModel.h"

#import "UIColor+MSTheme.h"
#import "UIFont+MSTheme.h"
#import "NSDate+MSTimeAgo.h"

@interface FSSearchHistoryCell ()
@property (weak, nonatomic) IBOutlet UILabel *filmTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *searchDateLabel;

@end

@implementation FSSearchHistoryCell

#pragma mark - Life Cycle

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupUI];
}

- (void) prepareForReuse
{
    [super prepareForReuse];
    
    self.filmTitleLabel.text = nil;
    self.searchDateLabel.text = nil;
}

- (void)setupUI
{
    self.filmTitleLabel.textColor = [UIColor ms_primaryGreyColor];
    self.searchDateLabel.textColor = [UIColor ms_primaryRedColor];

    self.searchDateLabel.font = [UIFont ms_regularFontWithWeight:UIFontWeightRegular];
}

#pragma mark - Public

- (void)addHistoryItem:(FSHistoryItemManagedModel *)historyItem
{
    _filmTitleLabel.text = historyItem.film.title;
    _searchDateLabel.text = [historyItem.searchDate ms_formattedAsTimeAgo];
}

@end
