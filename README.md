# CCPopUpNavController



![](https://img.shields.io/badge/Swift-3.0-green.svg)
![](https://img.shields.io/badge/license-MIT-blue.svg)


## Description
*CCPopUpNavController* is a pop-up view, the type is a NavigationController,through create a new controller as the CCPopUpNavController's rootviewcontroller can be easily placed in which you want the view or control, easier to achieve the desired effect 


## ScreenShot

<img src="demo.gif" alt="img" width="300px">

## Install

Copy the source code in you project

You can copy the `CCPopUpNavController` folder and its source file `CCPopUpTransition.swift`,`CCPopUpNavController.swift` in your project.

## Useage

### You must set the CCPopUpNavController.view.frame. the height is the pop view's visible height

```swift

/// useage 1
let ccnavi = CCPopUpNavController(rootViewController: vc)
///must set CCPopUpNavController.view.frame
ccnavi.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)

```

or


```swift
/// useage 2
    let ccnavi = CCPopUpNavController(rootViewController: vc, 
                                           configuration: CCPopUpNavController.optionalValue(
                                           tapDismissEnable: true, 
                                         annimationDuration: 0.35, 
                                       backgroundShadeColor: UIColor.black, 
                                             scaleTransform: CGAffineTransform(scaleX: 0.94, y: 0.94), 
                                              springDamping: 0.88, 
                                             springVelocity: 14, 
                                       backgroundShadeAlpha: 0.4))
 /// must set CCPopUpNavController.view.frame
    ccnavi.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
```



## License

CCPopUpNavController is available under the MIT license. See the LICENSE file for more info.
