//
//  TCPClientObject.h
//  SocketReceiveSample
//
//  Created by Cherry_Cheng on 2015/5/4.
//  Copyright (c) 2015年 cwt100. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDAsyncSocket.h"

@protocol TCPClientObjectDelegate;

@interface TCPClientObject : NSObject

@property (strong, nonatomic) id<TCPClientObjectDelegate> delegate;

- (void)disconnect;

@end

@protocol TCPClientObjectDelegate

@optional
- (void)tcpClientObject:(TCPClientObject *)tcpClientObject didReceiveData:(NSData *)receiveData;

@end
