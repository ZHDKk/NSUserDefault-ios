//
//  ViewController.m
//  NSUserDefault
//
//  Created by zh dk on 2017/8/28.
//  Copyright © 2017年 zh dk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //创建圆角按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 100, 80, 40);
    [btn setTitle:@"写入文件" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pressWrite) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btnRead = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnRead.frame = CGRectMake(100, 200, 80, 40);
    [btnRead setTitle:@"读出文件" forState:UIControlStateNormal];
    [btnRead addTarget:self action:@selector(pressRead) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnRead];
    
}

-(void) pressWrite{
    //定义一个用户默认数据对象
    //不需要alloc创建，用户默认数据对象单列模式。 standardUserDefaults：获取全局唯一的对象
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    //存储字符串对象
    [ud setObject:@"zhdk" forKey:@"NAME"];
    
    NSNumber *num = [NSNumber numberWithInt:100];
    [ud setObject:num forKey:@"NUM"];
    
    //存储整形
    [ud setInteger:123 forKey:@"INT"];
    
    [ud setBool:YES forKey:@"BOOL"];
    [ud setFloat:1.23 forKey:@"FLOAT"];
    
    //创建一个可文件话的数组
    NSArray *array = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    [ud setObject:array forKey:@"ARRAY"];
    
}
-(void) pressRead
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    id object = [ud objectForKey:@"NAME"];
    
    NSString *name = (NSString*) object;
    
    NSLog(@"name = %@",name);
    
    object = [ud objectForKey:@"NUM"];
    NSNumber *num = (NSNumber*) object;
    NSLog(@"num = %@",num);
    
    NSInteger iv = [ud integerForKey:@"INT"];
    NSLog(@"iv=%ld",iv);
    
    BOOL bv = [ud boolForKey:@"BOOL"];
    float fv = [ud floatForKey:@"FLOAT"];
    
    NSLog(@"bv = %d",bv);
    
    NSLog(@"fv=%f",fv);
    
    NSArray *array = [ud objectForKey:@"ARRAY"];
    NSLog(@"array = %@",array);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
