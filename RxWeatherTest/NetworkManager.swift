//
//  NetworkManager.swift
//  RxWeatherTest
//
//  Created by Huangyongle on 2018/1/29.
//  Copyright © 2018年 Huangyongle. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources
import ObjectMapper

class NetworkManager {
	
	static let sharedManager = NetworkManager()
	let apiKey = "23654249"
	let apiSecret = "6992ffef243f21ab98054a42336e6e1a"
	let rootUrl = "https://ali-weather.showapi.com/"
	let appCode = "7e68cc1067274411ba854d4f025478cc"
	let disposeBag = DisposeBag()
	func get15DaysWeather() -> Observable<[WeatherModel]> {
		let url = URL(string: "\(self.rootUrl)day15?area=%E4%B8%BD%E6%B1%9F")!
		let urlRequest = NSMutableURLRequest(url: url)
		urlRequest.addValue("APPCODE \(self.appCode)", forHTTPHeaderField: "Authorization")
		urlRequest.httpMethod = "GET"
		return URLSession.shared
			.rx
			.json(request: urlRequest as URLRequest)
			.map { data in
				if let data = data as? [String: Any] {
					let bodyData: [String: Any] = data["showapi_res_body"] as! [String: Any]
					let weatherArray: [[String: String]] = bodyData["dayList"] as! [[String: String]]
					print(weatherArray.count)
					return weatherArray
						.flatMap { WeatherModel(JSON: $0) }
				}
				return []
			}
			.catchErrorJustReturn([])
	}
}
