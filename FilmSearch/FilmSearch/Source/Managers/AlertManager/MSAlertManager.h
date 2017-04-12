//
//  MSAlertManager.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/13/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MSAlertManager : NSObject

// clue for improper use (produces compile time error)
+ (instancetype)alloc __attribute__((unavailable("alloc not available, call sharedInstance instead")));
+ (instancetype)new __attribute__((unavailable("new not available, call sharedInstance instead")));
- (instancetype)init __attribute__((unavailable("init not available, call sharedInstance instead")));
- (instancetype)copy __attribute__((unavailable("copy not available, call sharedInstance instead")));

/**
 *  Creates and returns singleton instance
 *
 *  @return Singleton Instance of this class.
 */
+ (instancetype) sharedInstance;

+ (void) showAlertWithText:(nullable NSString *) text andTitle:(nullable NSString *) title;

@end


NS_ASSUME_NONNULL_END
