//
//  SecondViewController.m
//  MetoringTestApp
//
//  Created by Artak on 3/14/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [NSNotificationCenter.defaultCenter postNotificationName:@"Samo" object:nil];
        NSLog(@"Running on %@ thread", [NSThread currentThread]);
        NSLog(@"SecondViewController post\n");
  //  });
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

@end
