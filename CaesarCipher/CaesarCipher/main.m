//
//  main.m
//  CaesarCipher
//
//  Created by Michael Kavouras on 6/21/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CaesarCipher : NSObject

- (NSString *)encode:(NSString *)string offset:(int)offset;
- (NSString *)decode:(NSString *)string offset:(int)offset;
- (BOOL) codeBreaker:(NSString *)Message1 secondMessage: (NSString *)message2;
//xiulan and i added this on tueday.  this will have a bool returned (yes/no method)
@end


@implementation CaesarCipher{
    NSString *message1;
    NSString *message2;
}

- (NSString *)encode:(NSString *)string offset:(int)offset {
    if (offset > 25) {
        NSAssert(offset < 26, @"offset is out of range. 1 - 25");
    }
    NSString *str = [string lowercaseString];
    unsigned long count = [string length];
    unichar result[count];
    unichar buffer[count];
    [str getCharacters:buffer range:NSMakeRange(0, count)];
    
    char allchars[] = "abcdefghijklmnopqrstuvwxyz";

    for (int i = 0; i < count; i++) {
        if (buffer[i] == ' ' || ispunct(buffer[i])) {
            result[i] = buffer[i];
            continue;
        }
        
        char *e = strchr(allchars, buffer[i]);
        int idx= (int)(e - allchars);
        int new_idx = (idx + offset) % strlen(allchars);

        result[i] = allchars[new_idx];
    }

    return [NSString stringWithCharacters:result length:count];
}

- (NSString *)decode:(NSString *)string offset:(int)offset {
    return [self encode:string offset: (26 - offset)];
}
//
//- (BOOL) codeBreaker:(NSString *)message1 secondMessage: (NSString *)message2{
//    
//    if ([message1 length] != [message2 length]) return NO;
//    if ([message1 isEqualToString:message2]) return YES;
//    if (int i = 1; i < 26; i++){
//        [message1 isEqualToString:message2
//        }
//
//    }
-(BOOL)codeBreaker:(NSString *)message1 secondMessage:(NSString *)message2 {
    
    
    //     i have to see if the two are the same legnth first and for most

    if ([message1 length] != [message2 length]) {
        NSLog(@" different lengths, so they are  not the same.");
        return NO;
    } else {
        // STUCK!!!
        //suggested that i compare these  two messages but i thought i already did.
        //
        for (int i = 0; i < 26; i++){
            if ([message1 isEqualToString:[self encode:message2 offset:i]]) {
                return YES;
            }
        }
    }
    return NO;
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
       // for  (int i = 1, i < 26, i++){
         //   NSLog(@"%@",  )
        CaesarCipher *check = [[CaesarCipher alloc] init];
        
        //set message1 and message2, you can change them to anything you like.
        NSString *message1 = [check encode:@"This is a secret" offset:2];
        NSString *message2 = [check encode:@"This is not a secret" offset:7];
        //print  message1 and message2
        NSLog(@"and the message behind the first curtain is... %@", message1);
        NSLog(@"and the message behind the second curtain is... %@", message2);
        //create a bool to run the codeBreaker method for them
        BOOL checkSameText = [check codeBreaker:message1 secondMessage:message2];
        //print out the result
        NSLog(@"And the outcome is %d. (where 1 means Yes, 0 means No.)", checkSameText);
        
        //could not have done this without xiulan
    
        
        
    }
}
