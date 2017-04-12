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

+ (NSArray <FSFilmManagedModel *> *) fetchFilmsByTitle:(NSString *) filmTitle inContext:(nullable NSManagedObjectContext *)context
{
    NSManagedObjectContext *_context = context? : [[self sharedInstance] mainContext];
    
    NSPredicate *matchPredicate = [NSPredicate predicateWithFormat:@"%K MATCHES[cd] %@", NSStringFromSelector(@selector(title)), filmTitle];
    
    NSArray <FSFilmManagedModel *> *matchResult = [FSFilmManagedModel MR_findAllWithPredicate:matchPredicate inContext:_context];
    
    if (matchResult.count > 0)
    {
        return matchResult;
    }
    
    NSPredicate *containtPredicate = [NSPredicate predicateWithFormat:@"%K CONTAINS[cd] %@", NSStringFromSelector(@selector(title)), filmTitle];
    NSArray <FSFilmManagedModel *> *containtResult = [FSFilmManagedModel MR_findAllWithPredicate:containtPredicate inContext:_context];
    
    return containtResult;
}

@end
