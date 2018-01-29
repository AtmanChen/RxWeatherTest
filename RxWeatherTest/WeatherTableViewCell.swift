//
//  WeatherTableViewCell.swift
//  RxWeatherTest
//
//  Created by Huangyongle on 2018/1/29.
//  Copyright © 2018年 Huangyongle. All rights reserved.
//

import UIKit
import Reusable

class WeatherTableViewCell: UITableViewCell, NibReusable {
	@IBOutlet weak var weatherLabel: UILabel!
	
	@IBOutlet weak var tempLabel: UILabel!
	@IBOutlet weak var weatherImageView: UIImageView!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	static func cellHeight() -> CGFloat {
		return 100
	}
}
