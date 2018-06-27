#import "common.h"

#define CAEnabled [preferenceObjectForKey(@"enabled") boolValue]
#define CAPreference [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/io.c0ldra1n.casualalarm-prefs.plist"]



static id preferenceObjectForKey(NSString *key){
	return [[[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/io.c0ldra1n.casualalarm-prefs.plist"] objectForKey:key];
}

%hook Alarm

-(NSString *)sound{
	if(CAEnabled  || !CAPreference){
	NSArray *songs = [[%c(MPMediaQuery) songsQuery] items];
	NSUInteger randomIndex = arc4random_uniform([songs count]);
	
	MPMediaEntityPersistentID songID = [songs[randomIndex] persistentID];
		
	NSLog(@"[CasualAlarm]:\n[Alarm sound] access:\ncount(songs) = %d\nindex=%d\nsongID=%d", (int)songs.count, (int)randomIndex, (int)songID);
		
	return [NSString stringWithFormat:@"%llu", songID];
	
	}else{
		
		return %orig;
	}	
}

%end