# LAFramework

[![CI Status](http://img.shields.io/travis/LakeR/LAFramework.svg?style=flat)](https://travis-ci.org/LakeR/LAFramework)
[![Version](https://img.shields.io/cocoapods/v/LAFramework.svg?style=flat)](http://cocoapods.org/pods/LAFramework)
[![License](https://img.shields.io/cocoapods/l/LAFramework.svg?style=flat)](http://cocoapods.org/pods/LAFramework)
[![Platform](https://img.shields.io/cocoapods/p/LAFramework.svg?style=flat)](http://cocoapods.org/pods/LAFramework)


Base framework for iOS, inspired by Retrofit、Restless、JSPatch、Weex ...

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

LAFramework is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LAFramework"
```

## Introduction
[LANetworking]

Just define a protocol that inherits from `LAWebService`.

```objective-c
@GET("/users/{:user}/repos")
@Cache("1D")
- (LANSignal(GithubRepo))listRepos:(NSString*)user;


@GET("/repos/{:owner}/{:repo}")
@Headers({"Token":"AABB-CCDD-EE"})
- (LANSignal(void))listRepository:(NSString *)owner repo:(Part("repo") NSString *)arg;
```


The `LANetworkingBuilder` class generates an implementation of the `GitHubService` protocol.

```objective-c
id<GitHubService> service = [[LANetworkingBuilder initBuilderWithBlock:^(LANetworkingBuilder *builder) {
    builder.baseURL = [NSURL URLWithString:@"https://api.github.com"];
}] create:@protocol(GitHubService)];
```

Each `RACSignal` returned from the created `GitHubService` can make an asynchronous HTTP request to the remote webserver.

```objective-c
[[service listRepos:@"huhk345"] subscribeNext:^(LAURLResponse *response) {
    NSLog(@"reponse %@",response.responseObject);
}];


[[service listRepository:@"huhk345" repo:@"LAFramework"] subscribeNext:^(LAURLResponse *response) {
    NSLog(@"reponse %@",response.responseObject);
}];
```


## Author

LakeR,njlaker@gmail.com	

## License

LAFramework is available under the MIT license. See the LICENSE file for more info.
