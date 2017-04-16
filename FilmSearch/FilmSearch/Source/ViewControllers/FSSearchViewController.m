//
//  FSSearchViewController.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/11/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "FSSearchViewController.h"
#import "FSFilmDetailViewController.h"

#import "MSThemeManager.h"
#import "MSRequestManager+Films.h"
#import "MSDataManager+Film.h"
#import "MSDataManager+SearchHistory.h"
#import "MSAlertManager+SearchFilm.h"

#import "UIColor+MSTheme.h"

#import "FSHistoryItemManagedModel.h"
#import "FSHistoryItemManagedModelKeys.h"

typedef NS_ENUM(NSInteger, FSSearchScreenState) {
    FSSearchScreenStateReadyToSearch = 0,
    FSSearchScreenStateSearching,
    FSSearchScreenStateSearchFinished
};

static NSString *const FSFilmDetailSegueIdentifier = @"showFilmDetail";

@interface FSSearchViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (nonatomic) FSSearchScreenState screenState;

@end

@implementation FSSearchViewController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateScreenForState:FSSearchScreenStateReadyToSearch];
    [self setupUI];
}

#pragma mark - Setup

- (void)setupUI
{
    [self setupViews];
    [self setupTextField];
    [self setupButton];
    [self setupNavigation];
}

- (void)setupViews
{
    _activityIndicator.color = [UIColor ms_primaryRedColor];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self.view action:@selector(endEditing:)]];
}

- (void)setupTextField
{
    _searchTextField.delegate = self;
    [[MSThemeManager sharedInstance] customizeTextView:_searchTextField withPlaceholderText:NSLocalizedString(@"Enter film name", @"v1.0")];
}

- (void)setupButton
{
    [_searchButton setTitle:NSLocalizedString(@"Search", @"v1.0") forState:UIControlStateNormal];
}

- (void)setupNavigation
{
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(closeVC)];
    self.title = NSLocalizedString(@"Film Search", @"v1.0");
}

#pragma mark - Update Screen State

- (void)updateScreenForState:(FSSearchScreenState)state
{
    self.screenState = state;

    switch (state) {
        case FSSearchScreenStateSearchFinished:
        case FSSearchScreenStateReadyToSearch:
            _searchButton.hidden = NO;
            _searchTextField.enabled = YES;
            [_activityIndicator stopAnimating];
            break;

        case FSSearchScreenStateSearching:
            [_activityIndicator startAnimating];
            _activityIndicator.hidden = NO;
            _searchButton.hidden = YES;
            _searchTextField.enabled = NO;
            break;
    }
}

#pragma mark - Actions

- (void)closeVC
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)searchButtonDidPressed:(id)sender
{

    if (_searchTextField.text.length == 0) {
        [MSAlertManager showAlertWithText:NSLocalizedString(@"Film Search", @"v1.0") andTitle:NSLocalizedString(@"Film title could not be empty", @"v1.0")];
        return;
    }

    [self updateScreenForState:FSSearchScreenStateSearching];

    //Try to find film in DB.
    NSString *filmId = [MSDataManager fetchFilmIdByTitle:[_searchTextField.text copy]];
    if (filmId && filmId.length) {
        [self showDetailWithFilmId:filmId];
        return;
    }

    //Request film from API
    [self requestFilmWithTitle:_searchTextField.text];
}

- (void)requestFilmWithTitle:(NSString *)filmTitle
{
    __weak typeof(self) wSelf = self;
    [[MSRequestManager sharedInstance] findFilmByName:_searchTextField.text
                                        andCompletion:^(MSRequestResponse *response) {
                                            if (response.isSuccess) {
                                                if ([MSRequestResponse isFilmExistInInfo:response.object]) {
                                                    NSDictionary *changes = [FSHistoryItemManagedModel representationWithSearchTitle:filmTitle andFilmInfo:response.object];
                                                    [wSelf didReceiveValidResponseWithInfo:changes];
                                                } else {
                                                    [MSAlertManager showAlertForFilmSearchResponse:response];
                                                }
                                            } else {
                                                [MSAlertManager showAlertForFilmSearchResponse:response];
                                            }
                                            [wSelf updateScreenForState:FSSearchScreenStateSearchFinished];
                                        }];
}

- (void)didReceiveValidResponseWithInfo:(NSDictionary *)info
{
    NSString *filmId = [MSRequestResponse filmIdFromInfo:info];

    __weak typeof(self) wSelf = self;
    [MSDataManager updateSearchHistoryWithChanges:info
                                        inContext:nil
                                       completion:^{
                                           [wSelf showDetailWithFilmId:filmId];
                                       }];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:FSFilmDetailSegueIdentifier]) {
        FSFilmDetailViewController *filmDetailVc = [segue destinationViewController];
        filmDetailVc.filmId = sender;
    }
}

- (void)showDetailWithFilmId:(NSString *)filmId
{
    [self performSegueWithIdentifier:FSFilmDetailSegueIdentifier sender:filmId];
    [self updateScreenForState:FSSearchScreenStateSearchFinished];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    //New text
    NSString *newString = [[textField text] stringByReplacingCharactersInRange:range withString:string];

    //Validation for first symbol space
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    if (textField.text.length == 0 && [newString stringByTrimmingCharactersInSet:set].length == 0) {
        return NO;
    }

    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self searchButtonDidPressed:nil];
    return YES;
}

@end
