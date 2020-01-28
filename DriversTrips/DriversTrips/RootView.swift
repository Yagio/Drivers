//
//  RootView.swift
//  DriversTrips
//
//  Created by Yarid Zarate on 26/01/20.
//  Copyright © 2020 Yarid Zarate. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var userSettings: UserSettings

    var body: some View {
      if (userSettings.loggedIn) {
        return AnyView(TripListView())
      } else {
        return AnyView(LoginView())
      }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(UserSettings())
    }
}
