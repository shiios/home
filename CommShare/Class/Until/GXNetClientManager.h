//
//  GXNetClientManager.h
//  CommShare
//
//  Created by Sandwind on 2017/10/17.
//  Copyright © 2017年 Sandwind. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface GXNetClientManager : AFHTTPSessionManager

+ (instancetype _Nullable )sharedClient;

- (NSURLSessionDataTask *)GX_POSTWithURLStr:(NSString *_Nullable)urlStr withParmeters:(nullable id)parmeters success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id responseObject))success failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;

- (NSURLSessionDataTask *_Nullable)GX_GETWithURLStr:(NSString *_Nullable)urlStr withParmeters:(nullable id)parmeters success:(nullable void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;
@end
