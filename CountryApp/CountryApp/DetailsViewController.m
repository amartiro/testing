//
//  DetailsViewController.m
//  CountryApp
//
//  Created by Artak on 3/21/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.latitude != 0 ||  self.longitutde != 0) {
        [self showLoaction:self.latitude andLongitude:self.longitutde];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) showLoaction:(double) latitude andLongitude:(double) longitutde{
    self.latitude = latitude;
    self.longitutde = longitutde;
    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(latitude, longitutde) animated:true];
    [self.mapView setZoomEnabled:true];
}

@end
