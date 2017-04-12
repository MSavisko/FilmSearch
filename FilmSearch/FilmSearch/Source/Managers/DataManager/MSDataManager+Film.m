//
//  MSDataManager+Film.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/12/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "MSDataManager+Film.h"
#import "MSDataManager+Private.h"
#import "FSFilmManagedModel.h"

@implementation MSDataManager (Film)

+ (nullable FSFilmManagedModel *) fetchFilmByImdbId:(NSString *) imdbId inContext:(nullable NSManagedObjectContext *)context
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", NSStringFromSelector(@selector(imdbId)), imdbId];
    
    return [self fetchFilmByPredicate:predicate inContext:context];
}

+ (nullable FSFilmManagedModel *) fetchFilmById:(NSString *) filmId inContext:(nullable NSManagedObjectContext *)context
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", NSStringFromSelector(@selector(dataId)), filmId];
    
    return [self fetchFilmByPredicate:predicate inContext:context];
}

+ (NSArray <FSFilmManagedModel *> *) fetchFilmsByTitle:(NSString *) filmTitle inContext:(nullable NSManagedObjectContext *)context
{
    NSManagedObjectContext *_context = context? : [[self sharedInstance] mainContext];
    
    //Match
    NSPredicate *matchPredicate = [NSPredicate predicateWithFormat:@"%K MATCHES[cd] %@", NSStringFromSelector(@selector(title)), filmTitle];
    
    NSArray <FSFilmManagedModel *> *matchResult = [FSFilmManagedModel MR_findAllWithPredicate:matchPredicate inContext:_context];
    
    if (matchResult.count > 0)
    {
        return matchResult;
    }
    
    //Contains
    NSPredicate *containtPredicate = [NSPredicate predicateWithFormat:@"%K CONTAINS[cd] %@", NSStringFromSelector(@selector(title)), filmTitle];
    NSArray <FSFilmManagedModel *> *containtResult = [FSFilmManagedModel MR_findAllWithPredicate:containtPredicate inContext:_context];
    
    return containtResult;
}

+ (NSArray <NSString *> *) fetchFilmsIdsByTitle:(NSString *) filmTitle inContext:(nullable NSManagedObjectContext *)context
{
    NSManagedObjectContext *_context = context? : [[self sharedInstance] mainContext];
    
    //Match
    NSPredicate *matchPredicate = [NSPredicate predicateWithFormat:@"%K MATCHES[cd] %@", NSStringFromSelector(@selector(title)), filmTitle];
    
    NSFetchRequest *matchFetchRequest = [FSFilmManagedModel MR_requestAllWithPredicate:matchPredicate inContext:_context];
    matchFetchRequest.propertiesToFetch = @[NSStringFromSelector(@selector(dataId))];
    matchFetchRequest.resultType = NSDictionaryResultType;
    
    NSArray *matchResults = [FSFilmManagedModel MR_executeFetchRequest:matchFetchRequest inContext:_context];
    
    NSString *keyPath = [NSString stringWithFormat:@"@unionOfObjects.%@", NSStringFromSelector(@selector(dataId))];
    
    if (matchResults.count > 0)
    {
        return [matchResults valueForKeyPath:keyPath];
    }
    
    //Contains
    NSPredicate *containtPredicate = [NSPredicate predicateWithFormat:@"%K CONTAINS[cd] %@", NSStringFromSelector(@selector(title)), filmTitle];
    
    NSFetchRequest *containtFetchRequest = [FSFilmManagedModel MR_requestAllWithPredicate:containtPredicate inContext:_context];
    containtFetchRequest.propertiesToFetch = @[NSStringFromSelector(@selector(dataId))];
    containtFetchRequest.resultType = NSDictionaryResultType;
    
    NSArray *containtResults = [FSFilmManagedModel MR_executeFetchRequest:containtFetchRequest inContext:_context];
    
    return containtResults.count > 0 ? [containtResults valueForKey:keyPath] : nil;
}

#pragma mark - Private

+ (nullable FSFilmManagedModel *) fetchFilmByPredicate:(NSPredicate *) predicate inContext:(nullable NSManagedObjectContext *)context
{
    return [FSFilmManagedModel MR_findFirstWithPredicate:predicate inContext:context? : [[self sharedInstance] mainContext]];
}

@end
