//
//  DataManager.m
//  LeanCloud
//
//  Created by yuebin on 16/8/31.
//  Copyright © 2016年 yuebin. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

static dispatch_once_t predict;
static DataManager *manager = nil;

+ (DataManager *)getSharedInstance {
    
    dispatch_once(&predict, ^{  //括号里的内容在启动中只执行一次
        manager = [[self alloc]init];
        //对manager的数组赋值
        //先从网络上开始找,找不到就创建
        AVUser *user = [AVUser currentUser];
        if (user) {
            
        }
        
        
    });
    return manager;
}


@end
