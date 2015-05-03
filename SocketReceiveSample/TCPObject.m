//
//  TCPObject.m
//  SocketReceiveSample
//
//  Created by Cherry_Cheng on 2015/4/29.
//  Copyright (c) 2015年 simplo. All rights reserved.
//

#import "TCPObject.h"

@implementation TCPObject {
    GCDAsyncSocket *gcdAsyncSocket;
}

- (id)init{
    self = [super init];
    if (self) {
        gcdAsyncSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
        BOOL isAccepted = [gcdAsyncSocket acceptOnPort:3333 error:nil];
        NSLog(@"isAccepted: %@", [NSNumber numberWithBool:isAccepted]);
    }
    return self;
}

- (void)socket:(GCDAsyncSocket *)sock didAcceptNewSocket:(GCDAsyncSocket *)newSocket {
    NSLog(@"didAcceptNewSocket");
    [newSocket readDataWithTimeout:-1 tag:0];
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    NSLog(@"tcp receiveData: %@", data);
    [self.delegate tcpObject:self didReceiveData:data];
}

@end
