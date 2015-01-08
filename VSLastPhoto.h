//
//  VSLastPhoto.h
//  Iteration
//
//  Created by PJ Vea on 1/5/15.
//  Copyright (c) 2015 Vea Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

@interface VSLastPhoto : NSObject

- (void)getLastPhoto:(CGSize)size completion:(void (^)(UIImage *image))completionBlock;
- (void)getPermission;

@end
