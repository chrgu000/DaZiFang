//
//  ControllerUtilsManager.h
//  ProjectFramework
//
//  Created by 周培玉 on 2018/9/11.
//  Copyright © 2018年 周培玉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TOWebViewController.h>

@interface ControllerUtilsManager : NSObject

+ (BOOL)isHTTPURL:(NSString *)url;

+ (BOOL)canShowViewWithURL:(NSString *)url;

+ (void)showViewWithURL:(NSString *)url;

+ (void)showNormalWebViewWithURL:(NSString *)url;

+ (TOWebViewController *)webViewControllerWithURL:(NSURL *)url;

@end
