//
//  CountriesViewController.m
//  CountryApp
//
//  Created by Artak on 3/21/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "CountriesViewController.h"
#import "CountryTableViewCell.h"
#import "ViewController.h"
#import "NetworkManager.h"
#import "Country.h"
#import "DetailsViewController.h"

@interface CountriesViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *countriesTableView;
@property (strong, nonatomic) NSMutableArray *countries;
@property (nonatomic, assign) NSInteger selectedIndex;



@end

@implementation CountriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.countries = [NSMutableArray array];
    UINib *cellNib = [UINib nibWithNibName:@"CountryTableViewCell" bundle:nil];

    [self.countriesTableView registerNib:cellNib forCellReuseIdentifier:@"CountryTableViewCell"];
    self.countriesTableView.tableFooterView = [[UIView alloc] init];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    
    [[NetworkManager sharedManager] getCountriesForRegion:self.region success:^(id responseObject) {
        [self.countries removeAllObjects];
        NSArray * countriesArray = [NSArray arrayWithArray:responseObject];
        for (int i =0; i < countriesArray.count; ++i){
            NSDictionary * countryDict = countriesArray[i];
            Country * country = [[Country alloc] intitWithDict:countryDict];
            [self.countries addObject:country];
        }
        [self.countriesTableView reloadData];
        // Allow User Access and load content
        //[self loadContent];
    } failure:^(NSString *failureReason, NSInteger statusCode) {
        // Logout user if logged in and deny access and show login view
        //[self showLoginView];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    Country * country = self.countries[indexPath.row];
    CountryTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"CountryTableViewCell"];
    cell.nameLabel.text = country.name;
 //   NSData * imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:country.flag]];
    NSURLRequest * request =  [NSURLRequest requestWithURL:[NSURL URLWithString:country.flag]] ;
    [cell.webView loadRequest:request];
    cell.webView.scrollView.maximumZoomScale = 0.4;
    cell.webView.scrollView.minimumZoomScale = 0.4;
    cell.webView.scrollView.zoomScale = 0.4;
    cell.webView.userInteractionEnabled = false;
    cell.webView.scalesPageToFit = true;

    
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
    
    
    
    [self showLoaction]; //NSLog(NSStringFromCGRect(self.navigationController.splitViewController.view.frame));
   // ViewController *viewController =  [[ViewController alloc] init];
   // [self.navigationController pushViewController:viewController animated:true];
}

-(void) showLoaction{
    Country * country = self.countries[self.selectedIndex];
    UISplitViewController * splitController = self.navigationController.splitViewController;
    if (splitController.viewControllers.count > 1) {
    //    UINavigationController * detailNavControler = splitController.viewControllers[1];
   //     DetailsViewController * detailController1 = (DetailsViewController *)detailNavControler.viewControllers[0];
        
        DetailsViewController * detailController = splitController.viewControllers[1];//(DetailsViewController *)detailNavControler.viewControllers[0];
        [detailController showLoaction:country.lat  andLongitude:country.lon];
    } else {
        [self performSegueWithIdentifier:@"countryToMap" sender:nil];
    }
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"countryToMap"]) {
        Country * country = self.countries[self.selectedIndex];

        DetailsViewController * viewController = segue.destinationViewController;
        [viewController showLoaction:country.lat  andLongitude:country.lon];        
    }
    
    
}

@end
