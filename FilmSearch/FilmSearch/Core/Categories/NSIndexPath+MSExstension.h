//
//  NSIndexPath+MSExstension.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/13/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSIndexPath (MSExstension)

@property (nonatomic, readonly, nonnull) NSString *ms_humanReadableString;

- (BOOL)isEqualToIndexPath:(nullable NSIndexPath *)indexPath;

+ (nonnull NSArray<NSIndexPath *> *)ms_indexPathsForIndexes:(nonnull NSIndexSet *)indexes inSection:(NSInteger)section;

@end
