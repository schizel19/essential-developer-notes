//
//  ApiClient.swift
//  RequirementAnalysis
//
//  Created by Patrick Domingo on 7/26/22.
//

import Foundation

struct User {}
// This is how a singleton is made
class ApiClient {
    static let instance = ApiClient()
    private init() {}
    
    static func getInstance() -> ApiClient {
        return instance
    }
    
    func loadUsers(completion: @escaping ([User]) -> Void) { }
}

let client = ApiClient.getInstance()

// Singletons should be open for extension in the future
struct FeedItem {}
class FeedsClient: ApiClient {
    func loadFeed(completion: @escaping ([FeedItem]) -> Void) { }
    override func loadUsers(completion: @escaping ([User]) -> Void) {
        print("overriding!")
        super.loadUsers(completion: completion)
    }
}

/*
 * Singletons should not be final, but because Swift has
 * an extension functionality, it is fine to introduce it as final
 */
struct Profile {}
final class ProfileClient {
    func loadProfile(completion: @escaping (Profile) -> Void) { }
}

extension ProfileClient {
    func hideProfile(_ profile: Profile) { }

    //  override func loadProfile(completion: @escaping (Profile) -> Void) { }
    // Overriding here is a syntax error
}

/*
 * singleton with a small 's' refers to the class that is being instantiated only one time in the whole lifecycle of the app
 * however its API does not prohibit developers creating a new instance of the class
 * some example are Apple's URLSession.shared and UserDefaults.shared
 */

final class MediaClient {
    var url: URL!
    static let shared = MediaClient(url: URL(string: "somemediaurl.com")!)
    
    init(url: URL) {
        self.url = url
    }
    
    func loadUrl(completion: @escaping (String) -> Void) {
        completion(url.absoluteString)
    }
}

class SomeViewModel {
    var mediaClient: MediaClient
    init() {
        mediaClient = MediaClient(url: URL(string: "test.com")!)
    }
    func load() {
        MediaClient.shared.loadUrl { url in
            print(url) // prints "somemediaurl.com"
        }
        mediaClient.loadUrl { url in
            print(url) // prints "test.com
        }
    }
}

/*
 * Global mutable states look similar to singletons but they are different
 * They are convenient to use but you must remember to take note of it and the risk of using it
 */
class CatFeedApiClient {
    private(set) var count = 0
    static var shared = CatFeedApiClient()
    func countUp() {
        count += 1
    }
}

class SomeViewController {
    func load() {
        CatFeedApiClient.shared.countUp()
        CatFeedApiClient.shared.countUp()
        print(CatFeedApiClient.shared.count) // prints 2
        CatFeedApiClient.shared = CatFeedApiClient()
        CatFeedApiClient.shared.countUp() // prints 1
    }
}


