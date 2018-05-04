//
//  Country.m
//  CountryApp
//
//  Created by Artak on 3/23/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "Country.h"

@implementation Country

-(instancetype) intitWithDict:(NSDictionary *) dict{
    if (self) {
        self.name = [dict objectForKey:@"Name"];
        self.flag = [dict objectForKey:@"FlagPng"];
        self.lat = [[dict objectForKey:@"Latitude"] doubleValue];
        self.lon = [[dict objectForKey:@"Longitude"] doubleValue];
        
        
//        NSArray *latlong = [dict objectForKey:@"latlng"];
//        if (latlong != nil && latlong.count > 1) {
//            self.lat = [[latlong objectAtIndex:0] doubleValue];
//            self.lon = [[latlong objectAtIndex:1] doubleValue];
//        }

    }

    return self;
}

@end
