//
//  ViewExtension.swift
//  DriversTrips
//
//  Created by Yarid Zarate on 27/01/20.
//  Copyright © 2020 Yarid Zarate. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
    func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
    }
}
