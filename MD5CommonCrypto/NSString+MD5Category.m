//
//  NSString+MD5Category.m
//  UISenior_8_1_MD5_数据加密
//
//  Created by lanou3g on 16/5/12.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "NSString+MD5Category.h"

#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (MD5Category)

+ (NSMutableString *)stringMD5:(NSString *)str
{
    // 1. 因为MD5是基于C语言的，所以我们要将字符串进行编码
    const char *data = [str UTF8String];
    
    // 2. 使用字符串数组去存取加密后的相关内容（16进制，32位）
    // CC_MD5_DIGEST_LENGTH表示长度
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    // 3. 进行MD5加密
    // 参数1：要加密的内容
    // 参数2：要加密的data的一个长度
    // 参数3：存储MD5加密后的结果数组
    CC_MD5(data, (CC_LONG)strlen(data), result);
    
    // 4. 创建可变字符串，保存结果
    NSMutableString *mutableStr = [NSMutableString string];
    
    // 5. 遍历结果数组，然后添加到可变字符串中
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        
        // 16进制需要大家知道格式修饰符（%x表示16进制，02表示当不足两位的时候，前面补0）
        [mutableStr appendFormat:@"%02x", result[i]];
    }
    
    return mutableStr;
}

@end
