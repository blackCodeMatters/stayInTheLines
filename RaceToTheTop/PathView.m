//
//  PathView.m
//  RaceToTheTop
//
//  Created by Dustin M on 10/2/15.
//  Copyright © 2015 Vento. All rights reserved.
//

#import "PathView.h"
#import "MountainPath.h"

@implementation PathView

-(void)setup
{
    self.backgroundColor = [UIColor clearColor];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self){
        [self setup];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect
{
    for (UIBezierPath *path in [MountainPath mountainPathsForRect:self.bounds])
    {
        [[UIColor blackColor] setStroke];
        [path stroke];
    }
    

}


@end
