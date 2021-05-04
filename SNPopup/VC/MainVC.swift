//
//  ViewController.swift
//  SNPopup
//
//  Created by KBIZ on 2021/04/12.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let arrPopupType: [PopupType] = [.fadeInOut,
                                     .move]
    let arrPopupPosition: [PopupPosition] = [.top,
                                             .bottom,
                                             .left,
                                             .right,
                                             .center]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "popupCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return arrPopupPosition.count
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrPopupType.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrPopupType[section].rawValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "popupCell", for: indexPath)
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = "\(arrPopupType[0].rawValue) Popup"
        case 1:
            cell.textLabel?.text = "\(arrPopupPosition[indexPath.row].rawValue) Push Popup"
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let popVC = storyBoard.instantiateViewController(withIdentifier: "SNPopVC") as! SNPopVC
        
        popVC.showAnim(vc: self, type: self.arrPopupType[indexPath.section], position: self.arrPopupPosition[indexPath.row], parentAddView: self.view) {
        }
        
    }
}
