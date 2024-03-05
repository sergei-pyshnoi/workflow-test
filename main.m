#import <Foundation/Foundation.h>
#import <Security/Security.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SecKeychainRef defaultKeychain = NULL;
        OSStatus status = SecKeychainCopyDefault(&defaultKeychain);
        if (status == errSecSuccess) {
            CFStringRef keychainPath = NULL;
            status = SecKeychainCopyPath(defaultKeychain, &keychainPath);
            if (status == errSecSuccess) {
                NSString *path = (__bridge NSString *)keychainPath;
                NSLog(@"Default keychain path: %@", path);
                CFRelease(keychainPath);
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