#import <Foundation/Foundation.h>

@class ILIndoorLocation;
#import "ILIndoorLocationProviderDelegate.h"

@interface ILIndoorLocationProvider : NSObject

@property (nonatomic,strong) NSMutableArray<id<ILIndoorLocationProviderDelegate>>* delegates;

- (instancetype) init;

- (void) addDelegate:(id<ILIndoorLocationProviderDelegate>) delegate;

- (void) removeDelegate:(id<ILIndoorLocationProviderDelegate>) delegate;

- (void) dispatchDidUpdateLocation:(ILIndoorLocation*) location;

- (void) dispatchDidFailWithError:(NSError*) error;

- (void) dispatchDidStart;

- (void) dispatchDidStop;

- (BOOL) supportsFloor;

- (void) start;

- (void) stop;

- (BOOL) isStarted;

- (NSString*) getName;

@end

