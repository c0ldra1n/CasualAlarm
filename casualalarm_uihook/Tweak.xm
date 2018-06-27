#import <UIKit/UIKit.h>

#define CAEnabled [preferenceObjectForKey(@"enabled") boolValue]
#define CAPreference [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/io.c0ldra1n.casualalarm-prefs.plist"]

static id preferenceObjectForKey(NSString *key){
	return [[[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/io.c0ldra1n.casualalarm-prefs.plist"] objectForKey:key];
}

@interface EditAlarmViewController : UIViewController 

-(void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2 ;
-(id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2 ;

@end

%hook EditAlarmViewController

-(void)tableView:(id)arg1 didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	if(CAEnabled || !CAPreference){
		if(indexPath.row == 2){
				UIAlertController *uac = [UIAlertController alertControllerWithTitle:@"You have CasualAlarm Enabled" message:@"Disable CasualAlarm to play a song of your choice." preferredStyle:UIAlertControllerStyleAlert];
				UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Well that is casual." style:UIAlertActionStyleDefault handler:nil];
				[uac addAction:ok];
			    [self presentViewController:uac animated:YES completion:nil];
				[arg1 deselectRowAtIndexPath:indexPath animated:true];
			}else{
				%orig;
			}
	}else{
		
		%orig;
	}
}

-(id)tableView:(id)arg1 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	if(CAEnabled || !CAPreference){
		if(indexPath.row == 2){
			UITableViewCell *cell = %orig;
			cell.detailTextLabel.text = @"Random Song";
			return cell;
			}else{
				return %orig;
			}
	}else{
		return %orig;
	}
}

%end