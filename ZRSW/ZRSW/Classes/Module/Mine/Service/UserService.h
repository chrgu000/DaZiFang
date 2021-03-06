//
//  UserService.h
//  ProjectFramework
//
//  Created by 周培玉 on 2018/9/12.
//  Copyright © 2018年 周培玉. All rights reserved.
//

#import "BaseNetWorkService.h"
#import "EnumType.h"
#import "ZRSWRemindListModel.h"
#import "ZRSWBillListModel.h"
#import "ZRSWMessageCountModel.h"
#import "UserFaceDetectModel.h"
#import "UserAddFaceModel.h"

@interface UserService : BaseNetWorkService

/**
 获取图片验证码

 @param imageCodeType 类型
 @param delegate 代理
 */
- (void)getUserImageCode:(ImageCodeType)imageCodeType delegate:(id)delegate;


/**
 获取手机验证码

 @param imageCodeType 类型
 @param phone 手机号
 @param delegate 代理
 */
- (void)getUserPhoneCode:(ImageCodeType)imageCodeType phone:(NSString *)phone delegate:(id)delegate;


/**
 用户注册

 @param loginId 用户名
 @param phone 手机号
 @param password 密码
 @param validateCode 验证码
 @param nickName 昵称
 @param delegate 代理
 */
- (void)userRegisterLoginId:(NSString *)loginId phone:(NSString *)phone password:(NSString *)password validateCode:(NSString *)validateCode beInvitedCode:(NSString *)beInvitedCode nickName:(NSString *)nickName delegate:(id)delegate;



/**
 用户账号密码登录

 @param username 用户名：手机号或用户帐户
 @param password 密码：当使用username登陆时必选
 @param delegate 代理
 */
- (void)userLoginWithUserName:(NSString *)username password:(NSString *)password  delegate:(id)delegate;


/**
 微信登录

 @param openID 微信openid；
 @param delegate 代理
 */
- (void)userLoginWithWeChatOpenID:(NSString *)openID delegate:(id)delegate;


/**
 手机号短信验证码登录

 @param phone 手机号
 @param code 验证码
 @param delegate 代理
 */
- (void)userLoginWithPhoneNum:(NSString *)phone code:(NSString *)code qqOpenID:(NSString *)qqOpenID wechatOpenID:(NSString *)wechatOpenID weiboUid:(NSString *)uid delegate:(id)delegate;

/**
 QQ登录

 @param qq qq
 @param delegate 代理
 */
- (void)userLoginWithQQID:(NSString *)qq delegate:(id)delegate;


/**
 微博登录

 @param blogId 微博ID
 @param delegate 代理
 */
- (void)userLoginWithWeiBo:(NSString *)blogId delegate:(id)delegate;


/**
 重置密码

 @param phone 手机号
 @param password 密码
 @param validateCode 验证码
 @param delegate 代理
 */
- (void)userResetPassword:(NSString *)phone password:(NSString *)password validateCode:(NSString *)validateCode delegate:(id)delegate;


/**
 更换手机号

 @param oldPhone 旧手机号
 @param validateCode1 旧手机号对应的验证码
 @param newPhone 新手机号
 @param validateCode2 新手机号对应的验证码
 @param delegate 代理
 */
- (void)userResetPhone:(NSString *)oldPhone validateCode1:(NSString *)validateCode1 newPhone:(NSString *)newPhone validateCode2:(NSString *)validateCode2 delegate:(id)delegate;


/**
 更新用户信息

 @param myId 掮客号
 @param nickName 昵称
 @param headImgUrl 头像URL地址
 @param email 电子邮箱
 @param delegate 代理
 */
- (void)updateUserInfoMyId:(NSString *)myId nickName:(NSString *)nickName headImgUrl:(NSString *)headImgUrl email:(NSString *)email delegate:(id)delegate;


/**
  实名认证接口

 @param realName 用户真实姓名
 @param idCard 身份证号码
 @param idCardImg1 身份证正面照URL
 @param idCardImg2 身份证反面照URL
 @param idCardImg3 手持身份证正面照URL
 @param idCardImg4 手持身份证反面照URL
 @param delegate 代理
 */
- (void)userRealNameValidationIdCard:(NSString *)realName idCard:(NSString *)idCard idCardImg1:(NSString *)idCardImg1 idCardImg2:(NSString *)idCardImg2 idCardImg3:(NSString *)idCardImg3 idCardImg4:(NSString *)idCardImg4 delegate:(id)delegate;



/**
 企业认证

 @param companyName 公司名称
 @param deptName 所在部门
 @param workCardUrl 工牌照片URL
 @param delegate 代理
 */
- (void)userValidationCompany:(NSString *)companyName deptName:(NSString *)deptName workCardUrl:(NSString *)workCardUrl delegate:(id)delegate;


/**
 意见反馈

 @param content 内容
 @param delegate 代理
 */
- (void)userFeedBack:(NSString *)content delegate:(id)delegate;

#pragma mark - 首页列表

/**
 获取banner

 @param city 城市ID 城市id：查询指定城市下的banner；默认为空，查询所有banner数据；
 @param delegate 代理
 */
- (void)getBannerWithCityID:(NSString *)city delegate:(id)delegate;


/**
 获得贷款产品banner

 @param city 城市ID 城市id：查询指定城市下的banner；默认为空，查询所有banner数据；
 @param delegate  代理
 */
- (void)getProductBannerWithCityID:(NSString *)city delegate:(id)delegate;

/**
 公告/资讯列表
 @param listType 类型 0=热门资讯；1=系统公告
 @param lastId 最后一次查询的最后一笔数据的id；
 @param pageSize 查询条数 默认为空查询最新数据 ，默认等于5
 @param delegate
 */
- (void)getNewList:(NewListType)listType lastId:(NSString *)lastId pageSize:(int)pageSize delegate:(id)delegate;


/**
 获得新闻详情

 @param newsID 新闻ID
 @param delegate 代理
 */
- (void)getNewDetail:(NSString *)newsID delegate:(id)delegate;



/**
 常见问题列表

 @param lastID 最后一个ID
 @param pageSize 查询条数 默认为空查询最新数据 ，默认等于5
 @param delegate 代理
 */
- (void)getCommentQuestionList:(NSString *)lastID pageSize:(int)pageSize delegate:(id)delegate;


/**
 问题详情

 @param lastID ID
 @param delegate 代理
 */
- (void)getCommentQuestionDetail:(NSString *)faqId delegate:(id)delegate;

/**
 查询指定状态的消息总数接口

 @param status 消息状态
 @param delegate 代理
 */
- (void)getMessageCount:(int)status delegate:(id)delegate;

/**
 账单列表
 @param pageSize 每页查询条数：默认20条
 @param pageNum 查询第几页：默认第1页
  @param delegate 代理
 */
- (void)getBillList:(int)pageSize pageNum:(int)pageNum delegate:(id)delegate;
/**
 提醒列表
 @param pageSize 每页查询条数：默认20条
 @param pageNum 查询第几页：默认第1页
 @param delegate 代理
 */
- (void)getRemindList:(int)pageSize pageNum:(int)pageNum delegate:(id)delegate;

/**
 更新阅读状态
 @param msgIds
 @param status -1：已删除，0：未读，1：已读；若该参数为空，则默认1
 @param delegate 代理
 */
- (void)updateMsgStatus:(NSString *)msgIds status:(int)status delegate:(id)delegate;

/**
 退出登录

 @param phone 手机号
 @param delegate 代理
 */
- (void)logOutWithDelegate:(id)delegate;


/**
 人脸认证
 @param loginId 用户登录标识
 @param faceToken 人脸标识集；
 @param delegate
 */
- (void)userAddFace:(NSString *)loginId faceToken:(NSString *)faceToken delegate:(id)delegate;
/**
 人脸检测
 @param faceImgUrl 用户面照
 @param delegate
 */
- (void)userFaceDetect:(NSString *)faceImgUrl delegate:(id)delegate;

/**
 人脸对比
 @param loginId 用户登录标识
 @param faceToken 人脸标识集；
 @param faceImgUrl 用户面照;
 @param delegate
 */
- (void)userFaceCompare:(NSString *)loginId faceToken:(NSString *)faceToken orFaceImgUrl:(NSString *)faceImgUrl delegate:(id)delegate;


/**
 获得用户信息

 @param userID 用户ID
 @param delegate 代理
 */
- (void)getUserInfo:(NSString *)userID delegate:(id)delegate;


/**
 签到 签退接口

 @param longitude 签到位置经度
 @param latitude 签到位置维度
 @param signType 签到类型
 @param delegate 代理
 */
- (void)updateUserLocation:(NSString *)longitude latitude:(NSString *)latitude signType:(SignType)signType delegate:(id)delegate;


/**
 检查用户签到状态

 @param userName 用户名字
 @param delegate 代理
 */
- (void)checkSignStates:(NSString *)userName delegate:(id)delegate;


/**
 检测版本信息

 @param delegate 代理
 */
- (void)getAppVersionInfoDelegate:(id)delegate;
@end

