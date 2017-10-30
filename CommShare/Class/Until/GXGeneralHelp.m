//
//  GXGeneralHelp.m
//  CommShare
//
//  Created by Sandwind on 2017/10/17.
//  Copyright © 2017年 Sandwind. All rights reserved.
//

#import "GXGeneralHelp.h"

@implementation GXGeneralHelp
#pragma mark - color select
+(UIColor*)colorWithHexString:(NSString*)hexString andAlpha:(float)alpha
{
    UIColor *col;
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#"
                                                     withString:@"0x"];
    uint hexValue;
    if ([[NSScanner scannerWithString:hexString] scanHexInt:&hexValue]) {
        col = [self colorWithHexValue:hexValue andAlpha:alpha];
    } else {
        // invalid hex string
        col = [UIColor blackColor];
    }
    return col;
    
}
+(UIColor*)colorWithHexValue:(uint)hexValue andAlpha:(float)alpha {
    return [UIColor
            colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
            green:((float)((hexValue & 0xFF00) >> 8))/255.0
            blue:((float)(hexValue & 0xFF))/255.0
            alpha:alpha];
}

+ (UIColor*)colorWithRedValue:(CGFloat)redValue green:(CGFloat)greenValue blue:(CGFloat)blueValue andAlpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:(redValue/255.0) green:(greenValue/255.0) blue:(blueValue/255.0) alpha:1.0];
    
}
#pragma mark - 字体
+ (CGFloat)fontCurrentScreenFontSize:(CGFloat)fontSize
{
    CGFloat realFontSize = 0.0;
    CGFloat f = [UIScreen mainScreen].bounds.size.width;
    realFontSize = fontSize * (f / 375);
    
    return realFontSize;
}

@end
