//
//  VSLastPhoto.m
//  Iteration
//
//  Created by PJ Vea on 1/5/15.
//  Copyright (c) 2015 Vea Software. All rights reserved.
//

#import "VSLastPhoto.h"

@implementation VSLastPhoto


- (void)getLastPhoto:(CGSize)size completion:(void (^)(UIImage *image))completionBlock {
    
    PHFetchOptions *fetchOptions = [[PHFetchOptions alloc] init];
    fetchOptions.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:YES]];
    PHFetchResult *fetchResult = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:fetchOptions];
    PHAsset *lastAsset = [fetchResult lastObject];
    [[PHImageManager defaultManager] requestImageForAsset:lastAsset
                                               targetSize:size
                                              contentMode:PHImageContentModeAspectFill
                                                  options:PHImageRequestOptionsVersionCurrent
                                            resultHandler:^(UIImage *result, NSDictionary *info) {
                                                
                                                dispatch_async(dispatch_get_main_queue(), ^{
                                                    
                                                    completionBlock(result);
                                                    
                                                });
                                            }];
    
}

- (void)getPermission {
    
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        switch (status) {
            case PHAuthorizationStatusAuthorized:
                NSLog(@"authorized");
                break;
            case PHAuthorizationStatusRestricted:
                NSLog(@"restricted");
                break;
            case PHAuthorizationStatusDenied:
                NSLog(@"denied");
                break;
            default:
                break;
        }
    }];
    
}

@end
