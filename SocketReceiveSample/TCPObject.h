//
//  TCPObject.h
//  SocketReceiveSample
//
//  Created by Cherry_Cheng on 2015/4/29.
//  Copyright (c) 2015年 simplo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDAsyncSocket.h"

@protocol TCPObjectDelegate;

@interface TCPObject : NSObject <GCDAsyncSocketDelegate>

@property (strong, nonatomic) id<TCPObjectDelegate> delegate;

@end

@protocol TCPObjectDelegate

@optional
- (void)tcpObject:(TCPObject *)tcpObject didReceiveData:(NSData *)receiveData;

@end