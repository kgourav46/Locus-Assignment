//
//  AssignmentTableViewCell.swift
//  Assignment
//
//  Created by Mac Pro on 24/04/22.
//  Copyright © 2022 Gourav. All rights reserved.
//

import UIKit

final class AssignmentTableViewCell: UITableViewCell {

    @IBOutlet private weak var weatherTempLabel: UILabel!
    @IBOutlet private weak var weatherDescriptionLabel: UILabel!
    @IBOutlet private weak var weatherStatusLabel: UILabel!
    @IBOutlet private weak var weatherImageView: UIImageView!
    @IBOutlet private weak var dateTimeLabel: UILabel!
    
    var model: List? {
        didSet {
            guard let model = model else { return }
            if let first = model.weather?.first {
                weatherStatusLabel.text = first.main
                weatherDescriptionLabel.text = first.weatherDescription?.capitalized
                weatherImageView.downloadImage(ImageURL.image(name: first.icon).getURL())
            }
            weatherTempLabel.text = String(format: "%@: %.0f", StringConstants.temp, model.main?.temp ?? 0)
            dateTimeLabel.text = model.dt?.convertToDateString()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
