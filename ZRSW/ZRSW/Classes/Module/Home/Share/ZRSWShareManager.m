//
//  ZRSWShareManager.m
//  ZRSW
//
//  Created by King on 2018/9/19.
//  Copyright © 2018年 周培玉. All rights reserved.
//

#import "ZRSWShareManager.h"
#import "ZRSWShareView.h"

@implementation ZRSWShareManager

+ (void)registerPlaformInfo {

    [[UMSocialManager defaultManager] openLog:YES];
    //注册友盟key

//    [[UMSocialManager defaultManager] setUmSocialAppkey:UMKey];
    //QQ
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:TencentAppID appSecret:nil redirectURL:nil];
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Qzone appKey:TencentAppID appSecret:nil redirectURL:nil];

    //微信
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:kWeChatAppID appSecret:kWeChatAppSecret redirectURL:nil];
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatTimeLine appKey:kWeChatAppID appSecret:kWeChatAppSecret redirectURL:nil];
    //微博
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:kWeiBoAppKey appSecret:nil redirectURL:kWeiBoRedirectURL];

}


+ (void)shareToPlatformType:(UMSocialPlatformType)platformType Content:(ZRSWShareModel *)shareModel shareSourceType:(ShareSourceType)sourcetype delegate:(id<ShareHandlerDelegate>)delegate {

    WS(weakSelf);
    [ZRSWShareView sharedInstance].isShareCallBack = YES;

    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //设置文本
    messageObject.text = shareModel.content;

    if (sourcetype == ShareSourceWap) {

        UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:shareModel.title descr:shareModel.content thumImage:shareModel.thumbImage];
        //设置网页地址
        NSString *para = @"";
        if (![shareModel.destUrlStr containsString:@"?"]) {
            para = [NSString stringWithFormat:@"?%@",[self getClientParameters]];
        }else {
            //            para = [NSString stringWithFormat:@"&%@",para];
        }
        shareObject.webpageUrl = [shareModel.destUrlStr stringByAppendingString:para];
        LLog(@"分享URL:%@",shareObject.webpageUrl);
        //分享消息对象设置分享内容对象
        messageObject.shareObject = shareObject;
    }
    else if (sourcetype == ShareSourceImage){
        id image = nil;
        id shareImage = nil;
        if (shareModel.thumbImage) {
            image = shareModel.thumbImage;
            shareImage = shareModel.thumbImage;
        }
        else {
            image = [UIImage imageNamed:@"share_lexue_logo"];
            shareImage = [UIImage imageNamed:@"share_lexue_logo"];
        }
        UMShareImageObject *shareImageObj = [UMShareImageObject shareObjectWithTitle:@"" descr:@"" thumImage:image];
        shareImageObj.shareImage = shareImage;
        messageObject.shareObject = shareImageObj;
    }
    else {

        //创建图片内容对象
        UMShareImageObject *shareObject = [UMShareImageObject shareObjectWithTitle:shareModel.title descr:shareModel.content thumImage:shareModel.thumbImage];
        [shareObject setShareImage:shareModel.thumbImage];
        messageObject.shareObject = shareObject;

    }
    LLog(@"thumImageUrl:%@",shareModel.thumImageUrl);

    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:nil completion:^(id data, NSError *error) {
        NSDictionary *userInfo = error.userInfo;
        if ([userInfo.allKeys containsObject:@"message"]) {
            NSString *errorInfo = userInfo[@"message"];
            LLog(@"分享错误信息：%@",errorInfo);
        }
        [weakSelf handleSharedResult:data error:error delegate:delegate];
    }];


}
+ (void)handleSharedResult:(id)data error:(NSError *)error delegate:(id<ShareHandlerDelegate>)delegate {
    if (error) {
        if (delegate && [delegate respondsToSelector:@selector(shareHandlerFailed:)]) {
            [delegate shareHandlerFailed:error];
        }
    }
    else {
        if (delegate && [delegate respondsToSelector:@selector(shareHandlerSuccess:)]) {
            [delegate shareHandlerSuccess:data];
        }
    }
}

+ (BOOL)handleOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication  annotation:(id)annotation {
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}
+ (BOOL)isInstallQQ {

    return [[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_QQ];
}
+ (BOOL)isInstallWeChat {

    return [[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_WechatSession];
}
+ (BOOL)isImstallWeiBo {

    return [[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_Sina];
}
+ (NSString *)getClientParameters {
    NSString *client = @"";
#ifdef Zhongkao
    client = @"JUNIOR_TEACH";
#else
    client = @"SENIOR_TEACH";
#endif
    NSString *para = [NSString stringWithFormat:@"client=%@",client];
    return para;
}
@end