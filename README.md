# IndoorLocation core classes for iOS

![Build status](https://img.shields.io/gitlab/pipeline/mapwize/indoor-location-ios-mirror/master)
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/indoorlocation/indoor-location-ios)
![Cocoapods](https://img.shields.io/cocoapods/v/IndoorLocation)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## Core classes

### IndoorLocation

IndoorLocation is a simple object defining a location inside a building using latitude, longitude and floor. The following properties are available:

- `double latitude` latitude in degrees N of the equator
- `double longitude` longitude in degrees E of the prime meridian
- `NSNumber* floor` floor number which can be decimal
- `double accuracy` uncertainty in meters
- `NSDate* timestamp` when the location was created
- `NSString* providerName` the name of the provider who produced the location

Besides the default `init`, the following constructor is defined:

```
- (instancetype) initWithLatitude:(double) latitude longitude:(double) longitude floor:(NSNumber*) floor;

```

### IndoorLocationProvider

Abstract class to serve as a base for any provider. A provider is basically a class that emits IndoorLocations.

### IndoorLocationProviderListener

Interface that you must implement to receive events from IndoorLocation providers.

## Support

For any support with this provider, please do not hesitate to contact [support@mapwize.io](mailto:support@mapwize.io)

## License

MIT
