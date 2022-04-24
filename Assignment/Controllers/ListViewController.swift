//
//  AssignmentViewController.swift
//  Assignment
//
//  Created by Mac Pro on 24/04/22.
//  Copyright © 2022 Gourav. All rights reserved.
//

import UIKit
import CoreData

final class ListViewController: BaseViewController  {
    
    static var storyBoardId: String = ViewIdentifiers.listViewController
    static var storyBoardName: String = StoryBoard.main
    @IBOutlet private weak var loadingWarningLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    private var viewModel =  AssignmentViewModel()
    private var list = [List]()
    var cityname: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUPUI()
    }
    
    private func setUPUI() {
        bindData()
        title = cityname
        viewModel.load(cityname: cityname)
        addLeftNavigationBarButton(imageName: ImageConstants.icBack)
        tableView.registerCell(AssignmentTableViewCell.self)
        tableView.tableFooterView = UIView()
    }
    
    private func bindData() {
        viewModel.errorMessage.bind(listener: { [weak self] (errorMessage) in
            guard let self = self else { return }
            self.loadingWarningLabel.isHidden = false
            self.loadingWarningLabel.text = errorMessage
        })
        viewModel.isLoading.bind { [weak self] (isLoading) in
            guard let self = self else { return }
            if !isLoading {
                self.loadingWarningLabel.text = StringConstants.loading
            }
        }
        viewModel.dataList.bind { [weak self] (list) in
            guard let self = self else { return }
            self.list = list
            self.loadingWarningLabel.isHidden =  list.count > 0
            self.tableView.reloadData()
        }
    }
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(with: AssignmentTableViewCell.self, indexPath: indexPath)
        cell.model = list[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailViewController.instantiateFromStoryBoard()
        controller.selectedItem = list[indexPath.row]
        controller.cityname = cityname
        push(controller)
    }
}


