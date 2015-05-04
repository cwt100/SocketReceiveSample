//
//  TCPClientObject.h
//  SocketReceiveSample
//
//  Created by Cherry_Cheng on 2015/5/4.
//  Copyright (c) 2015年 simplo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDAsyncSocket.h"

@protocol TCPClientObjectDelegate;

@interface TCPClientObject : NSObject

@property (strong, nonatomic) id<TCPClientObjectDelegate> delegate;

@end

@protocol TCPClientObjectDelegate

@optional
- (void)tcpClientObject:(TCPClientObject *)tcpClientObject didReceiveData:(NSData *)receiveData;

@end
