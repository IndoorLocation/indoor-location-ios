#import "ILIndoorLocation.h"

@implementation ILIndoorLocation

- (instancetype) init {
    self = [super init];
    if (self) {
        self.timestamp = [NSDate date];
    }
    return self;
}

- (instancetype) initWithProvider:(ILIndoorLocationProvider*) provider latitude:(double) latitude longitude:(double) longitude floor:(NSNumber*) floor
{
    self = [super init];
    if (self) {
        self.providerName = [provider getName];
        self.latitude = latitude;
        self.longitude = longitude;
        self.floor = floor;
        self.timestamp = [NSDate date];
    }
    return self;
}

@end

