//
//  CandyLandListTableViewController.m
//  CandyLand
//
//  Created by Luke Solomon on 9/17/14.
//  Copyright (c) 2014 Luke Solomon. All rights reserved.
//

#import "CandyLandListTableViewController.h"
#import "CandyDetailViewController.h"
#import "Candy.h"

@interface CandyLandListTableViewController ()

@end

@implementation CandyLandListTableViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _candies = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.candies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CandyCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.candies[indexPath.row] title];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.candies removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"ShowCandy"]) {
        
        CandyDetailViewController *candyDetailViewController = [segue destinationViewController];
        
        NSIndexPath *selectedIndexPath = self.tableView.indexPathForSelectedRow;
        
        candyDetailViewController.candy = self.candies[selectedIndexPath.row];
        
    } else if ([segue.identifier isEqualToString:@"AddCandy"]) {
        
        Candy *candy = [Candy new];
        
        [self.candies addObject:candy];
        
        CandyDetailViewController *candyDetailViewController = [segue destinationViewController];
        
        candyDetailViewController.candy = candy;
        
    }
    
}
@end
