//
//  AssignmentViewModel.swift
//  Assignment
//
//  Created by Mac Pro on 24/04/22.
//  Copyright © 2022 Gourav. All rights reserved.
//

import UIKit

protocol AssignmentViewDelegate {
    func load(cityname: String)
}

class AssignmentViewModel: AssignmentViewDelegate {
    
    var isLoading = Dynamic<Bool>(false)
    var dataList = Dynamic<[List]>([])
    var errorMessage = Dynamic<String>("")

    func load(cityname: String) {
        isLoading.value = false
        guard let url = URL(string: API.forcast(cityname: cityname, apiKey: APIKeys.apiKey).getURL()) else { return }
        let request = APIRequest(url: url)
        request.perform { [weak self] (model: AssignmentModel?, error: String?) in
            guard let self = self, let model = model else { return }
            self.isLoading.value = true
            if let list = model.list {
                self.dataList.value = list
            } else {
                self.errorMessage.value = model.messageAsString.capitalized
            }
        }
    }
}
