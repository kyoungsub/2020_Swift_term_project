//
//  MakedPlaceTotalResult_ViewController.swift
//  Drive_safety
//
//  Created by kpugame on 2020/06/24.
//  Copyright © 2020 Game. All rights reserved.
//

import UIKit
import SwiftUI

struct DeadPeopleChart: View {
    var bookMarks:[Detail_info] = []
    
    func toIntFromBookMarkData(Data: String) -> Double {
        guard let tempNum = NumberFormatter().number(from: Data) else { return 0 }
     return Double(truncating: tempNum)
    }
    
    var body: some View {
    VStack {
        Text("사망자수")
    HStack {
        ForEach(0..<bookMarks.count) { index in
        VStack {
            Spacer()
            Text((self.bookMarks[index]).dth_dnv_cnt)
                .offset(y: 0)
                .zIndex(1)
            Rectangle()
                .fill(Color.red)
                .frame(width: 20, height: CGFloat(self.toIntFromBookMarkData(Data: (self.bookMarks[index]).dth_dnv_cnt)) * 100.0)
            Text((self.bookMarks[index]).spot_nm)
                }
            }
        }
    }
}
}

struct InjuryPeopleChart: View {
    var bookMarks:[Detail_info] = []
    
    func toIntFromBookMarkData(Data: String) -> Double {
        guard let tempNum = NumberFormatter().number(from: Data) else { return 0 }
     return Double(truncating: tempNum)
    }
    
    var body: some View {
    VStack {
        Text("사상자수")
    HStack {
        ForEach(0..<bookMarks.count) { index in
        VStack {
            Spacer()
            Text((self.bookMarks[index]).caslt_cnt)
                .offset(y: 0)
                .zIndex(1)
            Rectangle()
                .fill(Color.blue)
                .frame(width: 20, height: CGFloat(self.toIntFromBookMarkData(Data: (self.bookMarks[index]).caslt_cnt)) * 100.0)
            Text((self.bookMarks[index]).spot_nm)
                }
            }
        }
    }
}
}

struct AccidentOccurChart: View {
    var bookMarks:[Detail_info] = []
    
    func toIntFromBookMarkData(Data: String) -> Double {
           guard let tempNum = NumberFormatter().number(from: Data) else { return 0 }
        return Double(truncating: tempNum)
       }
    
    var body: some View {
    VStack {
        Text("발생건수")
    HStack {
        ForEach(0..<bookMarks.count) { index in
        VStack {
            Spacer()
            Text((self.bookMarks[index]).occrrnc_cnt)
                .offset(y: 0)
                .zIndex(1)
            Rectangle()
                .fill(Color.green)
                .frame(width: 20, height: CGFloat(self.toIntFromBookMarkData(Data: (self.bookMarks[index]).occrrnc_cnt)) * 100.0)
            Text((self.bookMarks[index]).spot_nm)
                }
            }
        }
    }
}
}

struct TotalInfo: View {
    var bookMarks:[Detail_info] = []
    
    
    var body: some View {
        TabView {
            AccidentOccurChart(bookMarks: self.bookMarks)
                .tabItem({
                    Image(systemName: "thermometer")
                    Text("발생건수")
                })
            
            InjuryPeopleChart(bookMarks: self.bookMarks)
                .tabItem({
                    Image(systemName: "thermometer")
                    Text("사상자수")
                })
            DeadPeopleChart(bookMarks: self.bookMarks)
                .tabItem({
                    Image(systemName: "thermometer")
                    Text("사망자수")
                })
        }.frame(width: 410, height: 700)
    }
}

struct TotalInfo_Previews: PreviewProvider {
    static var previews: some View {
        TotalInfo(bookMarks: MarkedPlaceTotalResult_ViewController().bookMarks)
    }
}

class MarkedPlaceTotalResult_ViewController: UIViewController {
    var bookMarks:[Detail_info] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swiftUIController = UIHostingController(rootView: TotalInfo(bookMarks: self.bookMarks))
        
        addChild(swiftUIController)
        swiftUIController.view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(swiftUIController.view)
        
        swiftUIController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        swiftUIController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        swiftUIController.didMove(toParent: self)
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
