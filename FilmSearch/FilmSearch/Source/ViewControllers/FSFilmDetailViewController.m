//
//  FSFilmDetailViewController.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/12/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "FSFilmDetailViewController.h"

#import "MSDataManager+Film.h"
#import "FSFilmManagedModel.h"
#import "FSFilmManagedModelKeys.h"

#import <KVOController/NSObject+FBKVOController.h>
#import <SDWebImage/UIImageView+WebCache.h>

#import "UIColor+MSTheme.h"
#import "UIFont+MSTheme.h"

NSString *const FSBaseViewControllerIdentifier = @"FSFilmDetail";

@interface FSFilmDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *filmTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *filmPosterImageView;
@property (weak, nonatomic) IBOutlet UILabel *filmReleaseLabel;

@property (nonatomic, strong) FSFilmManagedModel *film;

@end

@implementation FSFilmDetailViewController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupUI];
    self.title = NSLocalizedString(@"Film Detail", @"v1.0");
    [self updateViewInfo];
}

#pragma mark - UI

- (void)setupUI
{
    _filmTitleLabel.textColor = [UIColor ms_primaryRedColor];
    _filmReleaseLabel.textColor = [UIColor ms_primaryRedColor];
    _filmTitleLabel.font = [UIFont ms_regularFontWithWeight:UIFontWeightMedium];
    _filmReleaseLabel.font = [UIFont ms_regularFontWithWeight:UIFontWeightMedium];
}

- (void)updateViewInfo
{
    self.filmTitleLabel.text = _film.title;
    [self.filmPosterImageView sd_setImageWithURL:[NSURL URLWithString:_film.posterUrl] placeholderImage:[FSFilmManagedModel placeholder]];

    self.filmReleaseLabel.text = self.film.releaseDate ? self.film.stringReleaseDate : NSLocalizedString(@"N/A", @"v1.0");
}

#pragma mark - Properties

- (void)setFilm:(FSFilmManagedModel *)film
{
    [self.KVOController unobserveAll];

    _film = film;

    [self updateViewInfo];

    if (_film) {
        [self.KVOController observe:_film keyPath:NSStringFromSelector(@selector(posterUrl)) options:NSKeyValueObservingOptionNew action:@selector(updateViewInfo)];
        [self.KVOController observe:_film keyPath:NSStringFromSelector(@selector(releaseDate)) options:NSKeyValueObservingOptionNew action:@selector(updateViewInfo)];
        [self.KVOController observe:_film keyPath:NSStringFromSelector(@selector(title)) options:NSKeyValueObservingOptionNew action:@selector(updateViewInfo)];
    }
}

- (void)setFilmId:(NSString *)filmId
{
    NSString *previousFilmdId = [self.filmId copy];

    if (!previousFilmdId || ![previousFilmdId isEqualToString:filmId]) {
        self.film = [MSDataManager fetchFilmById:filmId inContext:nil];
    }
}


@end
