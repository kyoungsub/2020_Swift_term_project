//
//  guGunCode.swift
//  Drive_safety
//
//  Created by Game on 2020/06/10.
//  Copyright © 2020 Game. All rights reserved.
//

import Foundation

struct guGun{
    var name: String?
    var code: Int
    init(name: String?, code: Int){
        self.name = name
        self.code = code
    }
}

//서울시
let guGun_11 = [
    guGun(name: "강남구", code: 680),
    guGun(name: "강동구", code: 740),
    guGun(name: "강북구", code: 305),
    guGun(name: "강서구", code: 500),
    guGun(name: "관악구", code: 620),
    guGun(name: "광진구", code: 215),
    guGun(name: "구로구", code: 530),
    guGun(name: "금천구", code: 545),
    guGun(name: "노원구", code: 350),
    guGun(name: "도봉구", code: 320),
    guGun(name: "동대문구", code: 230),
    guGun(name: "동작구", code: 590),
    guGun(name: "마포구", code: 440),
    guGun(name: "서대문구", code: 410),
    guGun(name: "서초구", code: 650),
    guGun(name: "성동구", code: 200),
    guGun(name: "성북구", code: 290),
    guGun(name: "송파구", code: 710),
    guGun(name: "양천구", code: 470),
    guGun(name: "영등포구", code: 560),
    guGun(name: "용산구", code: 170),
    guGun(name: "은평구", code: 380),
    guGun(name: "종로구", code: 110),
    guGun(name: "중구", code: 140),
    guGun(name: "중랑구", code: 260)
]

//부산시
let guGun_26 = [
    guGun(name: "강서구", code: 440),
    guGun(name: "금정구", code: 410),
    guGun(name: "기장군", code: 710),
    guGun(name: "남구", code: 290),
    guGun(name: "동구", code: 170),
    guGun(name: "동래구", code: 260),
    guGun(name: "부산진구", code: 230),
    guGun(name: "북구", code: 320),
    guGun(name: "사상구", code: 530),
    guGun(name: "사하구", code: 380),
    guGun(name: "서구", code: 140),
    guGun(name: "수영구", code: 500),
    guGun(name: "연제구", code: 470),
    guGun(name: "영도구", code: 200),
    guGun(name: "중구", code: 110),
    guGun(name: "해운대구", code: 350)
]

//대구광역시
let guGun_27 = [
    guGun(name: "남구", code: 200),
    guGun(name: "달서구", code: 290),
    guGun(name: "달성군", code: 710),
    guGun(name: "동구", code: 140),
    guGun(name: "북구", code: 230),
    guGun(name: "서구", code: 170),
    guGun(name: "수성구", code: 260),
    guGun(name: "중구", code: 110)
]

//인천광역시
let guGun_28 = [
    guGun(name: "강화군", code: 710),
    guGun(name: "계양구", code: 245),
    guGun(name: "남구", code: 170),
    guGun(name: "남동구", code: 200),
    guGun(name: "동구", code: 140),
    guGun(name: "부평구", code: 237),
    guGun(name: "서구", code: 260),
    guGun(name: "연수구", code: 185),
    guGun(name: "옹진군", code: 720),
    guGun(name: "중구", code: 110)
]

//광주 광역시
let guGun_29 = [
    guGun(name: "광산구", code: 200),
    guGun(name: "남구", code: 155),
    guGun(name: "동구", code: 110),
    guGun(name: "북구", code: 170),
    guGun(name: "서구", code: 140)
]
//대전 광역시
let guGun_30 = [
    guGun(name: "대덕구", code: 230),
    guGun(name: "동구", code: 110),
    guGun(name: "서구", code: 170),
    guGun(name: "유성구", code: 200),
    guGun(name: "중구", code: 140)
]

//울산 광역시
let guGun_31 = [
    guGun(name: "남구", code: 140),
    guGun(name: "동구", code: 170),
    guGun(name: "북구", code: 200),
    guGun(name: "울주군", code: 710),
    guGun(name: "중구", code: 110)
]
//세종 틀별 자치시
let guGun_36 = [
    guGun(name: "세종특별자치시", code: 110)
]
//경기도
let guGun_41 = [
    guGun(name: "가평군", code: 820),
    guGun(name: "고양시덕양구", code: 281),
    guGun(name: "고양시일산구", code: 283),
    guGun(name: "고양시일산동구", code: 285),
    guGun(name: "고양시일산서구", code: 287),
    guGun(name: "과천시", code: 290),
    guGun(name: "광명시", code: 210),
    guGun(name: "광주시", code: 610),
    guGun(name: "구리시", code: 310),
    guGun(name: "군포시", code: 410),
    guGun(name: "김포시", code: 570),
    guGun(name: "남양주시", code: 360),
    guGun(name: "동두천시", code: 250),
    guGun(name: "부천시소사구", code: 197),
    guGun(name: "부천시오정구", code: 199),
    guGun(name: "부천시원미구", code: 195),
    guGun(name: "성남시분당구", code: 135),
    guGun(name: "성남시수성구", code: 131),
    guGun(name: "성남시중원구", code: 133),
    guGun(name: "수원시권서구", code: 113),
    guGun(name: "수원시영통구", code: 117),
    guGun(name: "수원시장안구", code: 111),
    guGun(name: "수원시팔달구", code: 115),
    guGun(name: "시흥시", code: 390),
    guGun(name: "안산시", code: 270),
    guGun(name: "안산시단원구", code: 273),
    guGun(name: "안산시상록구", code: 271),
    guGun(name: "안성시", code: 550),
    guGun(name: "안양시동안구", code: 173),
    guGun(name: "안양시만안구", code: 171),
    guGun(name: "양주시", code: 630),
    guGun(name: "안평군", code: 830),
    guGun(name: "여주군", code: 730),
    guGun(name: "여주시", code: 670),
    guGun(name: "연천군", code: 800),
    guGun(name: "오산시", code: 370),
    guGun(name: "용인시", code: 460),
    guGun(name: "용인시기흥구", code: 463),
    guGun(name: "용인시수지구", code: 465),
    guGun(name: "용인시처인구", code: 461),
    guGun(name: "의왕시", code: 430),
    guGun(name: "의정부시", code: 150),
    guGun(name: "이천시", code: 500),
    guGun(name: "파주시", code: 480),
    guGun(name: "평택시", code: 220),
    guGun(name: "포천군", code: 810),
    guGun(name: "포천시", code: 650),
    guGun(name: "하남시", code: 450),
    guGun(name: "화성시", code: 590)
]

//강원도
let guGun_42 = [
    guGun(name: "강릉시", code: 150),
    guGun(name: "고성군", code: 820),
    guGun(name: "동해시", code: 170),
    guGun(name: "삼척시", code: 230),
    guGun(name: "속초시", code: 210),
    guGun(name: "양구군", code: 800),
    guGun(name: "양양군", code: 830),
    guGun(name: "영월군", code: 750),
    guGun(name: "원주시", code: 130),
    guGun(name: "인제군", code: 810),
    guGun(name: "정선군", code: 770),
    guGun(name: "철원군", code: 780),
    guGun(name: "춘천시", code: 110),
    guGun(name: "태백시", code: 190),
    guGun(name: "평창군", code: 760),
    guGun(name: "홍천군", code: 720),
    guGun(name: "화천군", code: 790),
    guGun(name: "횡성군", code: 730)
]
//충천북도
let guGun_43 = [
    guGun(name: "괴산군", code: 760),
    guGun(name: "단양군", code: 800),
    guGun(name: "보은군", code: 720),
    guGun(name: "영동군", code: 740),
    guGun(name: "옥천군", code: 730),
    guGun(name: "음성군", code: 770),
    guGun(name: "제천시", code: 150),
    guGun(name: "증편군", code: 745),
    guGun(name: "지천군", code: 750),
    guGun(name: "청원군", code: 710),
    guGun(name: "청주시상당구", code: 111),
    guGun(name: "청주시서원구", code: 112),
    guGun(name: "청주시청원구", code: 114),
    guGun(name: "청주시흥덕구", code: 113),
    guGun(name: "충주시", code: 130)
]
//충천남도
let guGun_44 = [
    guGun(name: "계룡시", code: 250),
    guGun(name: "공주시", code: 150),
    guGun(name: "금산군", code: 710),
    guGun(name: "논산시", code: 230),
    guGun(name: "당진군", code: 830),
    guGun(name: "당진시", code: 270),
    guGun(name: "보령시", code: 180),
    guGun(name: "부여군", code: 760),
    guGun(name: "서산시", code: 210),
    guGun(name: "서천군", code: 770),
    guGun(name: "아산시", code: 200),
    guGun(name: "연기군", code: 730),
    guGun(name: "예산군", code: 810),
    guGun(name: "천안시", code: 130),
    guGun(name: "천안시동남구", code: 131),
    guGun(name: "천안시서북구", code: 133),
    guGun(name: "청양군", code: 790),
    guGun(name: "태안군", code: 825),
    guGun(name: "홍성군", code: 800)
]
//전라북도
let guGun_45 = [
    guGun(name: "고창군", code: 790),
    guGun(name: "군산시", code: 130),
    guGun(name: "김제시", code: 210),
    guGun(name: "남원시", code: 190),
    guGun(name: "무주군", code: 730),
    guGun(name: "부안군", code: 800),
    guGun(name: "순창군", code: 770),
    guGun(name: "완주군", code: 710),
    guGun(name: "익산시", code: 140),
    guGun(name: "임실군", code: 750),
    guGun(name: "장수군", code: 740),
    guGun(name: "전주시덕진구", code: 113),
    guGun(name: "전주시완산구", code: 111),
    guGun(name: "정읍시", code: 180),
    guGun(name: "진안군", code: 720)
]
//전라남도
let guGun_46 = [
    guGun(name: "강진군", code: 810),
    guGun(name: "고흥군", code: 770),
    guGun(name: "곡성군", code: 720),
    guGun(name: "광양시", code: 230),
    guGun(name: "구례군", code: 730),
    guGun(name: "나주시", code: 170),
    guGun(name: "담양군", code: 710),
    guGun(name: "목포시", code: 110),
    guGun(name: "무안군", code: 840),
    guGun(name: "보성군", code: 780),
    guGun(name: "순천시", code: 150),
    guGun(name: "신안군", code: 910),
    guGun(name: "여주시", code: 130),
    guGun(name: "영광군", code: 870),
    guGun(name: "영암군", code: 870),
    guGun(name: "완도군", code: 890),
    guGun(name: "장성군", code: 880),
    guGun(name: "장흥군", code: 800),
    guGun(name: "진도군", code: 900),
    guGun(name: "함평군", code: 860),
    guGun(name: "해남군", code: 820),
    guGun(name: "화순군", code: 790)
]
//경상북도
let guGun_47 = [
    guGun(name: "경산시", code: 290),
    guGun(name: "경주시", code: 130),
    guGun(name: "고령군", code: 830),
    guGun(name: "구미시", code: 190),
    guGun(name: "군위군", code: 720),
    guGun(name: "김천시", code: 150),
    guGun(name: "문경시", code: 280),
    guGun(name: "봉화군", code: 920),
    guGun(name: "상주시", code: 250),
    guGun(name: "성주군", code: 840),
    guGun(name: "안동시", code: 170),
    guGun(name: "영덕군", code: 770),
    guGun(name: "영양군", code: 760),
    guGun(name: "영주시", code: 210),
    guGun(name: "영천시", code: 230),
    guGun(name: "예천군", code: 900),
    guGun(name: "울릉군", code: 940),
    guGun(name: "울진군", code: 930),
    guGun(name: "의성군", code: 730),
    guGun(name: "청도군", code: 820),
    guGun(name: "청송군", code: 750),
    guGun(name: "칠곡군", code: 850),
    guGun(name: "포항시남구", code: 111),
    guGun(name: "포항시북구", code: 113)
]
//경상남도
let guGun_48 = [
    guGun(name: "거제시", code: 310),
    guGun(name: "거창군", code: 880),
    guGun(name: "고성군", code: 820),
    guGun(name: "김해시", code: 250),
    guGun(name: "남해군", code: 840),
    guGun(name: "마산시", code: 160),
    guGun(name: "밀양시", code: 270),
    guGun(name: "사천시", code: 240),
    guGun(name: "산청군", code: 860),
    guGun(name: "양산시", code: 332),
    guGun(name: "양산시", code: 330),
    guGun(name: "의령군", code: 720),
    guGun(name: "진주시", code: 170),
    guGun(name: "진해시", code: 190),
    guGun(name: "창녕군", code: 740),
    guGun(name: "창원시", code: 110),
    guGun(name: "창원시마산합포구", code: 125),
    guGun(name: "창원시마산회원구", code: 127),
    guGun(name: "창원시성산구", code: 123),
    guGun(name: "창원시의장구", code: 121),
    guGun(name: "창원시진해구", code: 129),
    guGun(name: "통영시", code: 220),
    guGun(name: "하동군", code: 850),
    guGun(name: "함안군", code: 730),
    guGun(name: "함양군", code: 870),
    guGun(name: "합천군", code: 890)
]
//제주특별자치도
let guGun_50 = [
    guGun(name: "서귀포시", code: 130),
    guGun(name: "제주시", code: 110)
]
