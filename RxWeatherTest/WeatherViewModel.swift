//
//  WeatherViewModel.swift
//  RxWeatherTest
//
//  Created by Huangyongle on 2018/1/29.
//  Copyright © 2018年 Huangyongle. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class WeatherViewModel {
	var weatherSections: Driver<[WeatherSection]>!
	init() {
		let models = NetworkManager.sharedManager.get15DaysWeather()
		weatherSections = models.map { model -> [WeatherSection] in
			return [WeatherSection(items: model)]
		}.asDriver(onErrorJustReturn: [])
	}
	
}


