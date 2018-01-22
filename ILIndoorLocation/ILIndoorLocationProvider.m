#import "ILIndoorLocationProvider.h"

@implementation ILIndoorLocationProvider

- (instancetype) init {
    self = [super init];
    if (self) {
        _delegates = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) addDelegate:(id<ILIndoorLocationProviderDelegate>) delegate {
    [_delegates addObject:delegate];
}

- (void) removeDelegate:(id<ILIndoorLocationProviderDelegate>) delegate {
    [_delegates removeObject:delegate];
}

- (BOOL) supportsFloor {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

- (void) start {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

- (void) stop {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

- (BOOL) isStarted {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

- (void) dispatchDidUpdateLocation:(ILIndoorLocation*) location {
    for (id<ILIndoorLocationProviderDelegate> providerDelegate in _delegates) {
        [providerDelegate provider:self didUpdateLocation:location];
    }
}

- (void) dispatchDidFailWithError:(NSError*) error {
    for (id<ILIndoorLocationProviderDelegate> providerDelegate in _delegates) {
        [providerDelegate provider:self didFailWithError:error];
    }
}

- (void) dispatchDidStart {
    for (id<ILIndoorLocationProviderDelegate> providerDelegate in _delegates) {
        [providerDelegate providerDidStart:self];
    }
}

- (void) dispatchDidStop {
    for (id<ILIndoorLocationProviderDelegate> providerDelegate in _delegates) {
        [providerDelegate providerDidStop:self];
    }
}

- (NSString*) getName {
    return  NSStringFromClass([self class]);
}

@end
