//
//  CVStyleStore.h
//  CustomizeView
//
//  Created by Wesley Yang on 2017/6/16.
//  Copyright © 2017年 ff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^CVCustomizeStyleBlock)(UIView *view);


/**
 used for storing styles.
 */
@interface CVStyleStore : NSObject

+(instancetype)store;

-(void)registerStyle:(NSString*)style forClass:(Class)cls withCustomizeBlock:(CVCustomizeStyleBlock)customizeBlock;

-(CVCustomizeStyleBlock)customStyle:(NSString*)style ofClass:(Class)cls;

@end
