//
//  NSIndexPath+MSExstension.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/13/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "NSIndexPath+MSExstension.h"

@implementation NSIndexPath (MSExstension)

- (BOOL)isEqualToIndexPath:(NSIndexPath *)indexPath
{
    if (!indexPath) {
        return NO;
    }

    return self.section == indexPath.section && self.row == indexPath.row;
}

- (NSString *)ms_humanReadableString
{
    return [NSString stringWithFormat:@"Item %@, Section %@", @(self.row), @(self.section)];
}

+ (NSArray<NSIndexPath *> *)ms_indexPathsForIndexes:(NSIndexSet *)indexes inSection:(NSInteger)section
{
    if (!indexes.count) {
        return [NSArray array];
    }

    NSMutableArray *indexPaths = [NSMutableArray array];

    [indexes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *_Nonnull stop) {

        [indexPaths addObject:[self indexPathForRow:idx inSection:section]];
    }];

    return [indexPaths copy];
}

@end
