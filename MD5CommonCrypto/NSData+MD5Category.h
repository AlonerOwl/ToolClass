//
//  NSData+MD5Category.h
//  UISenior_8_1_MD5_数据加密
//
//  Created by lanou3g on 16/5/12.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (MD5Category)

+ (NSMutableString *)dataMD5:(NSData *)data;

@end
