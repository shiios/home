//
//  GXGeneralHelp.h
//  CommShare
//
//  Created by Sandwind on 2017/10/17.
//  Copyright © 2017年 Sandwind. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface GXGeneralHelp : NSObject

#pragma mark - color
+(UIColor*)colorWithHexString:(NSString*)hexString andAlpha:(float)alpha;
#pragma mark - font
+ (CGFloat)fontCurrentScreenFontSize:(CGFloat)fontSize;
+ (UIColor*)colorWithRedValue:(CGFloat)redValue green:(CGFloat)greenValue blue:(CGFloat)blueValue andAlpha:(CGFloat)alpha;
@end
