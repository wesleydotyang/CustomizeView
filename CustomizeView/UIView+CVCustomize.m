//  Created by Wesley Yang on 2017/6/6.
//  Copyright © 2017年 ff. All rights reserved.

#import "UIView+CVCustomize.h"
#import <objc/runtime.h>
#import "CVStyleStore.h"

@implementation UIView(CVCustomize)

static char kUIViewCustomStyle;

-(void)setStyle:(NSString *)style
{
    objc_setAssociatedObject(self, &kUIViewCustomStyle, style, OBJC_ASSOCIATION_COPY_NONATOMIC);
    CVCustomizeStyleBlock styleBlock = [[CVStyleStore store] customStyle:self.style ofClass:self.class];
    if (styleBlock) {
        styleBlock(self);
    }else{
        NSLog(@"[CV] Style '%@' Not Found on View ->\n%@",style,self);
    }
}

-(NSString *)style
{
    return objc_getAssociatedObject(self, &kUIViewCustomStyle);
}

+(void)registerStyle:(NSString *)style withCustomizeBlock:(CVCustomizeViewBlock)customizeBlock
{
    [[CVStyleStore store] registerStyle:style forClass:self.class withCustomizeBlock:customizeBlock];
}

@end
