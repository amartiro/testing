//
//  RegionsViewController.m
//  CountryApp
//
//  Created by Artak on 3/22/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "RegionsViewController.h"
#import "CountryTableViewCell.h"
#import "CountriesViewController.h"

@interface RegionsViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *regionsTableView;
@property (strong, nonatomic) NSDictionary * regionDict;
@property (nonatomic, assign) NSInteger selectedIndex;
@end

@implementation RegionsViewController

-(instancetype) init{
    self = [super init];
   
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
     self.regionDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Europe", @"europe", @"Africa", @"africa", @"Americas", @"americas", @"Asia", @"asia", @"Oceania", @"oceania", nil];
    
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
  
    cell.textLabel.text = [self.regionDict.allValues objectAtIndex:indexPath.row];
    
    return  cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  70.0;
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.regionDict.allValues.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedIndex = indexPath.row;
    [self performSegueWithIdentifier:@"regionToCounties" sender:nil];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"regionToCounties"]) {
        NSLog(@"You got it");
        CountriesViewController * viewController = segue.destinationViewController;
        viewController.region = self.regionDict[self.regionDict.allKeys[self.selectedIndex]];
        
    }
    
    
}
//-(void) performSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
//    if ([identifier isEqualToString:@"regionToCounties"]) {
//        NSLog(@"You got it");
//        CountriesViewController * viewController = segue
//        
//    }
//    
//}

@end
