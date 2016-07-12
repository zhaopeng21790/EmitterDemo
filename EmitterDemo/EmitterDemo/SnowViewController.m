//
//  SnowViewController.m
//  EmitterDemo
//
//  Created by 赵朋 on 16/7/12.
//  Copyright © 2016年 赵朋. All rights reserved.
//

#import "SnowViewController.h"

@interface SnowViewController ()

/*  */
@property (nonatomic, strong) CAEmitterLayer *snowLayer;

@end

@implementation SnowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    UIImageView *img = [[UIImageView alloc] initWithFrame:self.view.bounds];
    img.image = [UIImage imageNamed:@"雪背景.jpeg"];
    [self.view addSubview:img];
    
    
    self.snowLayer = [CAEmitterLayer layer];
    _snowLayer.emitterPosition = CGPointMake(self.view.frame.size.width/2.0, -30);
    _snowLayer.emitterSize = CGSizeMake(self.view.bounds.size.width * 1.0, 0.0);
    
    _snowLayer.emitterMode = kCAEmitterLayerOutline;
    _snowLayer.emitterShape = kCAEmitterLayerLine;
    
    
    //cell
    CAEmitterCell *snowCell = [CAEmitterCell emitterCell];
    [snowCell setName:@"snow"];
    
    //粒子产生系数，默认1.0
    snowCell.birthRate = 3;
    snowCell.lifetime = 120.0;
    snowCell.scale = 1.0;
    
    snowCell.velocity = -10;
    snowCell.velocityRange = 200;
    
    snowCell.yAcceleration = 2;
    snowCell.emissionRange = 0.5 * M_PI;		// some variation in angle
    snowCell.spinRange		= 0.5 * M_PI;		// slow spin
    
    snowCell.contents		= (id) [[UIImage imageNamed:@"DazFlake"] CGImage];
    snowCell.color			= [[UIColor colorWithRed:0.600 green:0.658 blue:0.743 alpha:1.000] CGColor];
    
    
    
    // Make the flakes seem inset in the background
    _snowLayer.shadowOpacity = 1;
    _snowLayer.shadowRadius = 0;
    _snowLayer.shadowOffset = CGSizeMake(0, 1);
    _snowLayer.shadowColor = [UIColor whiteColor].CGColor;
    
    
    _snowLayer.emitterCells = [NSArray arrayWithObject:snowCell];
    [self.view.layer addSublayer:_snowLayer];
    
    
    
    
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
