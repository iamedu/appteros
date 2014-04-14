#import <Cocoa/Cocoa.h>

#include <appteros/app.h>

int main(int argc, char *argv[]) {
    CefMainArgs main_args(argc, argv);
    CefRefPtr<AppterosApp> app(new AppterosApp);

    NSAutoreleasePool* autopool = [[NSAutoreleasePool alloc] init];
    CefSettings settings;
    CefInitialize(main_args, settings, app.get(), NULL);

    CefRunMessageLoop();

    CefShutdown();
    [autopool release];

    return 0;
}

