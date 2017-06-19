//  Created by Wesley Yang on 2017/6/6.
//  Copyright © 2017年 ff. All rights reserved.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^CVCustomizeViewBlock)(UIView *view);

@interface UIView(CVCustomize)

/**
 Custom style name. Setting this value will apply style code on this view.
 Style code is registered through registerStyle:... method.
 */
@property (nonatomic,copy) NSString *style;


+(void)registerStyle:(NSString*)style withCustomizeBlock:(CVCustomizeViewBlock)customizeBlock;

@end


#define __CVCUSTOMIZEClass(cls) \
typedef void(^CVCustomize##cls##Block)(cls *view);\
@interface cls(CVCustomize)\
+(void)registerStyle:(NSString*)style withCustomizeBlock:(CVCustomize##cls##Block)customizeBlock;\
@end


//define category on uicontrols.
__CVCUSTOMIZEClass(UIButton)
__CVCUSTOMIZEClass(UILabel)
__CVCUSTOMIZEClass(UISwitch)
__CVCUSTOMIZEClass(UITextField)
__CVCUSTOMIZEClass(UITextView)
__CVCUSTOMIZEClass(UIBarButtonItem)
__CVCUSTOMIZEClass(UITableViewCell)
__CVCUSTOMIZEClass(UICollectionViewCell)


