//
//  ViewController.m
//  CustomizeView
//
//  Created by Wesley Yang on 2017/6/6.
//  Copyright © 2017年 ff. All rights reserved.
//

#import "ViewController.h"
#import "UIView+CVCustomize.h"

@interface CustomButton : UIButton
@end
@implementation CustomButton
@end

@interface CustomCustomButton : CustomButton
@end
@implementation CustomCustomButton
@end


@implementation ViewController


-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if ([super initWithCoder:aDecoder]) {
        [UIView registerStyle:@"a" withCustomizeBlock:^(UIView *view) {
            view.backgroundColor = [UIColor blueColor];
        }];
        
        [UIButton registerStyle:@"btn-bordered" withCustomizeBlock:^(UIButton *view) {
            view.layer.borderWidth = 2;
            view.layer.borderColor = [UIColor blackColor].CGColor;
        }];
        
        //override style for CustomCustomButton
        [CustomCustomButton registerStyle:@"btn-bordered" withCustomizeBlock:^(UIButton *view) {
            view.layer.cornerRadius = 5;
            view.layer.borderWidth = 2;
            view.layer.borderColor = [UIColor yellowColor].CGColor;
        }];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Create by code
    CustomButton *btn = [[CustomButton alloc] init];
    [btn setTitle:@"CustomButton[byCode]" forState:UIControlStateNormal];
    btn.style = @"btn-bordered";
    btn.frame = CGRectMake(20, 300, 230, 44);
    [self.view addSubview:btn];
    
    
}



@end
