//
//  NSFetchedResultsController+SearchHistory.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/13/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "NSFetchedResultsController+SearchHistory.h"

#import "FSHistoryItemManagedModel.h"
#import "MSDataManager+Private.h"

@implementation NSFetchedResultsController (SearchHistory)

+ (instancetype)ms_allSearchHistoryFilmsFetchedResultsControllerDelegate:(id<NSFetchedResultsControllerDelegate>)delegate
{
    NSFetchRequest *fetchRequest = [FSHistoryItemManagedModel MR_requestAllSortedBy:NSStringFromSelector(@selector(searchDate)) ascending:NO inContext:[MSDataManager sharedInstance].mainContext];


    NSFetchedResultsController *fetchController = [FSHistoryItemManagedModel MR_fetchController:fetchRequest delegate:delegate useFileCache:NO groupedBy:nil inContext:[MSDataManager sharedInstance].mainContext];

    return fetchController;
}

@end
