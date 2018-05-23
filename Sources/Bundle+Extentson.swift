//
//  Bundle+Extentson.swift
//  ESPullToRefreshExample
//
//  Created by Hiram on 2018/5/23.
//  Copyright © 2018年 egg swift. All rights reserved.
//

import Foundation

extension Bundle {
    static var rbundle:Bundle?
    class func refreshBundle() -> Bundle {
        if rbundle == nil {
            if let path = Bundle(for: NSClassFromString("ESRefreshComponent")!).path(forResource: "ESPullToRefresh", ofType: "bundle") {
                rbundle = Bundle(path: path)
            }
        }
        return rbundle!
    }

    class func localizedStringForKey(key:String) -> String {
       return self.localizedStringForKey(key: key, value: nil)
    }

    class func localizedStringForKey(key:String,value:String?) -> String {
        var bundle:Bundle?
        if bundle == nil {
            var language:String? = Locale.preferredLanguages.first
            if (language?.hasPrefix("en"))! {
                language = "en"
            } else if (language?.hasPrefix("zh"))! {
                if let range = language?.range(of: "Hans") {
                    language = "zh-Hans"
                    debugPrint(range)
                } else {
                    language = "zh-Hant"
                }
            } else {
                language = "en"
            }
            bundle = Bundle(path: self.refreshBundle().path(forResource: language!, ofType: "lproj")!)
        }
        let n_value = bundle?.localizedString(forKey: key, value: value, table: nil)
        return Bundle.main.localizedString(forKey: key, value: n_value, table: nil)
    }

}
