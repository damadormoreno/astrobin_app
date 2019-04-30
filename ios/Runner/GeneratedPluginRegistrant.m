//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <path_provider/PathProviderPlugin.h>
#import <sqflite/SqflitePlugin.h>
#import <wallpaper/WallpaperPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
  [SqflitePlugin registerWithRegistrar:[registry registrarForPlugin:@"SqflitePlugin"]];
  [WallpaperPlugin registerWithRegistrar:[registry registrarForPlugin:@"WallpaperPlugin"]];
}

@end
