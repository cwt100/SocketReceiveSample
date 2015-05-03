//
//  UDPObject.m
//  SocketReceiveSample
//
//  Created by Cherry_Cheng on 2015/4/28.
//  Copyright (c) 2015年 simplo. All rights reserved.
//

#import "UDPObject.h"

@implementation UDPObject {
    GCDAsyncUdpSocket *gcdAsyncUdpSocket;
}

- (id)init{
    self = [super init];
    if (self) {
        gcdAsyncUdpSocket = [[GCDAsyncUdpSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
        BOOL isBind = [gcdAsyncUdpSocket bindToPort:3333 error:nil];
        NSLog(@"isBind: %@", [NSNumber numberWithBool:isBind]);
        BOOL isBegineReceive = [gcdAsyncUdpSocket beginReceiving:nil];
        NSLog(@"isBeginReceive: %@", [NSNumber numberWithBool:isBegineReceive]);
    }
    return self;
}

- (void)udpSocket:(GCDAsyncUdpSocket *)sock didReceiveData:(NSData *)data fromAddress:(NSData *)address withFilterContext:(id)filterContext {
    
    NSLog(@"didReceiveData: %@", data);
    [self.delegate udpObject:self didReceiveData:data];
}

- (void)closeSocket {
    [gcdAsyncUdpSocket close];
}

@end
