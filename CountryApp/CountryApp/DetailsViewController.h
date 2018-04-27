//
//  DetailsViewController.h
//  CountryApp
//
//  Created by Artak on 3/21/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "CustomSplitViewController.h"

@interface DetailsViewController : UIViewController <DetailDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
