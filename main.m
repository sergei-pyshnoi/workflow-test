#import <Foundation/Foundation.h>
#import <Security/Security.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SecKeychainRef defaultKeychain = NULL;
        OSStatus status = SecKeychainCopyDefault(&defaultKeychain);
        if (status == errSecSuccess) {
            UInt32 pathLength = 0;
            char *path = NULL;
            status = SecKeychainGetPath(defaultKeychain, &pathLength, NULL);
            if (status == errSecSuccess) {
                path = malloc(pathLength);
                status = SecKeychainGetPath(defaultKeychain, &pathLength, path);
                if (status == errSecSuccess) {
                    NSString *keychainPath = [NSString stringWithUTF8String:path];
                    NSLog(@"Default keychain path: %@", keychainPath);
                } else {
                    NSLog(@"Error getting default keychain path: %d", (int)status);
                }
                free(path);
            } else {
                NSLog(@"Error getting default keychain path length: %d", (int)status);
            }
            CFRelease(defaultKeychain);
        } else {
            NSLog(@"Error finding default keychain: %d", (int)status);
        }
    }
    return 0;
}