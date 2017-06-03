//
//  MainUIViewController.m
//  Meditation
//
//  Created by oyty on 6/3/17.
//  Copyright © 2017 oyty. All rights reserved.
//

#import "MainUIViewController.h"

@interface MainUIViewController ()

@property (weak, nonatomic) IBOutlet UILabel *num;

@end

@implementation MainUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.num.text = @"545";
    
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
