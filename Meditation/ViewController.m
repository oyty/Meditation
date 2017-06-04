//
//  ViewController.m
//  Meditation
//
//  Created by oyty on 6/3/17.
//  Copyright © 2017 oyty. All rights reserved.
//

#import "ViewController.h"
#import "MainUIViewController.h"

NSArray *array;
UILabel *contentLabel;

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
 
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"infotobe" ofType:@"plist"];
    array = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
    NSLog(@"%@", array[0]);
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(114, 31, 92, 21)];
    titleLabel.text = @"Meditation";
    titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:18];
    titleLabel.textAlignment = UITextAlignmentCenter;
    titleLabel.textColor = [UIColor blackColor];
    [self.view addSubview:titleLabel];
    
    UILabel *firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(82, 115, 30, 30)];
    firstLabel.text = @"第";
    firstLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:14];
    firstLabel.textAlignment = UITextAlignmentCenter;
    firstLabel.textColor = [UIColor blackColor];
    [self.view addSubview:firstLabel];
    
    UILabel *secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(198, 115, 30, 30)];
    secondLabel.text = @"天";
    secondLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:14];
    secondLabel.textAlignment = UITextAlignmentCenter;
    secondLabel.textColor = [UIColor blackColor];
    [self.view addSubview:secondLabel];
    
    UILabel *dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 110, 70, 40)];
    dayLabel.text = @"234";
    dayLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:28];
    dayLabel.textAlignment = UITextAlignmentCenter;
    dayLabel.textColor = [UIColor blueColor];
    [self.view addSubview:dayLabel];
    
    
    contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 150, 270, 150)];
    contentLabel.text = array[0];
    contentLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
    contentLabel.textColor = [UIColor grayColor];
    contentLabel.lineBreakMode = UILineBreakModeWordWrap;
    contentLabel.numberOfLines = 0;
    [self.view addSubview:contentLabel];
    
    UIButton *randomAction = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGRect rect =  CGRectMake(100, 310, 100, 50);
    randomAction.frame = rect;
    [randomAction setTitle:@"Random" forState:UIControlStateNormal];
//    randomAction.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
//    [randomAction setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [randomAction addTarget:self action:@selector(randomAction) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:randomAction];
    
    UIButton *addAction = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGRect rectAdd =  CGRectMake(264, 26, 40, 30);
    addAction.frame = rectAdd;
    [addAction setTitle:@"Add" forState:UIControlStateNormal];
    //    randomAction.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
    //    [randomAction setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [addAction addTarget:self action:@selector(addAction) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:addAction];
    
    
}

-(void)randomAction {
    NSInteger len = [array count];
    int num = arc4random() % len;
    contentLabel.text = array[num];
}

-(void) addAction {
    [self Click:(nil)];
}


- (IBAction)Click:(id)sender {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入" preferredStyle:UIAlertControllerStyleAlert];
    //增加确定按钮；
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //获取第1个输入框；
        UITextField *userNameTextField = alertController.textFields.firstObject;
        
        [array setValue:@"addnew" forKey:userNameTextField.text];
        
        
    
        
        NSLog(@"用户名 = %@",userNameTextField.text);
        
    }]];
    
    //增加取消按钮；
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    
    //定义第一个输入框；
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入...";
    }];
    
    
    [self presentViewController:alertController animated:true completion:nil];
    
}




-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
