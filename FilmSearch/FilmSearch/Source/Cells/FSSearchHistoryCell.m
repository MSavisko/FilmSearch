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
@property (weak, nonatomic) IBOutlet UILabel *positionLabel;
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

- (void)setupUI
{
    self.positionLabel.textColor = [UIColor ms_primaryRedColor];
    self.filmTitleLabel.textColor = [UIColor ms_primaryBlackColor];
    self.searchDateLabel.textColor = [UIColor ms_primaryBlackColor];

    self.searchDateLabel.font = [UIFont ms_regularFontWithWeight:UIFontWeightRegular];
}

#pragma mark - Public

- (void)addPosition:(NSInteger)position
{
    _positionLabel.text = [NSString stringWithFormat:@"%d", (int)position];
}

- (void)addHistoryItem:(FSHistoryItemManagedModel *)historyItem
{
    _filmTitleLabel.text = historyItem.film.title;
    _searchDateLabel.text = [historyItem.searchDate ms_formattedAsTimeAgo];
}

@end
