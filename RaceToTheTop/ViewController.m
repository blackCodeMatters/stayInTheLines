//
//  ViewController.m
//  RaceToTheTop
//
//  Created by Dustin M on 9/30/15.
//  Copyright © 2015 Vento. All rights reserved.
//

#import "ViewController.h"
#import "PathView.h"
#import "MountainPath.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet PathView *pathView;
@property (strong, nonatomic) NSTimer *timer;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
    tapRecognizer.numberOfTapsRequired = 2;
    [self.pathView addGestureRecognizer:tapRecognizer];
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panDetected:)];
    [self.pathView addGestureRecognizer:panRecognizer];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tapDetected:(UITapGestureRecognizer *)tapRecognizer
{
    NSLog(@"tapped");
    CGPoint tapLocation = [tapRecognizer locationInView:self.pathView];
    NSLog(@"tap location is at %f %f", tapLocation.x, tapLocation.y);
}

-(void)panDetected:(UIPanGestureRecognizer *)panRecognizer
{
    CGPoint panLocation = [panRecognizer locationInView:self.pathView];
    //NSLog(@"panned at %f %f", panLocation.x, panLocation.y);
    for (UIBezierPath *path in [MountainPath mountainPathsForRect:self.pathView.bounds]){
        UIBezierPath *tapTarget = [MountainPath tapTargetForPath:path];
        if([tapTarget containsPoint:panLocation]){
            NSLog(@"you hit the wall");
        }
    }
    
}

-(void)timerFired
{
    NSLog(@"Fired");
}


@end
