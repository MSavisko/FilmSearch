//
//  NSFetchedResultsController+SearchHistory.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/13/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSFetchedResultsController (SearchHistory)

+ (instancetype)ms_allSearchHistoryFilmsFetchedResultsControllerDelegate:(id<NSFetchedResultsControllerDelegate>)delegate;

@end
