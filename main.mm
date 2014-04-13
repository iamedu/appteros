#import <Cocoa/Cocoa.h>

#include "include/cef_app.h"

int main(int argc, char *argv[]) {
    CefMainArgs main_args(argc, argv);
    NSAutoreleasePool* autopool = [[NSAutoreleasePool alloc] init];



    CefShutdown();
    [autopool release];

    return 0;
}

