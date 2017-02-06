//
//  AppDelegate.m
//  Overlay Cursor Image
//
//  Created by Varun Mehta on 2/5/17.
//  Copyright © 2017 Varun Mehta. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSImageView *imageView;
@end

@implementation AppDelegate

CFMachPortRef eventTap;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    UInt64 eventMask = 1 << NSEventTypeMouseMoved | 1 << NSEventTypeLeftMouseDragged | 1 << NSEventTypeRightMouseDragged;
    NSRect rect = [[NSScreen mainScreen] frame];
    
    [self.window setStyleMask:NSWindowStyleMaskBorderless];
    self.window.opaque = NO;
    self.window.backgroundColor = [NSColor clearColor];
    [self.window setFrame:rect display:YES];
    self.window.ignoresMouseEvents = YES;
    
    self.window.level = NSScreenSaverWindowLevel;
    
    [NSEvent addLocalMonitorForEventsMatchingMask:eventMask handler:^(NSEvent *event) {
        NSPoint location = [event locationInWindow];
        location.x -= 2; //mac cursor dimensions to offset the image by
        location.y -= 17;

        [self.imageView setFrameOrigin:location];
        return event;
    }];
    [NSEvent addGlobalMonitorForEventsMatchingMask:eventMask handler:^(NSEvent *event) {
        NSPoint location = [event locationInWindow];
        location.x -= 2; //mac cursor dimensions to offset the image by
        location.y -= 17;

        [self.imageView setFrameOrigin:location];
    }];
    NSLog(@"Hi");
}

//CGEventRef myCGEventCallback(CGEventTapProxy proxy, CGEventType type, CGEventRef event, void *refcon) {
//    NSLog(@"%@", NSStringFromPoint([NSEvent mouseLocation]));
//    //[[NSApplication sharedApplication] delegate]
//    return event;
//}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
