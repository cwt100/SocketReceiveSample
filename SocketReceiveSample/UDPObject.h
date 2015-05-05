//
//  UDPObject.h
//  SocketReceiveSample
//
//  Created by Cherry_Cheng on 2015/4/28.
//  Copyright (c) 2015年 cwt100. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDAsyncUdpSocket.h"

@protocol UDPObjectDelegate;

@interface UDPObject : NSObject <GCDAsyncUdpSocketDelegate>

@property (strong, nonatomic) id<UDPObjectDelegate> delegate;

- (void)closeSocket;

@end

@protocol UDPObjectDelegate

@optional
- (void)udpObject:(UDPObject *)udpObject didReceiveData:(NSData *)receiveData;

@end
