//
//  HttpGet.m
//  SocketReceiveSample
//
//  Created by Cherry_Cheng on 2015/10/12.
//  Copyright © 2015年 simplo. All rights reserved.
//

#import "HttpGet.h"

#define MJPEG_REQUEST_HEASER_TAG    0
#define MJPEG_REQUEST_BODY_TAG      1

@interface HttpGet()<GCDAsyncSocketDelegate>

@end

@implementation HttpGet {
    GCDAsyncSocket *gcdAsyncSocket;
}

- (id)init {
    self = [super init];
    if (self) {
        
        gcdAsyncSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
        BOOL isConnected = [gcdAsyncSocket connectToHost:@"192.168.1.254" onPort:8192 error:nil];
        NSLog(@"HttpGet isConnected: %@", [NSNumber numberWithBool:isConnected]);
    }
    return self;
}

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port {
    
    NSLog(@"HpptGet didConnectToHost");
    
    NSString *mjpegStreamRequest = @"GET / HTTP/1.1\r\n Host:192.168.1.254:8192\r\n\r\n";
    [gcdAsyncSocket writeData:[mjpegStreamRequest dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:MJPEG_REQUEST_HEASER_TAG];
    [gcdAsyncSocket readDataWithTimeout:-1 tag:MJPEG_REQUEST_HEASER_TAG];
}

- (dispatch_queue_t)newSocketQueueForConnectionFromAddress:(NSData *)address onSocket:(GCDAsyncSocket *)sock {
    return dispatch_get_main_queue();
}

- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag {
    NSLog(@"HttpGet didWriteDataWithTag: %ld", tag);
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    
    NSLog(@"HttpGet didReadData");
    if (tag == MJPEG_REQUEST_HEASER_TAG) {
        
        NSLog(@"HttpGet header Length: %ld", data.length);
        NSLog(@"HttpGet header: %@", data);
        [gcdAsyncSocket readDataWithTimeout:-1 tag:MJPEG_REQUEST_BODY_TAG];
    }else if (tag == MJPEG_REQUEST_BODY_TAG) {
        
        NSLog(@"HttpGet body Length: %ld", data.length);
        NSLog(@"HttpGet body: %@", data);
        [gcdAsyncSocket readDataWithTimeout:-1 tag:MJPEG_REQUEST_BODY_TAG];
    }
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err {
    NSLog(@"HttpGet socketDidDisconnect: %@", err);
}

@end
