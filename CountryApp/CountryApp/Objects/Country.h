//
//  Country.h
//  CountryApp
//
//  Created by Artak on 3/23/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Country : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double lat;
@property (nonatomic, assign) double lon;
@property (nonatomic, assign) NSInteger population;
@property (nonatomic, strong) NSString *capital;
@property (nonatomic, strong) NSString *flag;
@property (nonatomic, strong) NSString *subRegion;



-(instancetype) intitWithDict:(NSDictionary *) dict;



@end
