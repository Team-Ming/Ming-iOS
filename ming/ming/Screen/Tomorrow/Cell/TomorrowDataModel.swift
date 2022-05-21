//
//  TomorrowDataModel.swift
//  ming
//
//  Created by Sojin Lee on 2022/05/22.
//

import Foundation

struct TomorrowDataModel{
    var miracleText: String
}

extension TomorrowDataModel{
    static let sampleData : [TomorrowDataModel] = [
        TomorrowDataModel(miracleText: "내 이름은 이소진"),
        TomorrowDataModel(miracleText: "우리 조원 김윤서"),
        TomorrowDataModel(miracleText: "우리 조원 김민재")
    ]
}
