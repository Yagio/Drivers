//
//  TableView.swift
//  DriversTrips
//
//  Created by Yarid Zarate on 20/01/20.
//  Copyright © 2020 Yarid Zarate. All rights reserved.
//

import SwiftUI

struct TripListView: View {
    
    @EnvironmentObject var userSettings: UserSettings
    @ObservedObject var viewModel = TripViewModel()
        
    private var stateContent: AnyView {
        switch viewModel.state {
        case .loading:
            return AnyView(
                VStack {
                    ActivityIndicator(isAnimating: true, style: .large)
                    Text("Cargando...")
                }
            )
        case .failure(let error):
            return AnyView(
                Text(error)
            )
        case .success(let tripList):
            let arrayvalues = tripList as! [[Trip]]
                                    
            return AnyView(
                List {
                    ForEach(0..<arrayvalues.count) { i in
                        TripHeader(trips: arrayvalues[i])
                    }
                }
            )
        }
    }
    
    var body: some View {
        NavigationView {
            stateContent
            .navigationBarTitle(Text("Corridas Asignadas"))
            .navigationBarItems(trailing:
                Button("Salir") {
                    SessionManager.deleteUser()
                    self.userSettings.loggedIn = false
                }
            )
        }
    }
}

struct TripHeader: View {
    var trips: [Trip]
    
    var body: some View {
        Section(header: Text(self.formatDate(dateString: self.trips[0].date))) {
            ForEach(0..<trips.count) { x in
                VStack(alignment: .leading, spacing: 20.0) {
                    NavigationLink(destination: TripStopListView(trip: self.trips[x])) {
                        EmptyView()
                    }.buttonStyle(PlainButtonStyle())
                    TripItem(trip: self.trips[x])
                    Button(action: {}) {
                        HStack {
                            Spacer()
                            Text("Ver paradas y usuarios").fontWeight(.semibold)
                            Spacer()
                        }
                        .padding()
                        .background(Color(red:0.29, green:0.75, blue:0.66))
                        .cornerRadius(2.0)
                        .foregroundColor(.white)
                    }.padding(.bottom, 20)
                }
            }
        }
    }
    
    func formatDate(dateString: String) -> String {
        let date = dateString.toDate(withFormat: "yyyy-MM-dd")
        
        return date!.toStringFormat(withFormat: "d MMMM")
    }
    

}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TripListView()
    }
}

