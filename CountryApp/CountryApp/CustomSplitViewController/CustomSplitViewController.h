//
//  CustomSplitViewController.h
//  CountryApp
//
//  Created by Artak Martirosyan on 4/9/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  Country;

@protocol DetailDelegate
-(void)didSelectCountry:(Country *) country;
@end

@interface CustomSplitViewController : UISplitViewController<UISplitViewControllerDelegate>


@property (nonatomic, nonnull, strong) UIViewController<DetailDelegate> *detailDelegate;
@end
