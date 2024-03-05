#import <Foundation/Foundation.h>
#import <Security/Security.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SecKeychainRef defaultKeychain = NULL;
        OSStatus status = SecKeychainCopyDefault(&defaultKeychain);
        if (status == errSecSuccess) {
            CFStringRef keychainName = NULL;
            status = SecKeychainGetPath(defaultKeychain, &keychainName);
            if (status == errSecSuccess) {
                NSString *name = (__bridge NSString *)keychainName;
                NSLog(@"Default keychain name: %@", name);
                CFRelease(keychainName);
            } else {
                NSLog(@"Error getting default keychain path: %d", (int)status);
            }
            CFRelease(defaultKeychain);
        } else {
            NSLog(@"Error finding default keychain: %d", (int)status);
        }
    }
    return 0;
}