//
//  TCPClientObject.m
//  SocketReceiveSample
//
//  Created by Cherry_Cheng on 2015/5/4.
//  Copyright (c) 2015年 simplo. All rights reserved.
//

#import "TCPClientObject.h"

@interface TCPClientObject ()<GCDAsyncSocketDelegate>

@end

@implementation TCPClientObject {
    GCDAsyncSocket *gcdAsyncSocket;
}

- (id)init{
    self = [super init];
    if (self) {
        
        gcdAsyncSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
        BOOL isConnected = [gcdAsyncSocket connectToHost:@"192.168.1.254" onPort:3333 error:nil];
        NSLog(@"isConnected: %@", [NSNumber numberWithBool:isConnected]);
        
    }
    return self;
}

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port {
    NSLog(@"didConnectToHost");
    [gcdAsyncSocket readDataWithTimeout:-1 tag:0];
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    NSLog(@"tcp client receiveData: %@", data);
    [self.delegate tcpClientObject:self didReceiveData:data];
    [gcdAsyncSocket readDataWithTimeout:-1 tag:0];
}

@end
