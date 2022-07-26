
### Singleton

The Singleton pattern as described in the Design Patterns book (GOF - Gang of Four) by Gamma, Johnson, Vlissides, and Helm is a way to make sure that a class has only one instance and it provides a single point of access to it. The pattern specifies that the class itself should be responsible for keeping track of its sole instance. It can further ensure that no other instance can be created by intercepting requests for creating new objects and provide a way to access the sole instance.

`static let` in Swift acts as a lazy loaded constant.

In the book, a Singleton should be open for extensions and modifications in the future. As such, there are two ways to make it:

```swift
class Singleton {
    func doSomething(){}
}

class SingletonClone: Singleton {
    func doAnotherThing(){ }
    override func doSomething(){}
}
```

This allows the singleton to be subclassed and overwritten; or

```swift
final class Singleton {
    func doSomething(){}
}
extension Singleton {
    func doAnotherThing(){}
}
```
where only extension of the singleton is allowed.
\
Singleton with a lower case s, more specifically ***singleton*** constitutes a class that is being instantiated only one time in the whole lifecycle of the app; however its API does not prohibit developers from creating a new instance of the class.

Some examples of such objects are Apple’s `URLSession.shared` and `UserDefaults.standard`. Although they offer a shared instance for accessing an immutable reference (get only) of themselves, they also allow their clients to create other instances through their initializers.

You can test Singletons by subclassing and property injection

```swift
class Singleton {
    static let shared = Singleton()
    private init() {}
    func doSomething(){}
}
class SingletonClone: Singleton {
    override func doSomething(){}
}
class SomeViewModel {
    var singleton = Singleton.shared
    func doSomething {
        singleton.doSomething { }
    }
}
class SomeViewModelTest {
    func test() {
        let vm = SomeViewModel()
        vm.singleton = SingletonClone()
        vm.doSomething()
    }
}
```
\
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