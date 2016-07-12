//
//  FireViewController.m
//  EmitterDemo
//
//  Created by 赵朋 on 16/7/12.
//  Copyright © 2016年 赵朋. All rights reserved.
//

#import "FireViewController.h"

@interface FireViewController ()

/* 火焰 */
@property (nonatomic, strong) CAEmitterLayer *fireLayer;


/* 烟雾 */
@property (nonatomic, strong) CAEmitterLayer *smokeLayer;


@end

@implementation FireViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    
    self.fireLayer = [CAEmitterLayer layer];
    self.smokeLayer = [CAEmitterLayer layer];
    
//    发射位置
    self.fireLayer.emitterPosition = CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height-100);
    
//    发射源的尺寸大小
    self.fireLayer.emitterSize = CGSizeMake(50, 0);
    
    self.fireLayer.emitterMode = kCAEmitterLayerOutline;
    self.fireLayer.renderMode = kCAEmitterLayerAdditive;
    
    
//    烟雾
    self.smokeLayer.emitterPosition = CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height-100);
    self.smokeLayer.emitterMode	= kCAEmitterLayerPoints;
    
    
    /**
     *  cell
     */
    CAEmitterCell *fireCell = [CAEmitterCell emitterCell];
    [fireCell setName:@"fire"];
    
    //粒子参数的速度乘数因子
    fireCell.birthRate			= 500;
    
    
    fireCell.emissionLongitude  = M_PI_2;
    
    //粒子速度
    fireCell.velocity			= -80;
    
    //粒子的速度范围
    fireCell.velocityRange		= 30;
    
    //周围发射角度
    fireCell.emissionRange		= 1.1;
    
    //粒子y方向的加速度分量
    fireCell.yAcceleration		= -200;
    
    fireCell.scaleSpeed			= 0.3;
    fireCell.lifetime			= 1;
    fireCell.lifetimeRange		= (1 * 0.35);
    
    fireCell.color = [[UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1] CGColor];
    fireCell.contents = (id) [[UIImage imageNamed:@"DazFire"] CGImage];
    
    
    
    
//    烟雾cell
    CAEmitterCell* smoke = [CAEmitterCell emitterCell];
    [smoke setName:@"smoke"];
    
    smoke.birthRate			= 11;
    smoke.emissionLongitude = -M_PI / 2;
    smoke.lifetime			= 4;
    smoke.velocity			= -40;
    smoke.velocityRange		= 20;
    smoke.emissionRange		= M_PI / 4;
    smoke.spin				= 1;
    smoke.spinRange			= 6;
    smoke.yAcceleration		= -160;
    smoke.contents			= (id) [[UIImage imageNamed:@"DazSmoke"] CGImage];
    smoke.scale				= 0.1;
    smoke.alphaSpeed		= -0.12;
    smoke.scaleSpeed		= 0.7;
    smoke.color = [[UIColor colorWithRed:1 green:1 blue:1 alpha:1 * 0.3] CGColor];
    
    
    self.smokeLayer.emitterCells = @[smoke];
    self.fireLayer.emitterCells = @[fireCell];
    
    [self.view.layer addSublayer:self.smokeLayer];
    [self.view.layer addSublayer:self.fireLayer];
    
//    [self setFireAmount:1];
    
    
 
    
}



- (void) setFireAmount:(float)zeroToOne
{
    // Update the fire properties
    [self.fireLayer setValue:[NSNumber numberWithInt:(zeroToOne * 500)]
                  forKeyPath:@"emitterCells.fire.birthRate"];
    
    [self.fireLayer setValue:[NSNumber numberWithFloat:zeroToOne]
                  forKeyPath:@"emitterCells.fire.lifetime"];
    
    [self.fireLayer setValue:[NSNumber numberWithFloat:(zeroToOne * 0.35)]
                  forKeyPath:@"emitterCells.fire.lifetimeRange"];
    
    self.fireLayer.emitterSize = CGSizeMake(50 * zeroToOne, 0);
    
    [self.smokeLayer setValue:[NSNumber numberWithInt:zeroToOne * 4]
                   forKeyPath:@"emitterCells.smoke.lifetime"];
    
    [self.smokeLayer setValue:(id)[[UIColor colorWithRed:1 green:1 blue:1 alpha:zeroToOne * 0.3] CGColor]
                   forKeyPath:@"emitterCells.smoke.color"];
}















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
