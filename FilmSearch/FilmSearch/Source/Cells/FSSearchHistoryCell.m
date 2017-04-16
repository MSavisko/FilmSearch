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

NSString *const FSHistoryCellIdentifier = @"searchHistoryCell";
CGFloat const FSHistoryCellDefaultHeight = 60;

@interface FSSearchHistoryCell ()
@property (weak, nonatomic) IBOutlet UILabel *filmTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *searchDateLabel;

@end

@implementation FSSearchHistoryCell

#pragma mark - Public

- (void)addHistoryItem:(FSHistoryItemManagedModel *)historyItem
{
    _filmTitleLabel.text = historyItem.film.title;
    _searchDateLabel.text = [historyItem.searchDate ms_formattedAsTimeAgo];
}

#pragma mark - Life Cycle

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupUI];
}

- (void)prepareForReuse
{
    [super prepareForReuse];

    self.filmTitleLabel.text = nil;
    self.searchDateLabel.text = nil;
}

- (void)setupUI
{
    self.filmTitleLabel.textColor = [UIColor ms_historyCellTitleColor];
    self.searchDateLabel.textColor = [UIColor ms_historyCellSearchDateColor];

    self.searchDateLabel.font = [UIFont ms_regularFontWithWeight:UIFontWeightRegular];
}

@end
