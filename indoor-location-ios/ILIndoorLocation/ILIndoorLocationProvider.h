#import <Foundation/Foundation.h>

@class ILIndoorLocation;
@protocol ILIndoorLocationProviderDelegate;

@interface ILIndoorLocationProvider : NSObject

@property (nonatomic,strong) NSMutableArray<id<ILIndoorLocationProviderDelegate>>* delegates;
@property (nonatomic,strong) ILIndoorLocation* lastLocation;

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

