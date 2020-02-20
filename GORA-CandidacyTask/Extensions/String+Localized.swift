//
//  String+Localized.swift
//  GORA-CandidacyTask
//
//  Created by Eugene Ilyin on 21.02.2020.
//  Copyright © 2020 Eugene Ilyin. All rights reserved.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

}
