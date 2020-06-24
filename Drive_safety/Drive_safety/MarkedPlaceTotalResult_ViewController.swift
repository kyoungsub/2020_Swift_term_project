//
//  MakedPlaceTotalResult_ViewController.swift
//  Drive_safety
//
//  Created by kpugame on 2020/06/24.
//  Copyright © 2020 Game. All rights reserved.
//

import UIKit
import SwiftUI

struct AccidentOccurChart: View {
    var bookMarks:[Detail_info] = []
    
    var body: some View {
    VStack {
        Text("발생건수")
    HStack {
        ForEach(0..<bookMarks.count) { index in
        VStack {
            Spacer()
            Text((self.bookMarks[index]).value(forKey: "occrrnc_cnt") as! NSString as String)
                .font(.footnote)
                .rotationEffect(.degrees(-90))
                .offset(y: 0)
                .zIndex(1)
            Rectangle()
                .fill(Color.green)
                .frame(width: 20, height: 20)
            Text((self.bookMarks[index]).value(forKey: "spot_nm") as! NSString as String)
                .font(.footnote)
                .frame(height: 20)
                }
            }
        }
    }
}
}

struct AccidentOccurChart_Previews: PreviewProvider {
    static var previews: some View {
        AccidentOccurChart(bookMarks: MarkedPlaceTotalResult_ViewController().bookMarks)
        }
}

struct TotalInfo: View {
    var bookMarks:[Detail_info] = []
    var station: WeatherStation
    
    
    var body: some View {
        TabView {
            AccidentOccurChart(bookMarks: self.bookMarks)
                .tabItem({
                    Image(systemName: "thermometer")
                    Text("발생건수")
                })
            SnowfallTab(station: self.station)
                .tabItem({
                    Image(systemName: "thermometer")
                    Text("사상자수")
                })
            PrecipitationTab(station: self.station)
                .tabItem({
                    Image(systemName: "thermometer")
                    Text("사망자수")
                })
        }.frame(width: 410, height: 700)
    }
}

struct TotalInfo_Previews: PreviewProvider {
    static var previews: some View {
        TotalInfo(bookMarks: MarkedPlaceTotalResult_ViewController().bookMarks, station: WeatherInformation()!.stations[0])
    }
}

class MarkedPlaceTotalResult_ViewController: UIViewController {
    var bookMarks:[Detail_info] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let stations = WeatherInformation()
        
        let swiftUIController = UIHostingController(rootView: TotalInfo(bookMarks: MarkedPlaceTotalResult_ViewController().bookMarks, station: (stations?.stations[0])!))
        
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
