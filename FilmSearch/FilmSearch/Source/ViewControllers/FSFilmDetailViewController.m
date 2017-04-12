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
    // Do any additional setup after loading the view.
}

#pragma mark - UI

- (void) updateViewInfo
{
    
}

#pragma mark - Properties

- (void)setFilm:(FSFilmManagedModel *)film
{
    _film = film;
    
    [self updateViewInfo];
    
    self.title = [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"Detail:", @"v1.0"), film.title];
    
}

- (void)setFilmId:(NSString *)filmId
{
    NSString *previousFilmdId = [self.filmId copy];
    
    if ( !previousFilmdId || ![previousFilmdId isEqualToString:filmId])
    {
        self.film = [MSDataManager fetchFilmById:filmId inContext:nil];
    }
}


@end
