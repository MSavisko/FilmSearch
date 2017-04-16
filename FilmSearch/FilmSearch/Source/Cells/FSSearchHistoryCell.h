//
//  FSSearchHistoryCell.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/13/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FSHistoryItemManagedModel;

NS_ASSUME_NONNULL_BEGIN

extern NSString *const FSHistoryCellIdentifier;
extern CGFloat const FSHistoryCellDefaultHeight;

@interface FSSearchHistoryCell : UITableViewCell

- (void)addHistoryItem:(FSHistoryItemManagedModel *)historyItem;

@end

NS_ASSUME_NONNULL_END
