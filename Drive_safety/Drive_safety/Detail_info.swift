//
//  Detail_info.swift
//  Drive_safety
//
//  Created by Game on 2020/06/18.
//  Copyright © 2020 Game. All rights reserved.
//

import Foundation
import UIKit

class Detail_info: NSObject, NSCoding {
    var spot_nm = String()
    var occrrnc_cnt = String()
    var caslt_cnt = String()
    var dth_dnv_cnt = String()
    var se_dnv_cnt = String()
    var sl_dnv_cnt = String()
    var wnd_dnv_cnt = String()

    init(spot_nm: String, occrrnc_cnt: String, caslt_cnt: String, dth_dnv_cnt: String, se_dnv_cnt: String, sl_dnv_cnt: String, wnd_dnv_cnt: String) {
        self.spot_nm = spot_nm
        self.occrrnc_cnt = occrrnc_cnt
        self.caslt_cnt = caslt_cnt
        self.dth_dnv_cnt = dth_dnv_cnt
        self.se_dnv_cnt = se_dnv_cnt
        self.sl_dnv_cnt = sl_dnv_cnt
        self.wnd_dnv_cnt = wnd_dnv_cnt
        
        super.init()
    }
    
    required convenience init(coder aDecoder : NSCoder) {
        let spot_nm = aDecoder.decodeObject(forKey: "spot_nm") as! String
        let occrrnc_cnt = aDecoder.decodeObject(forKey: "occrrnc_cnt") as! String
        let caslt_cnt = aDecoder.decodeObject(forKey: "caslt_cnt") as! String
        let dth_dnv_cnt = aDecoder.decodeObject(forKey: "dth_dnv_cnt") as! String
        let se_dnv_cnt = aDecoder.decodeObject(forKey: "se_dnv_cnt") as! String
        let sl_dnv_cnt = aDecoder.decodeObject(forKey: "sl_dnv_cnt") as! String
        let wnd_dnv_cnt = aDecoder.decodeObject(forKey: "wnd_dnv_cnt") as! String
        
        self.init(spot_nm: spot_nm, occrrnc_cnt: occrrnc_cnt, caslt_cnt: caslt_cnt, dth_dnv_cnt: dth_dnv_cnt, se_dnv_cnt: se_dnv_cnt, sl_dnv_cnt: sl_dnv_cnt, wnd_dnv_cnt: wnd_dnv_cnt)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(spot_nm, forKey: "spot_nm")
        aCoder.encode(occrrnc_cnt, forKey: "occrrnc_cnt")
        aCoder.encode(caslt_cnt, forKey: "caslt_cnt")
        aCoder.encode(dth_dnv_cnt, forKey: "dth_dnv_cnt")
        aCoder.encode(se_dnv_cnt, forKey: "se_dnv_cnt")
        aCoder.encode(sl_dnv_cnt, forKey: "sl_dnv_cnt")
        aCoder.encode(wnd_dnv_cnt, forKey: "wnd_dnv_cnt")
    }
}
