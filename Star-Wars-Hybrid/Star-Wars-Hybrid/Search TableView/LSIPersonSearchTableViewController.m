//
//  LSIPersonSearchTableViewController.m
//  Hybrid Star Wars Search
//
//  Created by Spencer Curtis on 1/28/19.
//  Copyright © 2019 Spencer Curtis. All rights reserved.
//

#import "LSIPersonSearchTableViewController.h"
#import "LSIPerson.h"
#import "Star_Wars_Hybrid-Swift.h"

@interface LSIPersonSearchTableViewController () <UISearchBarDelegate>

@property (nonatomic) NSArray<LSIPerson *> *people;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation LSIPersonSearchTableViewController

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
	// TODO: Implement number of rows
	
	return self.people.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	
	// TODO: Implement a custom cell named PersonTableViewCell.swift
	
	PersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonCell" forIndexPath:indexPath];
    
    LSIPerson *person = [self.people objectAtIndex:indexPath.row];
    cell.person = person;
	
    return cell;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [LSIPersonController.sharedController searchForPeopleWithSearchTerm:searchBar.text completionHandler:^(NSArray<LSIPerson *> *people, NSError *error) {
        if (error) {
            NSLog(@"Error searching for %@: %@", searchBar.text, error);
        }
        //no main.queue here because we are doing it when calling fetch method in PersonController
        self.people = people;
        [self.tableView reloadData];
    }];
}

@end
