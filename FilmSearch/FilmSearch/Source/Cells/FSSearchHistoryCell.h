//
//  FSSearchHistoryCell.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/13/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FSHistoryItemManagedModel;

@interface FSSearchHistoryCell : UITableViewCell

- (void)addHistoryItem:(FSHistoryItemManagedModel *)historyItem;

@end
