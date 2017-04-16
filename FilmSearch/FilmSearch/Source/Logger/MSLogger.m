//
//  MSLogger.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/10/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "MSLogger.h"
#import "MSLoggerDefines.h"

@interface MSLogger () {
    BOOL _loggerStarted;
}

@property (nonatomic, strong) DDFileLogger *fileLogger;

@end

@implementation MSLogger

#pragma mark - Singleton

+ (instancetype)sharedInstance
{
    static dispatch_once_t pred;
    static id sharedInstance = nil;
    dispatch_once(&pred, ^{
        sharedInstance = [[super alloc] initUniqueInstance];
    });

    return sharedInstance;
}

- (instancetype)initUniqueInstance
{
    self = [super init];

    if (self) {
    }

    return self;
}

- (id)copy
{
    return self;
}


#pragma mark - Public

+ (void)startLogging
{
    [[self sharedInstance] startLogging];
}

+ (void)stopLogging
{
    [[self sharedInstance] stopLogging];
}

+ (void)flushLogs
{
    [[self sharedInstance] flushLogs];
}


#pragma mark - Private

- (DDFileLogger *)fileLogger
{
    if (!_fileLogger) {
        _fileLogger = [DDFileLogger new];
        _fileLogger.maximumFileSize = 0;            //1024 * 1024 * 5;	// 5MB
        _fileLogger.rollingFrequency = 60 * 60 * 6; // 6h
        _fileLogger.logFileManager.maximumNumberOfLogFiles = 20;
    }

    return _fileLogger;
}

- (void)startLogging
{
    if (_loggerStarted && _fileLogger) {
        return;
    }

    _loggerStarted = YES;

    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];

    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [DDLog addLogger:self.fileLogger];


    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]
                                     backgroundColor:[UIColor colorWithRed:0.502 green:0.0 blue:0.0 alpha:1.0]
                                             forFlag:DDLogFlagError];

    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor colorWithRed:1.0 green:0.502 blue:0.0 alpha:1.0]
                                     backgroundColor:nil
                                             forFlag:DDLogFlagWarning];

    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor colorWithRed:0.4 green:0.4 blue:1.0 alpha:1.0]
                                     backgroundColor:nil
                                             forFlag:DDLogFlagVerbose];

    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor colorWithRed:0.0 green:0.502 blue:0.0 alpha:1.0]
                                     backgroundColor:nil
                                             forFlag:DDLogFlagInfo];

    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor colorWithRed:0.502 green:0.502 blue:0.0 alpha:1.0]
                                     backgroundColor:nil
                                             forFlag:DDLogFlagDebug];


    MSLogDebug(@"Logger started");

    [self commonLogs];
}

- (void)stopLogging
{
    if (!_loggerStarted && _fileLogger) {
        return;
    }

    _loggerStarted = NO;

    [DDLog removeAllLoggers];
    _fileLogger = nil;
    [self flushLogs];

    NSLog(@"Logger stopped");
}

- (void)flushLogs
{
    [DDLog flushLog];
}

- (void)commonLogs
{
    MSLogVerbose(@"App Version %@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]);
    MSLogVerbose(@"App Build %@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]);

    MSLogVerbose(@"Logs directory %@", [_fileLogger.logFileManager logsDirectory]);
}


@end

