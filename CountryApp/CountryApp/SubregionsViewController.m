//
//  SubregionsViewController.m
//  CountryApp
//
//  Created by Artak Martirosyan on 5/10/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "SubregionsViewController.h"
#import "CountriesViewController.h"

@interface SubregionsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *subregionsTableView;
@property (nonatomic, assign) NSInteger selectedIndex;

@end

@implementation SubregionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.region;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [self.subregions objectAtIndex:indexPath.row];
    
    return  cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  70.0;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.subregions.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedIndex = indexPath.row;
    
    [self performSegueWithIdentifier:@"subregionToCountries" sender:nil];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"subregionToCountries"]) {
        NSLog(@"You got it");
        CountriesViewController * viewController = segue.destinationViewController;
        viewController.region = self.region;
        viewController.subregion = self.subregions[self.selectedIndex];
    }
}

@end
