# SNPopup
Base Sample 3. Custom Animation Popup 만들기

## 1. 사용 예제 (PopupType = .fadeInOut)

```swift
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let popVC = storyBoard.instantiateViewController(withIdentifier: "SNPopVC") as! SNPopVC

    popVC.showAnim(vc: self, type: .fadeInOut, parentAddView: self.view) { }
```

## 2. 사용 예제 (PopupType = .move)

PopupPosition = .top<br>

```swift
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let popVC = storyBoard.instantiateViewController(withIdentifier: "SNPopVC") as! SNPopVC

    popVC.showAnim(vc: self, type: .move, position: .top, parentAddView: self.view) { }
```
<br>
PopupPosition = .bottom<br>

```swift
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let popVC = storyBoard.instantiateViewController(withIdentifier: "SNPopVC") as! SNPopVC

    popVC.showAnim(vc: self, type: .move, position: .bottom, parentAddView: self.view) { }
```
<br>
PopupPosition = .left<br>

```swift
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let popVC = storyBoard.instantiateViewController(withIdentifier: "SNPopVC") as! SNPopVC

    popVC.showAnim(vc: self, type: .move, position: .left, parentAddView: self.view) { }
```
<br>
PopupPosition = .right<br>

```swift
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let popVC = storyBoard.instantiateViewController(withIdentifier: "SNPopVC") as! SNPopVC

    popVC.showAnim(vc: self, type: .move, position: .right, parentAddView: self.view) { }
```
<br>
PopupPosition = .center<br>

```swift
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let popVC = storyBoard.instantiateViewController(withIdentifier: "SNPopVC") as! SNPopVC

    popVC.showAnim(vc: self, type: .move, position: .center, parentAddView: self.view) { }
```
<br><br>

## 블로그
[[iOS/Swift] Custom Animation Popup 만들기](https://sunidev.github.io/ios/make-custom-animation-popup/)

