# Custom Animation Popup with storyboard
Custom Animation Popup 만들기
<br><br>


https://user-images.githubusercontent.com/56523702/116968316-3a49ac00-acef-11eb-9f7a-566fafd2cc9a.MP4


<br><br>
## 1. 사용 예제 Fade In Out (PopupType = .fadeInOut)

```swift
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let popVC = storyBoard.instantiateViewController(withIdentifier: "SNPopVC") as! SNPopVC

    popVC.showAnim(vc: self, type: .fadeInOut, parentAddView: self.view) { }
```

## 2. 사용 예제 Move (PopupType = .move)

Top Push Popup (PopupPosition = .top)<br>

```swift
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let popVC = storyBoard.instantiateViewController(withIdentifier: "SNPopVC") as! SNPopVC

    popVC.showAnim(vc: self, type: .move, position: .top, parentAddView: self.view) { }
```
<br>
Bottom Push Popup (PopupPosition = .bottom)<br>

```swift
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let popVC = storyBoard.instantiateViewController(withIdentifier: "SNPopVC") as! SNPopVC

    popVC.showAnim(vc: self, type: .move, position: .bottom, parentAddView: self.view) { }
```
<br>
Left Push Popup (PopupPosition = .left)<br>

```swift
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let popVC = storyBoard.instantiateViewController(withIdentifier: "SNPopVC") as! SNPopVC

    popVC.showAnim(vc: self, type: .move, position: .left, parentAddView: self.view) { }
```
<br>
Right Push Popup (PopupPosition = .right)<br>

```swift
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let popVC = storyBoard.instantiateViewController(withIdentifier: "SNPopVC") as! SNPopVC

    popVC.showAnim(vc: self, type: .move, position: .right, parentAddView: self.view) { }
```
<br>
Center Push Popup (PopupPosition = .center)<br>

```swift
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let popVC = storyBoard.instantiateViewController(withIdentifier: "SNPopVC") as! SNPopVC

    popVC.showAnim(vc: self, type: .move, position: .center, parentAddView: self.view) { }
```
<br><br>

## 블로그
[[iOS/Swift] Custom Animation Popup 만들기](https://sunidev.tistory.com/10)

