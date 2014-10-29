
#import "ViewController.h"
#import <UMengAnalytics/MobClick.h>
#import "Book.h"

@interface ViewController ()

@end

@implementation ViewController


#pragma mark - 友盟统计页面的访问次数(1.进入页面  2.离开页面)
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:@"PageOne"];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:@"PageOne"];
}

#pragma mark - 友盟统计某个函数调用次数
- (void)test {
    [MobClick event:@"当前统计事件名(与友盟后台上名一致)"];
}

#pragma mark - 友盟统计某个行为次数(电商应用中“购买商品类型及数量, 那么在购买的函数里调用)
- (void)purchaseOrder:(NSArray *)books {
    NSDictionary * dict = @{
                            @"type":@"book",
                            @"quantity":[NSNumber numberWithInt:[books count]],
                            };
    [MobClick event:@"统计购买书的行为事件名" attributes:dict];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame = CGRectMake(100, 64, 100, 60);
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"统计函数调用次数" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
