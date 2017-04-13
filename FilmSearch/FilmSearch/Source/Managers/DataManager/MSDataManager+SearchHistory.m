//
//  MSDataManager+SearchHistory.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/12/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "MSDataManager+SearchHistory.h"
#import "MSDataManager+User.h"
#import "MSDataManager+Private.h"
#import "MSDataManager+Film.h"

#import "FSUserManagedModel.h"
#import "FSHistoryItemManagedModel.h"
#import "FSFilmManagedModel.h"

#import "FSHistoryItemManagedModelKeys.h"
#import "FSFilmManagedModelKeys.h"

@implementation MSDataManager (SearchHistory)

+ (void) updateSearchHistoryWithChanges:(NSDictionary *)changes completion:(nullable MSDataManagerVoidCompletionBlock)completion
{
    [self updateSearchHistoryWithChanges:changes inContext:nil completion:completion];
}

+ (void) updateSearchHistoryWithChanges:(NSDictionary *)changes inContext:(nullable NSManagedObjectContext *) context completion:(nullable MSDataManagerVoidCompletionBlock)completion
{
    MSDataManagerExecuteOnContextBlock executionBlock = ^(NSManagedObjectContext *_Nonnull localContext)
    {
        //Trying to find film in DB
        NSString * filmImdbId = [[changes valueForKey:FSHistoryItemFilmKey] valueForKey:FSFilmImdbIdKey];
        
        FSFilmManagedModel *film = nil;
        
        if (filmImdbId.length > 0)
        {
            film = [MSDataManager fetchFilmByImdbId:filmImdbId inContext:localContext];
        }
        
        FSHistoryItemManagedModel *historyItem = nil;
        
        //Update film
        if (film)
        {
            film = [EKManagedObjectMapper fillObject:film fromExternalRepresentation:[changes valueForKey:FSHistoryItemFilmKey] withMapping:[FSFilmManagedModel objectMapping] inManagedObjectContext:localContext];
            
            NSMutableDictionary *historyChanges = [changes mutableCopy];
            [historyChanges removeObjectsForKeys:@[FSHistoryItemFilmKey]];
            
            //Create history
            historyItem = [EKManagedObjectMapper objectFromExternalRepresentation:historyChanges withMapping:[FSHistoryItemManagedModel objectMapping] inManagedObjectContext:localContext];
            [historyItem setFilm:film];
            
            //Update film
            [film addHistoryObject:historyItem];
        }
        else
        {
            historyItem = [EKManagedObjectMapper objectFromExternalRepresentation:changes
                                                                                                 withMapping:[FSHistoryItemManagedModel objectMapping]
                                                                                      inManagedObjectContext:localContext];
        }
        
        //Add history to user.
        FSUserManagedModel *currentUser = [self currentUserModelInContext:localContext];
        [currentUser addSearchHistoryObject:historyItem];
    };
    
    if (!context)
    {
        [self saveWithBlock:executionBlock completion:completion];
    }
    else
    {
        executionBlock(context);
        
        if (completion)
        {
            completion();
        }
    }
}

@end
