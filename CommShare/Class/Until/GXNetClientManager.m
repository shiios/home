//
//  GXNetClientManager.m
//  CommShare
//
//  Created by Sandwind on 2017/10/17.
//  Copyright © 2017年 Sandwind. All rights reserved.
//

#import "GXNetClientManager.h"

@implementation GXNetClientManager

+ (instancetype)sharedClient
{
    static GXNetClientManager *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[GXNetClientManager alloc] initWithBaseURL:[NSURL URLWithString:@""]];
        
    });
    return _sharedClient;
}

- (NSURLSessionDataTask *)GX_POSTWithURLStr:(NSString *_Nullable)urlStr withParmeters:(nullable id)parmeters success:(nullable void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure
{
    NSURLSessionDataTask *task = [self POST:urlStr parameters:parmeters progress:nil success:success failure:failure];
    
    return task;
    
}

- (NSURLSessionDataTask *)GX_GETWithURLStr:(NSString *_Nullable)urlStr withParmeters:(nullable id)parmeters success:(nullable void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure
{
    
    NSURLSessionDataTask *task = [self GET:urlStr parameters:parmeters progress:nil success:success failure:failure];
    
    return task;
    
}
@end
