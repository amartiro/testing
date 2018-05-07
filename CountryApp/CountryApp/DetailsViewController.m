//
//  DetailsViewController.m
//  CountryApp
//
//  Created by Artak on 3/21/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "DetailsViewController.h"
#import "CustomSplitViewController.h"
#import "Country.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didSelectCountry:(Country *)country {
    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(country.lat, country.lon) animated:true];
    [self.mapView setZoomEnabled:true];
}

@end
