
### Singleton

The Singleton pattern as described in the *Design Patterns book (GOF - Gang of Four)* by Gamma, Johnson, Vlissides, and Helm is a way to make sure that a class has only one instance and it provides a single point of access to it. The pattern specifies that the class itself should be responsible for keeping track of its sole instance. It can further ensure that no other instance can be created by intercepting requests for creating new objects and provide a way to access the sole instance.
\
`static let` in Swift acts as a lazy loaded constant.
\
In the book, a Singleton should be open for extensions and modifications in the future. As such, there are two ways to make it:

```swift
class MediaClient {
    func loadMusic(){}
}
class PlayerClient: MediaClient {
    func playMusic(){}
    override func loadMusic(){
        super.loadMusic()
    }
}
```

This allows the singleton to be subclassed and overwritten; or utilizing *extension* with Swift and allows the Singleton to be *final*
```swift
final class ImageClient {
    func loadImage(){}
}
extension ImageClient {
    func loadImageThumbnail(){}
}
```

***singleton***
Singleton with a lower case s constitutes a class that is being instantiated only one time in the whole lifecycle of the app; however its API does not prohibit developers from creating a new instance of the class.
\
Some examples of such objects are Apple’s `URLSession.shared` and `UserDefaults.standard`. Although they offer a shared instance for accessing an immutable reference (get only) of themselves, they also allow their clients to create other instances through their initializers.

**Testing**
You can test Singletons by subclassing and property injection

```swift
class CatFeed {
    static let shared = CatFeed()
    private init() {}
    func showCats(){}
}
class HomeCatFeed: CatFeed {
    override func showCats(){}
}
class CatFeedViewModel {
    var catFeed = CatFeed.shared
    func loadCats() -> {
        catFeed.showCats()
    }
}
class CatFeedViewModelTest {
    func test() {
        let vm = CatFeedViewModel()
        vm.catFeed = HomeCatFeed()
        vm.showCats()
    }
}
```
**Global Mutable State**
Global mutable states might look like the same as Singletons however their instances are mutable and can be changed by everyone. This can be of use in some caes but must be taken note of and consider the risks it brings.

```swift
class GlobalMutableState {
    static var shared = GlobalMutableState()
    private(set) var count = 0
    func countUp() { count += 1 }
}
class ViewModel {
    func doSomething() {
        GlobalMutableState.shared.countUp()
        GlobalMutableState.shared.countUp()
        print(GlobalMutableState.shared.count) //prints 2
        GlobalMutableState.shared = GlobalMutableState()
        print(GlobalMutableState.shared.count) //prints 0
    }
} 
```