//
//  FSHistoryViewController.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/11/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

@import CoreData;
#import "FSHistoryViewController.h"
#import "FSFilmDetailViewController.h"
#import "FSSearchHistoryCell.h"

#import "FSFilmManagedModel.h"
#import "FSHistoryItemManagedModel.h"

#import "NSFetchedResultsController+SearchHistory.h"
#import "NSIndexPath+MSExstension.h"

@interface FSHistoryViewController () <NSFetchedResultsControllerDelegate, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation FSHistoryViewController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setupTableView];
    [self setupNavigation];
}

#pragma mark - Setup

- (void)setupTableView
{
    self.tableView.tableFooterView = [UIView new];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)setupNavigation
{
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(closeVC)];
    self.title = NSLocalizedString(@"Search history", @"v1.0");
}

#pragma mark - Data

- (void)reloadData
{
    self.fetchedResultsController = nil;
    [self.tableView reloadData];
}

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController) {
        return _fetchedResultsController;
    }

    _fetchedResultsController = [NSFetchedResultsController ms_allSearchHistoryFilmsFetchedResultsControllerDelegate:self];

    NSError *error = nil;
    if (![_fetchedResultsController performFetch:&error]) {
        MSLogDebug(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }

    return _fetchedResultsController;
}


#pragma mark - Actions

- (void)closeVC
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    MSLogDebug(@"controllerWillChangeContent: %@", controller.fetchRequest.predicate);
    [self.tableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    MSLogDebug(@"controllerDidChangeContent: %@", controller.fetchRequest.predicate);
    [self.tableView endUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    switch (type) {
        case NSFetchedResultsChangeInsert: {

            MSLogDebug(@"Insert: %@. IndexPath - %@, NewIndexPath - %@", NSStringFromClass([anObject class]), indexPath.ms_humanReadableString, newIndexPath.ms_humanReadableString);
            [self.tableView insertRowsAtIndexPaths:@[ newIndexPath ] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        }
        case NSFetchedResultsChangeDelete: {

            MSLogDebug(@"Delete: %@. IndexPath - %@, NewIndexPath - %@", NSStringFromClass([anObject class]), indexPath.ms_humanReadableString, newIndexPath.ms_humanReadableString);
            [self.tableView deleteRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        }
        case NSFetchedResultsChangeMove: {

            MSLogDebug(@"Move: %@. IndexPath - %@, NewIndexPath - %@", NSStringFromClass([anObject class]), indexPath.ms_humanReadableString, newIndexPath.ms_humanReadableString);
            if (![indexPath isEqualToIndexPath:newIndexPath]) {
                [self.tableView deleteRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationAutomatic];
                [self.tableView insertRowsAtIndexPaths:@[ newIndexPath ] withRowAnimation:UITableViewRowAnimationAutomatic];
                break;
            }
        }
        case NSFetchedResultsChangeUpdate: {

            MSLogDebug(@"Update: %@. IndexPath - %@, NewIndexPath - %@", NSStringFromClass([anObject class]), indexPath.ms_humanReadableString, newIndexPath.ms_humanReadableString);

            //[self reloadCellAtIndexPath:indexPath withModel:anObject];

            break;
        }
    }
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.fetchedResultsController.fetchedObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FSHistoryItemManagedModel *item = self.fetchedResultsController.fetchedObjects[indexPath.row];

    FSSearchHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searchHistoryCell"];
    [cell addPosition:indexPath.row + 1];
    [cell addHistoryItem:item];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    FSHistoryItemManagedModel *item = self.fetchedResultsController.fetchedObjects[indexPath.row];

    FSFilmDetailViewController *vc = [[UIStoryboard storyboardWithName:@"Search" bundle:nil] instantiateViewControllerWithIdentifier:@"FSFilmDetail"];
    vc.filmId = item.film.dataId;

    [self showViewController:vc sender:nil];
}

@end
