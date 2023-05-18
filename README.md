
# Make XCFramework

`Xcode14.2`  `CocoaPods 1.12.1`  `gem 3.0.3.1` `ruby 2.6.10p210`

* xcodeproj 
1. Set `General` -> `Supported Destinations`
2. Set `General` -> `Minimun Deployments`
3. Set `Build Settings` -> `Build Options` -> `Build Libraries for Distribution` => YES
4. Set `Build Settings` -> `Linking` -> `Mach-O Type` -> `Dynamic/Static Library`
* Pod
1. `pod init` && add dependency
2. `pod install`
* xcworkspace
1. Set `Pods` -> `Target` -> `Dependency SDK` -> `General` -> `Supported Destinations`
2. Set `Pods` -> `Target` -> `Dependency SDK` -> `General` -> `Minimun Deployments`
3. Set `Pods` -> `Target` -> `Dependency SDK` -> `Build Settings` -> `Build Options` -> `Build Libraries for Distribution` => YES
4. Add Code
5. Check `xcworkspace` -> `Build Phases` -> `Headers` && `Compile Sources`

* build.sh 
1. `./build.sh`

# FAQ

1. New Project exec `pod init`  tty show errors
    > can't modify frozen String (FrozenError)  
    > [Xcodeproj] Unknown object version (56). (RuntimeError)
    
    Fix:  
    Open `ProjectName.xcodeproj`->Select Project -> `Project Document`(on Xcode Right) -> `Project Format`-> Select `Xcode 13.0-compatible`
        
2. Pay attention to check whether the dependency supports the architecture of macOS
   Demo `Alamofire` not support macOS
   
3. The built XCFramework is assembled into the other `project`  
   1. `Project` add dependencies, such as Alamofire required in XPodFramework.xcframework
   2. Run Project will show error `Symbol not found ...`  
      Fix:  
      `Project` -> `Pods` -> `Target` -> `Dependency SDK` -> `Build Settings` -> `Build Options` -> `Build Libraries for Distribution` => YES
