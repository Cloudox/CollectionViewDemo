//
//  CollectionViewCell.m
//  CollectionViewDemo
//
//  Created by csdc-iMac on 2017/3/28.
//  Copyright © 2017年 Cloudox. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        int x = arc4random() % 10;// [0, 10)的随机数
        NSLog(@"%d", x);
        
        // 图片
        self.image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.image.image = x >= 5 ? [UIImage imageNamed:@"boy.jpg"] : [UIImage imageNamed:@"girl.jpg"];
        [self.contentView addSubview:self.image];
        
        // 文字
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, frame.size.height - 25, frame.size.width - 20, 20)];
        self.label.text = x >= 5 ? @"鬼助" : @"百姬";
        self.label.textColor = [UIColor whiteColor];
        self.label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.label];
        
    }
    return self;
}

@end
