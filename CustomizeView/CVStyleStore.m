//  Created by Wesley Yang on 2017/6/16.
//  Copyright © 2017年 ff. All rights reserved.

#import "CVStyleStore.h"



/**
 Store single style config
 */
@interface CVStyleStoreItem : NSObject
@property (nonatomic,copy) CVCustomizeStyleBlock styleBlock;
@property (nonatomic,assign) Class styleClass;
@end

@implementation CVStyleStoreItem
@end


@interface CVStyleStore()
@property (nonatomic,strong) NSMutableDictionary<NSString*,NSMutableArray<CVStyleStoreItem*>*> *styleDic;
@end

@implementation CVStyleStore

+(instancetype)store{
    static CVStyleStore *store = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        store = [[CVStyleStore alloc] init];
    });
    return store;
}

-(instancetype)init
{
    if (self = [super init]) {
        self.styleDic = [NSMutableDictionary dictionary];
    }
    return self;
}

-(void)registerStyle:(NSString*)style forClass:(Class)cls withCustomizeBlock:(CVCustomizeStyleBlock)customizeBlock
{
    CVStyleStoreItem *item = [[CVStyleStoreItem alloc] init];
    item.styleClass = cls;
    item.styleBlock = customizeBlock;
    if (!self.styleDic[style]) {
        self.styleDic[style] = [NSMutableArray array];
    }
    [self.styleDic[style] addObject:item];
}

-(CVCustomizeStyleBlock)customStyle:(NSString*)style ofClass:(Class)cls
{
    NSMutableArray *styles =  self.styleDic[style];
    if(!styles){
        return nil;
    }
    
    CVStyleStoreItem *bestMatchItem = nil;
    int nearestDistance = 9999;
    for (CVStyleStoreItem *item in styles) {
        if (cls == item.styleClass) {
            return item.styleBlock;
        }
        if ([cls isSubclassOfClass:item.styleClass]) {
            Class c = [cls superclass];
            int dis = 1;
            while (c!= item.styleClass) {
                c = [c superclass];
                ++dis;
            }
            if (dis < nearestDistance) {
                nearestDistance = dis;
                bestMatchItem = item;
            }
        }
    }
    
    return bestMatchItem.styleBlock;
}


@end
