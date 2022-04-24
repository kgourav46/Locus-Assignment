//
//  BaseViewController.swift
//  Assignment
//
//  Created by Mac Pro on 24/04/22.
//  Copyright © 2022 Gourav. All rights reserved.
//

import UIKit

//--- To enable BaseviewController to be instantiable From storyboard id -----
protocol InstantiableFromStoryboard {
    static var storyBoardId: String{get}
    static var storyBoardName: String{get}
    static func instantiateFromStoryBoard()->Self//-----optional func
}

extension InstantiableFromStoryboard {
    static func instantiateFromStoryBoard() -> Self {
        let storyBoard = UIStoryboard.init(name: storyBoardName, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: storyBoardId)
        return vc as! Self
    }
}

typealias BaseViewController = BaseViewControllerClass & InstantiableFromStoryboard

class BaseViewControllerClass: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func push(_ conroller: BaseViewController, animated: Bool = true) {
        navigationController?.pushViewController(conroller, animated: animated)
    }
    
    func addLeftNavigationBarButton(imageName: String) {
        let button = UIBarButtonItem(image: UIImage(named: imageName), style:.plain, target: self, action: #selector(backButtonAction(_ :)))
        button.tintColor = UIColor.ui.textColor
        navigationItem.leftBarButtonItem = button
    }
    
    @objc func backButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
