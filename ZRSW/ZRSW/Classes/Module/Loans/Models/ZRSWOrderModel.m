//
//  ZRSWOrderModel.m
//  ZRSW
//
//  Created by 周培玉 on 2018/9/25.
//  Copyright © 2018年 周培玉. All rights reserved.
//

#import "ZRSWOrderModel.h"

@implementation ZRSWOrderMainTypeDetaolModel

@end
@implementation ZRSWOrderMainTypeListModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"data" : [ZRSWOrderMainTypeDetaolModel class],
             };
}

@end

@implementation ZRSWOrderLoanTypDetailModel

@end
@implementation ZRSWOrderLoanTypeListModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"data" : [ZRSWOrderLoanTypDetailModel class],
             };
}

@end