#include "CARootListController.h"

@implementation CARootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

-(void)twitter{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/0xc0ldra1n"]];
}

@end
