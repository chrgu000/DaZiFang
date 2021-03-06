//
//  OrderService.m
//  ProjectFramework
//
//  Created by 周培玉 on 2018/9/13.
//  Copyright © 2018年 周培玉. All rights reserved.
//

#import "OrderService.h"
#import "ZRSWOrderModel.h"

@implementation OrderService

- (void)getCityListDelegate:(id)delegate {
    [self POST:KCityListInterface reqType:KCityListRequest delegate:delegate parameters:nil ObjcClass:[CityListModel class] NeedCache:NO];
}

- (void)getOrderMainTypeList:(NSString *)cityID delegate:(id)delegate {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    if (cityID.length > 0) {
        [params setObject:cityID forKey:@"cityId"];
    }
    [self POST:KGetOrderMainTypeListInterface reqType:KGetOrderMainTypeListRequest delegate:delegate parameters:params ObjcClass:[ZRSWOrderMainTypeListModel class] NeedCache:NO];

}

- (void)getHotProductList:(NSString *)cityID delegate:(id)delegate {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    if (cityID.length > 0) {
        [params setObject:cityID forKey:@"cityId"];
    }
    [self POST:KGetOrderHotProductListInterface reqType:KGetOrderHotProductListRequest delegate:delegate parameters:params ObjcClass:[ZRSWOrderLoanHotProductModel class] NeedCache:NO];
}
- (void)getOrderLoanTypeList:(NSString *)mainTypeId delegate:(id)delegate {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    if (mainTypeId.length > 0) {
        [params setObject:mainTypeId forKey:@"mainTypeId"];
    }
    [self POST:KGetOrderLoanTypeListInterface reqType:KGetOrderLoanTypeListRequest delegate:delegate parameters:params ObjcClass:[ZRSWOrderLoanProductListModel class] NeedCache:NO];

}
- (void)getLoanDetailInfo:(NSString *)loanId delegate:(id)delegate {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    if (loanId.length > 0) {
        [params setObject:loanId forKey:@"loanId"];
    }
    [self POST:KGetOrderLoanInfoInterface reqType:KGetOrderLoanInfoRequest delegate:delegate parameters:params ObjcClass:[ZRSWOrderLoanInfoModel class] NeedCache:NO];

}

- (void)getOrderList:(NSString *)lastId orderStatus:(NSString *)orderStatus delegate:(id)delegate{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    if (lastId.length > 0) {
        [params setObject:lastId forKey:@"lastId"];
    }
    //订单状态：0=审核中；1=已通过；3=已放款；8=已拒绝（包含初审未过和拒绝放款）;默认为空，查询所有订单
    if (orderStatus.length > 0) {
        [params setObject:orderStatus forKey:@"orderStatus"];
    }
    [params setObject:@(15) forKey:@"pageSize"];
    
    [self POST:KGetOrderListInterface reqType:KGetOrderListRequest delegate:delegate parameters:params ObjcClass:[ZRSWOrderListModel class] NeedCache:NO];

}

- (void)createOrderLoanId:(NSString *)loanId loanUserName:(NSString *)loanUserName loanUserSex:(NSInteger)loanUserSex loanUserAddress:(NSString *)loanUserAddress loanUserPhone:(NSString *)loanUserPhone loanMoney:(NSString *)loanMoney remark:(NSString *)remark condition:(NSMutableArray *)condition delegate:(id)delegate{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:loanId forKey:@"loanId"];
    [params setObject:loanUserName forKey:@"loanUserName"];
    [params setObject:@(loanUserSex) forKey:@"loanUserSex"];
    [params setObject:loanUserAddress forKey:@"loanUserAddress"];
    [params setObject:loanUserPhone forKey:@"loanUserPhone"];
    [params setObject:loanMoney forKey:@"loanMoney"];
    if (remark.length > 0) {
        [params setObject:remark forKey:@"remark"];
    }
    for (NSDictionary *dic in condition) {
        for (NSString *key in dic.allKeys) {
            NSString *value = dic[key];
            [params setObject:value forKey:key];
        }
    }
    [self POST:KCreateOrderInterface reqType:KCreateOrderRequest delegate:delegate parameters:params ObjcClass:[ZRSWCreateModel class] NeedCache:NO];


}
@end
