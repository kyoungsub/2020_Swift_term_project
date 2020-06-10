//
//  siDoCode.swift
//  Drive_safety
//
//  Created by Game on 2020/06/10.
//  Copyright © 2020 Game. All rights reserved.
//

import Foundation

struct siDo{
    var name: String?
    var code: Int
    init(name: String?, code: Int){
        self.name = name
        self.code = code
    }
}

let siDoCode = [
    siDo(name: "서울특별시", code: 11),
    siDo(name: "부산광역시", code: 26),
    siDo(name: "대구광역시", code: 27),
    siDo(name: "인천광역시", code: 28),
    siDo(name: "광주광역시", code: 29),
    siDo(name: "대전광역시", code: 30),
    siDo(name: "울산광역시", code: 31),
    siDo(name: "세종틀벽자치시", code: 36),
    siDo(name: "경기도", code: 41),
    siDo(name: "강원도", code: 42),
    siDo(name: "충청북도", code: 43),
    siDo(name: "충청남도", code: 44),
    siDo(name: "전라북도", code: 45),
    siDo(name: "전라남도", code: 46),
    siDo(name: "경상북도", code: 47),
    siDo(name: "경상남도", code: 48),
    siDo(name: "제주특별자치도", code: 50)
]
