//
//  RegionsViewController.m
//  CountryApp
//
//  Created by Artak on 3/22/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "RegionsViewController.h"
#import "CountryTableViewCell.h"
#import "SubregionsViewController.h"

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
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Regions" ofType:@"plist"];
    self.regionDict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
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
  
    cell.textLabel.text = [self.regionDict.allKeys objectAtIndex:indexPath.row];
    
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
    
    [self performSegueWithIdentifier:@"regionToSubregions" sender:nil];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"regionToSubregions"]) {
        NSLog(@"You got it");
        SubregionsViewController * viewController = segue.destinationViewController;
        viewController.region = self.regionDict.allKeys[self.selectedIndex];
        viewController.subregions = self.regionDict[viewController.region];
    }
}

@end
