//
//  WeatherSection.swift
//  RxWeatherTest
//
//  Created by Huangyongle on 2018/1/29.
//  Copyright © 2018年 Huangyongle. All rights reserved.
//

import Foundation
import ObjectMapper
import RxDataSources

struct WeatherModel: Mappable {
	init?(map: Map) {
		
	}
	
	
	var temperature: String?
	var weather: String?
	var pic: String?
	
	mutating func mapping(map: Map) {
		temperature <- map["day_air_temperature"]
		weather	    <- map["day_weather"]
		pic 		<- map["day_weather_pic"]
	}
}


struct WeatherSection {
	var items: [Item]
}

extension WeatherSection: SectionModelType {
	
	typealias Item = WeatherModel
	init(original: WeatherSection, items: [WeatherSection.Item]) {
		self = original
		self.items = items
	}
}
