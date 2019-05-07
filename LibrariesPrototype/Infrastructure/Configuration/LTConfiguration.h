//
//  LTConfiguration.h
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 5/7/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTConfiguration.h"

@interface LTConfiguration : NSObject

@property (nonatomic, strong, readonly) NSString* configBundlePath;
@property (nonatomic, strong, readonly) NSString* configPlistFileName;

+ (LTConfiguration *)sharedInstance;

/**
 *  Returns configuration value for specified key.
 *
 *  @param key Configuration key.
 *
 *  @return Configuration value.
 */
+ (id)configForKey:(NSString *)key;

/**
 *  Returns configuration value for specified key or specified default value.
 *
 *  @param key          Configuration key.
 *  @param defaultValue Default value for configuration.
 *
 *  @return Configuration value or specified default value.
 */
+ (id)configForKey:(NSString *)key withDefaultValue:(id)defaultValue;

+ (NSString *)apiURL;
+ (NSString *)environment;
+ (BOOL)debuggingEnabled;
- (void)resetConfig;

@end

