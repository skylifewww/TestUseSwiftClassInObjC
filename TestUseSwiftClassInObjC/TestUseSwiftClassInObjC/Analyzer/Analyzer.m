//
//  Analyzer.m
//  TestUseSwiftClassInObjC
//
//  Created by Vladimir Nybozhinsky on 7/6/19.
//  Copyright © 2019 skylife. All rights reserved.
//

#import "Analyzer.h"

@implementation Analyzer

- (instancetype)initWithUser:(User *)user
{
    self = [super init];
    if (self) {
        NSLog(@"%@", [user convertToDictionary]);
    }
    return self;
}

@end
