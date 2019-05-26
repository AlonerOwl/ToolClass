//
//  NSData+MD5Category.m
//  UISenior_8_1_MD5_数据加密
//
//  Created by lanou3g on 16/5/12.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "NSData+MD5Category.h"

#import <CommonCrypto/CommonCrypto.h>

@implementation NSData (MD5Category)

+ (NSMutableString *)dataMD5:(NSData *)data
{
    // 1. 创建MD5对象
    CC_MD5_CTX md5;
    
    // 2. 初始化MD5对象
    CC_MD5_Init(&md5);
    
    // 3. 准备开始数据加密
    // 参数1：md5对象
    // 参数2：要加密的data的字节长度
    // 参数3：要加密内容的长度
    CC_MD5_Update(&md5, data.bytes, (CC_LONG)data.length);
    
    // 4. 准备一个字符串数组用来存储结构
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    // 结束加密
    CC_MD5_Final(result, &md5);
    
    // 5. 创建一个可变字符串存放加密结构
    NSMutableString *mutableString = [NSMutableString string];
    
    // 6. 遍历数组，给可变字符串赋值
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [mutableString appendFormat:@"%02x", result[i]];
    }
    return mutableString;
}

@end
