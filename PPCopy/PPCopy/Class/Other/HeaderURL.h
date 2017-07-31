//
//  HeaderURL.h
//  PPCopy
//
//  Created by gxtc on 2017/7/21.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#ifndef HeaderURL_h
#define HeaderURL_h

#define key_token @"token"
#define key_uid @"uid"
#define key_login @"login"
#define key_userInfo @"userInfo"


/**域名*/
#define Over_All_URL @"http://wz.lgmdl.com"

/**首页*/
#define Home_URL [NSString stringWithFormat:@"%@/App/Index/index",Over_All_URL]

/**文章分类*/
#define ArticleClassify_URL [NSString stringWithFormat:@"%@/App/Article/getClass",Over_All_URL]

/**文章分类列表*/
#define ArticleClassify_List_URL [NSString stringWithFormat:@"%@/App/Article/article",Over_All_URL]

/**文章详情页-url*/
#define ArticleDetail_URL [NSString stringWithFormat:@"%@/app/article/detail_new",Over_All_URL]

/**文章搜索*/
#define AreiclrSearch_URL [NSString stringWithFormat:@"%@/App/Article/search",Over_All_URL]

/**文章分享加密链接*/
#define ArticleShareEncrypt_URL [NSString stringWithFormat:@"%@/App/Article/gshare",Over_All_URL]

/**文章复制链接*/
#define ArticleCopyLink_URL [NSString stringWithFormat:@"%@/App/Share/copyUrl",Over_All_URL]

/**文章分享次数统计*/
#define ArticleShareCount_URL [NSString stringWithFormat:@"%@/App/Article/addShare",Over_All_URL]

/**文章-日-周-月-排行*/
#define Article_Day_Week_Month_Rank_URL [NSString stringWithFormat:@"%@/App/Article/getclickban",Over_All_URL]

/**签到红包*/
#define Sign_in_RedPaper_URL [NSString stringWithFormat:@"%@/index_test.php/App/Member/sign",Over_All_URL]

/**注册*/
#define Regist_URL [NSString stringWithFormat:@"%@/App/Member/register",Over_All_URL]

/**发短信*/
#define SMS_URL [NSString stringWithFormat:@"%@/App/Member/sendSms",Over_All_URL]

/**登录*/
#define Log_In_URL [NSString stringWithFormat:@"%@/App/Member/login",Over_All_URL]

/**修改密码*/
#define ChangedPassword_URL [NSString stringWithFormat:@"%@/Member/editPassword",Over_All_URL]

/**找回密码*/
#define FindPassword_URL [NSString stringWithFormat:@"%@/App/Member/findPassword",Over_All_URL]

/**收益明细*/
#define EarnDetail_URL [NSString stringWithFormat:@"%@/App/Profit/ProfitList",Over_All_URL]

/**修改头像(上传头像)*/
#define UpLoad_HeadIcon_Url [NSString stringWithFormat:@"%@/App/Member/avatar",Over_All_URL]

/**退出登录*/
#define Log_Out_URL [NSString stringWithFormat:@"%@/App/Member/logout",Over_All_URL]

/**验证token*/
#define Proof_Token_URL [NSString stringWithFormat:@"%@/App/Member/checkLoginToken",Over_All_URL]

/**修改资料*/
#define ChangeData_URL [NSString stringWithFormat:@"%@/App/Member/changeMember",Over_All_URL]

/**唤醒徒弟*/
#define AwakenApprentice_URL [NSString stringWithFormat:@"%@/index_test.php/App/Member/wakePrentice",Over_All_URL]

/**绑定-*/
#define BinDing_1_URL [NSString stringWithFormat:@"%@/App/Member/wxbinding",Over_All_URL]

/**绑定二*/
#define BinDing_2_URL [NSString stringWithFormat:@"%@/App/Member/subscribeBind",Over_All_URL]

/**绑定状态*/
#define BinDing_State_URL [NSString stringWithFormat:@"%@/App/Member/bind",Over_All_URL]

/**抽奖页面-url*/
#define DrawGift_URL [NSString stringWithFormat:@"%@/App/Member/getdrawUrl",Over_All_URL]

/**支付宝提现*/
#define AliPay_URL [NSString stringWithFormat:@"%@/App/Exchange/alipay",Over_All_URL]

/**申请支付宝提现*/
#define AliPay_Get_URL [NSString stringWithFormat:@"%@/App/Exchange/handleAlipay",Over_All_URL]

/**微信提现*/
#define WeiChatPay_URL [NSString stringWithFormat:@"%@/App/Exchange/wxpay",Over_All_URL]

/**申请微信提现*/
#define WeiChatPay_Get_URL [NSString stringWithFormat:@"%@/App/Exchange/handleWxpay",Over_All_URL]

/**提现记录*/
#define WithdrawRecord_URL [NSString stringWithFormat:@"%@/App/Exchange/record",Over_All_URL]

/**每日状态*/
#define DayTask_State_URL [NSString stringWithFormat:@"%@/App/Mission/dayMission",Over_All_URL]

/**新手任务*/
#define NewTask_URL [NSString stringWithFormat:@"%@/App/Mission/newMemMission",Over_All_URL]

/**收徒奖励*/
#define ApprenticeAward_URL [NSString stringWithFormat:@"%@/App/Prentice/getPrenticeMoney",Over_All_URL]

/**日-周-月-收徒*/
#define Apprentice_Day_Week_Mont_URL [NSString stringWithFormat:@"%@/App/Prentice/prenticeCount",Over_All_URL]

/**阅读赚-分类文章列表*/
#define ReadEarnArticleList_URL [NSString stringWithFormat:@"%@/App/Read/category",Over_All_URL]

/**阅读转-文章详情列表*/
#define ReadEarnArticleListDetail_URL [NSString stringWithFormat:@"%@/App/Read/detail",Over_All_URL]

/**阅读赚-开始阅读*/
#define ReadEarnBegin_URL [NSString stringWithFormat:@"%@/App/Mission/beginRead",Over_All_URL]

/**阅读赚-结束阅读*/
#define ReadEarnEnd_URL [NSString stringWithFormat:@"%@/App/Mission/endRead",Over_All_URL]

/**享立赚成功*/
#define ShareEarnFinish_URL [NSString stringWithFormat:@"%@/App/Mission/share_now",Over_All_URL]

/**享立赚列表*/
#define ShareEarnList_URL [NSString stringWithFormat:@"%@/App/Mission/make_index",Over_All_URL]

/**红包列表*/
#define RedPaperList_URL [NSString stringWithFormat:@"%@/App/moneygift/giftList",Over_All_URL]

/**抢红包*/
#define RedPaper_Get_URL [NSString stringWithFormat:@"%@/App/moneygift/catchMoney",Over_All_URL]

/**红包详情*/
#define RedPaperDetailList_URL [NSString stringWithFormat:@"%@/App/moneygift/viewDetail",Over_All_URL]

/**赚钱列表*/
#define EarnMoneyList_URL [NSString stringWithFormat:@"%@/App/Mission/make_index",Over_All_URL]

/**新手任务奖励*/
#define NewTaskAward_URL [NSString stringWithFormat:@"%@/App/Mission/TaskNew",Over_All_URL]

/**每日任务奖励*/
#define DayTaskAward_URL [NSString stringWithFormat:@"%@/App/Mission/TaskDay",Over_All_URL]

/**收徒列表*/
#define ApprenticeList_URL [NSString stringWithFormat:@"%@/App/Prentice/getInviterList",Over_All_URL]

/**收入排行*/
#define EarnRank_URL [NSString stringWithFormat:@"%@/App/Index/Ranking",Over_All_URL]

/**联系我们*/
#define ContactUs_URL [NSString stringWithFormat:@"%@/App/Connect/index",Over_All_URL]

/**添加收藏*/
#define AddCollect_URL [NSString stringWithFormat:@"%@/App/Collection/addMemberCollection",Over_All_URL]

/**取消收藏*/
#define CancleCollect_URL [NSString stringWithFormat:@"%@/App/Collection/cancelMemberCollection",Over_All_URL]

/**收藏列表*/
#define CollectList_URL [NSString stringWithFormat:@"%@/App/Collection/index",Over_All_URL]

/**是否收藏*/
#define IsCollect_URL [NSString stringWithFormat:@"%@/App/Collection/isCollection",Over_All_URL]

/**消息列表*/
#define MessageLest_URL [NSString stringWithFormat:@"%@/App/Notice/index",Over_All_URL]

/**消息详情*/
#define MessageDetail_URL [NSString stringWithFormat:@"%@/App/Notice/detail",Over_All_URL]

/**邀请信息*/
#define InviteMessage_URL [NSString stringWithFormat:@"%@/App/Prentice/getInviterUrl",Over_All_URL]

/**新手教程*/
#define NewTeacher_URL [NSString stringWithFormat:@"%@/App/Course/newCourse",Over_All_URL]

/**版本更新*/
#define NewVersions_URL [NSString stringWithFormat:@"%@/App/Index/AppUpload",Over_All_URL]


#endif /* HeaderURL_h */
