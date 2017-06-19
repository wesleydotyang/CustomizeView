# CustomizeView

A simple way to define style of view and apply style on view when you want modify controls/views a bit and do not want creat more custom classes.

## Usage
1. #import "UIView+CVCustomize.h"
2. Setup your styles for views before view loads.
```
[UIView registerStyle:@"view-blue" withCustomizeBlock:^(UIView *view) {
            view.backgroundColor = [UIColor blueColor];
            ...
}];
        
[UIButton registerStyle:@"btn-bordered" withCustomizeBlock:^(UIButton *view) {
            view.layer.borderWidth = 2;
            view.layer.borderColor = [UIColor blackColor].CGColor;
            ...
}];

[SomeCustomButton registerStyle:@"btn-bordered" withCustomizeBlock:^(UIButton *view) {
            ...
}];
 
```

3 Setting style for your views in xib

![...](https://github.com/wesleydotyang/CustomizeView/blob/master/xib-style.png)

Setting style by code

```
someButton.style = @"btn-bordered"
```
