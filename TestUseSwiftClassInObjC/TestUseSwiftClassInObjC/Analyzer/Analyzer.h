//
//  Analyzer.h
//  TestUseSwiftClassInObjC
//
//  Created by Vladimir Nybozhinsky on 7/6/19.
//  Copyright © 2019 skylife. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestUseSwiftClassInObjC-Swift.h"

NS_ASSUME_NONNULL_BEGIN

@interface Analyzer : NSObject

- (instancetype)initWithUser:(User *)user;

@end

NS_ASSUME_NONNULL_END
