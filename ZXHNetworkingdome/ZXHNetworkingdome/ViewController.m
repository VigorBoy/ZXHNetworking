//
//  ViewController.m
//  基于AFNetworking3.0的封装
//
//  Created by    🐯 on 16/1/30.
//  Copyright © 2016年 张炫赫. All rights reserved.
//

#import "ViewController.h"
#import "ZXHNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 通常放在appdelegate就可以了
    [ZXHNetworking updateBaseUrl:@"http://apistore.baidu.com"];
    [ZXHNetworking enableInterfaceDebug:YES];
    
    // 设置GET、POST请求都缓存
    [ZXHNetworking cacheGetRequest:YES shoulCachePost:YES];
    
    // 测试GET API
    NSString *url = @"http://apistore.baidu.com/microservice/cityinfo?cityname=beijing";
    
    // 如果请求回来的数据是业务数据，但是是失败的，这时候需要外部开发人员才能判断是业务失败。
    // 内部处理是只有走failure的才能判断为无效数据，才不会缓存
    // 如果设置为YES,则每次会去刷新缓存，也就是不会读取缓存，即使已经缓存起来
    // 新下载的数据会重新缓存起来
    [ZXHNetworking getWithUrl:url refreshCache:NO params:nil progress:^(int64_t bytesRead, int64_t totalBytesRead) {
        NSLog(@"progress: %f, cur: %lld, total: %lld",
              (bytesRead * 1.0) / totalBytesRead,
              bytesRead,
              totalBytesRead);
    } success:^(id response) {
        
    } fail:^(NSError *error) {
        
    }];
    
    // 测试POST API：
    // 假数据
    NSDictionary *postDict = @{ @"urls": @"http://www.henishuo.com/git-use-inwork/",
                                @"goal" : @"site",
                                @"total" : @(123)
                                };
    NSString *path = @"/urls?site=www.henishuo.com&token=bRidefmXoNxIi3Jp";
    // 由于这里有两套基础路径，用时就需要更新
    [ZXHNetworking updateBaseUrl:@"http://data.zz.baidu.com"];
    // 每次刷新缓存
    // 如果获取到的业务数据是不正确的，则需要下次调用时设置为YES,表示要刷新缓存
    // HYBURLSessionTask *task =
    [ZXHNetworking postWithUrl:path refreshCache:YES params:postDict success:^(id response) {
        
    } fail:^(NSError *error) {
        
    }];
    
    // 取消全部请求
    [ZXHNetworking cancelAllRequest];
    
    // 取消单个请求方法一
    [ZXHNetworking cancelRequestWithURL:path];
    
    NSLog(@"%lld", [ZXHNetworking totalCacheSize]);
    //清除缓存
    [ZXHNetworking clearCaches];
    
    path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/b.zip"];
    [ZXHNetworking downloadWithUrl:@"http://wiki.lbsyun.baidu.com/cms/iossdk/sdk/BaiduMap_IOSSDK_v2.10.2_All.zip" saveToPath:path progress:^(int64_t bytesRead, int64_t totalBytesRead) {
        
    } success:^(id response) {
        
    } failure:^(NSError *error) {
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
