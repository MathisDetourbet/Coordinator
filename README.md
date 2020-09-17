# Coordinator
Coordinator is a light navigation interface for iOS mobile apps. Basically, Coordinator is a design pattern which comes from the NSSpain conference in 2015. The speaker Soroush Khanlou was explaining the following problem: "One of the biggest problems with the big view controllers is that they entangle your flow logic, view logic, and business logic." (http://khanlou.com/2015/01/the-coordinator/).

So, Coordinator should help you to split your navigation code in multiple objects because a UIViewController doesn't should know the navigation. From that, you will create piece of code reusable anywhere in your app! :)

## Code example
Firstly, you have to know the type of your rootViewController. I mean, is it a UIViewController, UINavigationController or UITabBarController. Then, create your class `RootCoordinator` which inherits from Coordinator or NavCoordinator or TabBarCoordinator.

```
class RootCoordinator: TabBarCoordinator {
  override func start() {
    // add your implementation here!
  }
}
```

Then, get your rootViewController usually found in your appDelegate's windows and instance it like this:
```
guard let tabBarController = window?.rootViewController as? UITabBarController else {
  fatalError("RootViewController should not be nil")
}
rootCoordinator = RootCoordinator(controller: tabBarController)
rootCoordinator.start()
```

In that example, the rootViewController is of type UITabBarController.

:warning: Do not forget to keep a strong reference of your rootCoordinator.

## Installation
For now, copy-paste the Coordinator folder in your project. A pod is coming soon!
