//
//  PINFuture+Dispatch.m
//  Pods
//
//  Created by Chris Danford on 12/5/16.
//  Copyright (c) 2016 Pinterest. All rights reserved.
//

#import "PINFuture+Dispatch.h"

NS_ASSUME_NONNULL_BEGIN

@implementation PINFuture (Dispatch)

+ (PINFuture<id> *)executor:(id<PINExecutor>)executor block:(PINFuture<id> * (^)(void))block;
{
    NSParameterAssert(executor);
    return [PINFuture<id> withBlock:^(void (^ _Nonnull resolve)(id _Nonnull), void (^ _Nonnull reject)(NSError * _Nonnull)) {
        // contextify, and execute
        [executor execute:^{
            PINFuture<id> *future = block();
            [future executor:[PINExecutor immediate] success:^(id  _Nonnull value) {
                resolve(value);
            } failure:^(NSError * _Nonnull error) {
                reject(error);
            }];
        }];
    }];
}

@end

NS_ASSUME_NONNULL_END
