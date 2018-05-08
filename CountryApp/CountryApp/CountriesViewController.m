//
//  CountriesViewController.m
//  CountryApp
//
//  Created by Artak on 3/21/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "CountriesViewController.h"
#import "CountryTableViewCell.h"
#import "LoginViewController.h"
#import "Country.h"
#import "DetailsViewController.h"
#import "AppDelegate.h"
#import "CustomSplitViewController.h"
#import "CountriesModel.h"

#import <SVProgressHUD.h>
#import <UIKit+AFNetworking.h>

@interface CountriesViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *countriesTableView;
@property (strong, nonatomic) NSMutableArray *countries;
@property (nonatomic, assign) NSInteger selectedIndex;

@end

@implementation CountriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.region;

    NSString *cellName = @"CountryTableViewCell";
    self.countries = [NSMutableArray array];
    UINib *cellNib = [UINib nibWithNibName:cellName bundle:nil];

    [self.countriesTableView registerNib:cellNib forCellReuseIdentifier:cellName];
    self.countriesTableView.tableFooterView = [[UIView alloc] init];

    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    self.region = @"Americas";
    self.subregion = @"Central%20America";
    [[CountriesModel sharedManager] getCountriesForRegion:self.region andSubRegion:self.subregion  success:^(NSArray<Country *> *countries) {
        [self.countries removeAllObjects];
        [self.countries addObjectsFromArray:countries];
        [self.countriesTableView reloadData];
    } failure:^(NSString *failureReason, NSInteger statusCode) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    Country * country = self.countries[indexPath.row];
    CountryTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"CountryTableViewCell"];
    cell.nameLabel.text = country.name;
    
    [cell.flagView setImageWithURL:[NSURL URLWithString:country.flag] placeholderImage:[UIImage imageNamed:@"flag_placeholder.png"]];

    return  cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  70.0;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.countries.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedIndex = indexPath.row;
    
    [self showLoaction];
}

-(void) showLoaction{
    Country * country = self.countries[self.selectedIndex];
    
    CustomSplitViewController * splitController = (CustomSplitViewController *)self.navigationController.splitViewController;
    UIViewController<DetailDelegate>* detailController = splitController.detailDelegate;
    [detailController didSelectCountry:country];
    
    [splitController showDetailViewController:detailController sender:nil];
}

@end
