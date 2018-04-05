#ifndef ILIndoorLocationProviderDelegate_h
#define ILIndoorLocationProviderDelegate_h

@class ILIndoorLocation;
@class ILIndoorLocationProvider;

@protocol ILIndoorLocationProviderDelegate <NSObject>

- (void) provider:(ILIndoorLocationProvider*) provider didUpdateLocation:(ILIndoorLocation*) location;

- (void) provider:(ILIndoorLocationProvider*) provider didFailWithError:(NSError *)error;

- (void) providerDidStart:(ILIndoorLocationProvider*) provider;

- (void) providerDidStop:(ILIndoorLocationProvider*) provider;

@end


#endif
