//
//  LookUpViewController.swift
//  Assignment
//
//  Created by Mac Pro on 24/04/22.
//  Copyright © 2022 Gourav. All rights reserved.
//

import UIKit

final class LookUpViewController: BaseViewController {
    
    static var storyBoardId: String = ViewIdentifiers.lookUpViewController
    static var storyBoardName: String = StoryBoard.main
    
    @IBOutlet private weak var cityNameTextField: UITextField!
    @IBOutlet private weak var lookUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func lookButtonAction(_ sender: Any) {
        guard let text = cityNameTextField.text, !text.isEmpty else { return }
        let controller = ListViewController.instantiateFromStoryBoard()
        controller.cityname = text
        push(controller)
    }
}
