//
//  LTConfigurationImpl.m
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 5/7/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

#import "LTConfiguration.h"

@implementation LTConfiguration {
    NSDictionary *_config;
    NSString *_configBundlePath;
    NSString *_configPlistFileName;
}

@synthesize configBundlePath = _configBundlePath;
@synthesize configPlistFileName = _configPlistFileName;

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        [self resetConfig];
    }
    return self;
}

- (id)configForKey:(NSString *)key {
    // Return config value for specified key
    return [_config objectForKey:key];
}

- (id)configForKey:(NSString *)key withDefaultValue:(id)defaultValue {
    // Get config value for specified key
    id configValue = [self configForKey:key];
    
    // Check if config value is found
    if (configValue == nil) {
        // Log configuration value is not found
        NSLog(@"Configuration value is not found for key: %@. Add key to "
              @"configuration file to override its default value.", key);
        
        // Then return default value
        return defaultValue;
    }
    
    // Check if config value responds to length selector
    if ([configValue respondsToSelector:@selector(length)]) {
        // Then check values length
        if ([configValue length] == 0) {
            // Log configuration value is not found
            NSLog(@"Configuration value is not found for key: %@. Add key to "
                  @"configuration file to override its default value.",
                  key);
            
            // Then return default value
            return defaultValue;
        }
    }
    
    // Otherwise return its value
    return configValue;
}

- (void)resetConfig {
    // Get bundle
    NSBundle *bundle = [NSBundle mainBundle];
    
    // Check if config bundle path is specified
    if ([_configBundlePath length] != 0) {
        // Find config bundle
        bundle = [NSBundle bundleWithPath:_configBundlePath];
    }
    
    // Check if plist name is specified
    if ([_configPlistFileName length] == 0 ||
        [_configPlistFileName isEqual: @"Info"]) {
        // Set configuration as info plist by default
        _config = [bundle infoDictionary];
        return;
    }
    
    // Otherwise get plist file path
    NSString *plistFilePath =
    [bundle pathForResource:_configPlistFileName ofType:@"plist"];
    
    // And set configuration
    _config = [[NSDictionary alloc] initWithContentsOfFile:plistFilePath];
}

#pragma mark Public Methods

+ (LTConfiguration *)sharedInstance {
    static LTConfiguration *configuration = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        configuration = [LTConfiguration new];
    });
    return configuration;
}

+ (id)configForKey:(NSString *)key {
    // Return config value for specified key
    return [[LTConfiguration sharedInstance] configForKey:key];
}

+ (id)configForKey:(NSString *)key withDefaultValue:(id)defaultValue {
    // Return config value for specified key with default value
    return [[LTConfiguration sharedInstance] configForKey:key
                                         withDefaultValue:defaultValue];
}

+ (NSString *)apiURL {
    return [LTConfiguration configForKey:@"Networking.ApiURL"];
}

+ (NSString *)environment {
    return [LTConfiguration configForKey:@"General.Environment"];
}

+ (BOOL)debuggingEnabled {
    return [LTConfiguration configForKey:@"" withDefaultValue:@(YES)];
}

@end
