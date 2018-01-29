//
//  ViewController.swift
//  RxWeatherTest
//
//  Created by Huangyongle on 2018/1/29.
//  Copyright © 2018年 Huangyongle. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import Then
import Kingfisher
import Reusable

class ViewController: UIViewController {

	let tableView = UITableView().then {
		$0.rowHeight = WeatherTableViewCell.cellHeight()
		$0.register(cellType: WeatherTableViewCell.self)
	}
	let viewModel = WeatherViewModel()
	let disposeBag = DisposeBag()
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(tableView)
		tableView.frame = view.frame
		let dataSources = RxTableViewSectionedReloadDataSource<WeatherSection>(configureCell: {
			_, tv, ix, item -> UITableViewCell in
			let cell = tv.dequeueReusableCell(for: ix) as WeatherTableViewCell
			cell.weatherImageView.kf.setImage(with: URL(string: item.pic!)!)
			cell.tempLabel.text = "\(item.temperature!)°"
			cell.weatherLabel.text = item.weather
			return cell
		})
		viewModel.weatherSections
			.drive(tableView.rx.items(dataSource: dataSources))
			.disposed(by: disposeBag)
	}

}

