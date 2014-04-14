#import <appteros/delegate.h>

#include <appteros/app.h>

int main(int argc, char *argv[]) {
    CefMainArgs main_args(argc, argv);
    CefRefPtr<AppterosApp> app(new AppterosApp);

    NSAutoreleasePool* autopool = [[NSAutoreleasePool alloc] init];
    CefSettings settings;
    CefInitialize(main_args, settings, app.get(), NULL);

    NSObject* delegate = [[AppterosDelegate alloc] init];

    [delegate performSelectorOnMainThread:@selector(createApp:) withObject:nil
                            waitUntilDone:NO];

    CefRunMessageLoop();

    CefShutdown();
    [autopool release];

    return 0;
}

