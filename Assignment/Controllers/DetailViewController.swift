//
//  AddUpdateViewController.swift
//  Assignment
//
//  Created by Mac Pro on 24/04/22.
//  Copyright © 2022 Gourav. All rights reserved.
//

import UIKit

final class DetailViewController: BaseViewController {

    static var storyBoardId: String = ViewIdentifiers.detailViewController
    static var storyBoardName: String = StoryBoard.main
    
    @IBOutlet private weak var weatherStatusLabel: UILabel!
    @IBOutlet private weak var feelsLikeLabel: UILabel!
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var weatherDescriptionLabel: UILabel!
    var selectedItem: List?
    var cityname: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUPUI()
    }

    private func setUPUI() {
        title = cityname
        addLeftNavigationBarButton(imageName: ImageConstants.icBack)
        guard let selectedItem = selectedItem else { return }
        if let first = selectedItem.weather?.first {
            weatherStatusLabel.text = first.main
            weatherDescriptionLabel.text = first.weatherDescription?.capitalized
        }
        tempLabel.text = String(format: "%.0f", selectedItem.main?.temp ?? 0)
        feelsLikeLabel.text = String(format: "%@: %.0f", StringConstants.feelsLike, selectedItem.main?.feelsLike ?? 0)
    }
}
