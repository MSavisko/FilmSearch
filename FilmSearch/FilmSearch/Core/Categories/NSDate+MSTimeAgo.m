//
//  NSDate+MSTimeAgo.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/13/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "NSDate+MSTimeAgo.h"

#define SECOND 1
#define MINUTE (SECOND * 60)
#define HOUR (MINUTE * 60)
#define DAY (HOUR * 24)
#define WEEK (DAY * 7)
#define MONTH (DAY * 31)
#define YEAR (DAY * 365.24)

@implementation NSDate (MSTimeAgo)

- (NSString *)ms_formattedAsTimeAgo
{

    NSDate *now = [NSDate date];
    NSTimeInterval secondsSince = -(int)[self timeIntervalSinceDate:now];

    if (secondsSince < 0)
        return NSLocalizedString(@"future", @"v1.0");

    if (secondsSince < MINUTE)
        return @"now";

    if (secondsSince < HOUR) {
        int minutesSince = (int)secondsSince / MINUTE;
        return [NSString stringWithFormat:@"%d min", minutesSince];
    }

    if (secondsSince < DAY) {
        int hoursSince = (int)secondsSince / HOUR;
        return [NSString stringWithFormat:@"%d h", hoursSince];
    }

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    [dateFormatter setTimeStyle:NO];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];

    return [dateFormatter stringFromDate:self];
}

@end
