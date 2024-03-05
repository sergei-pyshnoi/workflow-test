#import <Foundation/Foundation.h>
#import <Security/Security.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SecKeychainRef defaultKeychain = NULL;
        OSStatus status = SecKeychainCopyDefault(&defaultKeychain);
        if (status == errSecSuccess) {
            NSLog(@"Default keychain found");
            // Use the default keychain here, e.g., list items, add items, etc.
            CFRelease(defaultKeychain);
        } else {
            NSLog(@"Error finding default keychain: %d", (int)status);
        }
    }
    return 0;
}