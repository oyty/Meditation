//
//  TodayViewController.m
//  MeditationWidget
//
//  Created by oyty on 6/3/17.
//  Copyright © 2017 oyty. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

NSArray *array;
UILabel *contentLabel;

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // 设置时区 GMT
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    // 加入一些别的英文字符串时，需用单引号来引入
    [formatter setDateFormat:@"yyyy年MM月dd日 HH点mm分ss秒 'iOS Date Test'"];
    
    // NSString 转 NSDate
    NSDate *date = [formatter dateFromString:@"2017年06月02日 23点59分59秒"];
    NSDate *nowDate = [NSDate date];
    
    NSInteger ns = [[self class]calcDaysFromBegin:date end:nowDate];
    if (ns==0) {
        NSLog(@"1");
    }
    
    
    UILabel *dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 2, 70, 40)];
    dayLabel.text = [NSString stringWithFormat:@"%d",(int)ns];
    dayLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:28];
    dayLabel.textAlignment = UITextAlignmentCenter;
    dayLabel.textColor = [UIColor blueColor];
    [self.view addSubview:dayLabel];
    
    UILabel *firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(92, 7, 30, 30)];
    firstLabel.text = @"第";
    firstLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:14];
    firstLabel.textAlignment = UITextAlignmentCenter;
    firstLabel.textColor = [UIColor blackColor];
    [self.view addSubview:firstLabel];
    
    UILabel *secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(188, 7, 30, 30)];
    secondLabel.text = @"天";
    secondLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:14];
    secondLabel.textAlignment = UITextAlignmentCenter;
    secondLabel.textColor = [UIColor blackColor];
    [self.view addSubview:secondLabel];
    
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"infotobe" ofType:@"plist"];
    array = [[NSArray alloc] initWithContentsOfFile:plistPath];

    
    
    contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 20, 270, 100)];
    contentLabel.text = @"drug";
    contentLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
    contentLabel.textColor = [UIColor grayColor];
    contentLabel.lineBreakMode = UILineBreakModeWordWrap;
    contentLabel.numberOfLines = 0;
    [self.view addSubview:contentLabel];
    
//    [self randomAction];

}

//计算两个日期之间的天数
+ (NSInteger) calcDaysFromBegin:(NSDate *)beginDate end:(NSDate *)endDate
{
    //创建日期格式化对象
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    //取两个日期对象的时间间隔：
    //这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:typedef double NSTimeInterval;
    NSTimeInterval time=[endDate timeIntervalSinceDate:beginDate];
    
    int days=((int)time)/(3600*24);
    //int hours=((int)time)%(3600*24)/3600;
    //NSString *dateContent=[[NSString alloc] initWithFormat:@"%i天%i小时",days,hours];
    return days;
}

//-(void)randomAction {
//    NSInteger len = [array count];
//    int num = ;
//    contentLabel.text = array[num];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
