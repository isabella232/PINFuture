//
//  ALAssetsLibrary+PINTask.h
//  Pods
//
//  Created by Chris Danford on 12/15/16.
//  Copyright © 2016 Pinterest. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>

#import "PINTask.h"

NS_ASSUME_NONNULL_BEGIN

@interface ALAssetsLibrary (PINTask)

- (PINTask<ALAsset *> *)assetTaskForURL:(NSURL *)assetURL __attribute__((warn_unused_result));

@end

NS_ASSUME_NONNULL_END