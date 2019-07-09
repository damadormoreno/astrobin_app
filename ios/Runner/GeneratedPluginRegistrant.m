//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <firebase_analytics/FirebaseAnalyticsPlugin.h>
#import <path_provider/PathProviderPlugin.h>
#import <share/SharePlugin.h>
#import <shared_preferences/SharedPreferencesPlugin.h>
#import <sqflite/SqflitePlugin.h>
#import <wallpaper/WallpaperPlugin.h>
#import <youtube_player/YoutubePlayerPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTFirebaseAnalyticsPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseAnalyticsPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
  [FLTSharePlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharePlugin"]];
  [FLTSharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharedPreferencesPlugin"]];
  [SqflitePlugin registerWithRegistrar:[registry registrarForPlugin:@"SqflitePlugin"]];
  [WallpaperPlugin registerWithRegistrar:[registry registrarForPlugin:@"WallpaperPlugin"]];
  [YoutubePlayerPlugin registerWithRegistrar:[registry registrarForPlugin:@"YoutubePlayerPlugin"]];
}

@end
