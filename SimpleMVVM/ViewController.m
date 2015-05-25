//
//  ViewController.m
//  SimpleMVVM
//
//  Created by Rafael on 18/05/15.
//  Copyright (c) 2015 RightCloud. All rights reserved.
//

#import "ViewController.h"
#import "ViewModel.h"
#import "Model.h"

@interface ViewController ()

@property (strong, nonatomic) ViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // shared ViewModel instance intialization
    // without KVC/KVO (first commit) the data would have been loaded inside the ViewModel class
    self.viewModel = [ViewModel sharedInstanceWithViewController:self];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // observing the property for changes
    [self.viewModel.model addObserver:self forKeyPath:@"dataArray" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    // removing the observer
    [self.viewModel.model removeObserver:self forKeyPath:@"dataArray"];
}

#pragma mark - tableview controller

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text = [self.data objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - observer
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSLog(@"new data: %@", change);
    self.data = [change objectForKey:@"new"];
    [self.tableView reloadData];
}

@end
