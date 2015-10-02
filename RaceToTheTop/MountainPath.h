//
//  MountainPath.h
//  RaceToTheTop
//
//  Created by Dustin M on 10/2/15.
//  Copyright © 2015 Vento. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MountainPath : NSObject

+(NSArray *)mountainPathsForRect:(CGRect)rect;

+(UIBezierPath *)tapTargetForPath:(UIBezierPath *)path;

@end
