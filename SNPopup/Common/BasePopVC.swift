//
//  BasePopVC.swift
//  SNPopup
//
//  Created by suni on 2021/04/12.
//

import UIKit
import SnapKit

/**
 # (E) PopupPosition
 - Author: suni
 - Date:
 - Note: PopupVC에 애니메이션 시작 포지션을 정하는 enum
 */
enum PopupPosition: String {
    case top = "Top"
    case bottom = "Bottom"
    case left = "Left"
    case right = "Rigth"
    case center = "Center"
    case none = ""
}

/**
 # (E) PopupType
 - Author: suni
 - Date:
 - Note: PopupVC에 애니메이션 타입을 모아둔 enum
 */
enum PopupType: String {
    case fadeInOut = "Fade In Out"
    case move = "Move"
    case none = ""
}

public let ANIMATION_DURATION: TimeInterval = 0.5

class BasePopVC: UIViewController {
    
    // popup dim 투명도
    private final let DIM_ALPHA: CGFloat = 0.3
    
    // popup dim view
    @IBOutlet weak var vDim: UIView!
    // popup content view
    @IBOutlet weak var vPopup: UIView!
    
    // popup animation type
    private var type: PopupType = .none
    // popup push start position
    private var position: PopupPosition = .none
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.layoutIfNeeded()
    }
}
extension BasePopVC {
    
    /**
     # showAnim
     - Author: suni
     - Date:
     - Parameters:
         - vc : 팝업을 노출할 뷰컨트롤러
         - type : 팝업의 애니메이션 타입
         - position : 팝업 애니메이션 시작 포지션
         - parentAddView : 해당 뷰컨트롤러의 뷰를 적용할 부모 뷰컨트롤러의 뷰
         - completeion : 해당 화면 노출 애니메이션이 완료된 이후에 부모 뷰컨트롤러에서 처리할 클로저
     - Returns:
     - Note: 팝업 화면을 애니메이션을 넣어서 보이는 함수
     */
    func showAnim(vc: UIViewController? = UIApplication.shared.keyWindow?.visibleViewController, type: PopupType = .fadeInOut, position: PopupPosition = .none, parentAddView: UIView?, _ completion: @escaping ()->()) {
        
        print("🍏🍏🍏🍏🍏 showAnim \n PopupType: \(type) \n PopupPosition: \(position) \n🍏🍏🍏🍏🍏")
        
        guard let currentVC = vc else {
            completion()
            return
        }
        
        var pView = parentAddView
        
        if pView == nil {
            pView = vc?.view
        }
        
        guard let parentView = pView else {
            completion()
            return
        }
        
        self.type = type
        self.position = position
        
        currentVC.addChild(self)
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        parentView.addSubview(self.view)
        self.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        switch type {
        case .fadeInOut:
            self.vDim.alpha = 0.0
            self.vPopup.alpha = 0.0
            self.view.layoutIfNeeded()
            
            UIView.animate(withDuration: ANIMATION_DURATION/2) { [weak self] in
                if let _self = self {
                    _self.vDim.alpha = _self.DIM_ALPHA
                }
            } completion: { (complete) in
                UIView.animate(withDuration: ANIMATION_DURATION/2) { [weak self] in
                    if let _self = self {
                        _self.vPopup.alpha = 1.0
                    }
                } completion: { (complete) in
                    completion()
                }
            }
            
        case .move:
            self.vDim.alpha = 0.0
            let originalTransform = self.vPopup.transform
            
            var moveX: CGFloat = 0.0
            var moveY: CGFloat = 0.0
            
            switch position {
            case .top:
                moveX = 0.0
                moveY = -(self.vPopup.frame.maxY)
            case .bottom:
                moveX = 0.0
                moveY = UIScreen.main.bounds.size.height - self.vPopup.frame.minY
            case .left:
                moveX = -(self.vPopup.frame.maxX)
                moveY = 0.0
            case .right:
                moveX = UIScreen.main.bounds.size.width - self.vPopup.frame.minX
                moveY = 0.0
            case .center:
                moveX = 0.0
                moveY = 0.0
            default:
                break
            }
            
            let hideTransform = originalTransform.translatedBy(x: moveX, y: moveY)
            self.vPopup.transform = hideTransform
            self.vPopup.alpha = 0.0
            
            UIView.animate(withDuration: ANIMATION_DURATION) { [weak self] in
                if let _self = self {
                    _self.vPopup.transform = originalTransform
                    _self.vPopup.alpha = 1.0
                    _self.vDim.alpha = _self.DIM_ALPHA
                }
            } completion: { (complete) in
                completion()
            }
        default:
            completion()
        }
    }
    
    /**
     # hideAnim
     - Author: suni
     - Date: 20.08.19
     - Parameters:
         - type : 팝업의 애니메이션 타입
         - position : 팝업 애니메이션 숨김 포지션
         - completeion : 해당 화면 숨김 애니메이션이 완료된 이후에 부모 뷰컨트롤러에서 처리할 클로저
     - Returns:
     - Note: 팝업 화면을 애니메이션을 넣어서 숨기는 함수
     */
    func hideAnim(type: PopupType = .none, position: PopupPosition = .none, _ completion: @escaping ()->()) {
        DispatchQueue.main.async {
            
            switch self.type {
            case .fadeInOut:
                UIView.animate(withDuration: ANIMATION_DURATION/2, animations: { [weak self] in
                    if let _self = self {
                        _self.vPopup.alpha = 0.0
                    }
                }) { (complete) in
                    UIView.animate(withDuration: ANIMATION_DURATION/2, animations: { [weak self] in
                        self?.vDim.alpha = 0.0
                    }) { [weak self] complete in
                        if let _self = self {
                            _self.view.removeFromSuperview()
                            _self.removeFromParent()
                        }
                    }
                }
                break
            case .move:
                let originalTransform = self.vPopup.transform
                
                var moveX: CGFloat = 0.0
                var moveY: CGFloat = 0.0
                
                switch position {
                case .top:
                    moveX = 0.0
                    moveY = -(self.vPopup.frame.maxY)
                case .bottom:
                    moveX = 0.0
                    moveY = UIScreen.main.bounds.size.height - self.vPopup.frame.minY
                case .left:
                    moveX = -(self.vPopup.frame.maxX)
                    moveY = 0.0
                case .right:
                    moveX = UIScreen.main.bounds.size.width - self.vPopup.frame.minX
                    moveY = 0.0
                case .center:
                    moveX = 0.0
                    moveY = 0.0
                default:
                    break
                }
                
                let hideTransform = originalTransform.translatedBy(x: moveX, y: moveY)
                                
                UIView.animate(withDuration: ANIMATION_DURATION, animations: { [weak self] in
                    if let _self = self {
                        _self.vDim.alpha = 0.0
                        _self.vPopup.alpha = 0.0
                        _self.vPopup.transform = hideTransform
                    }
                }) { [weak self] complete in
                    if let _self = self {
                        _self.view.removeFromSuperview()
                        _self.removeFromParent()
                        completion()
                    }
                }
                break
            default:
                completion()
            }
        }
    }
    
    @IBAction func btnCancelPressed(_ sender: UIButton) {
        self.hideAnim(type: self.type, position: self.position) {
            
        }
    }
    
    @IBAction func btnCompletePressed(_ sender: UIButton) {
        self.hideAnim(type: self.type, position: self.position) {
            
        }
    }

}

