//
//  TripStopListView.swift
//  DriversTrips
//
//  Created by Yarid Zarate on 27/01/20.
//  Copyright © 2020 Yarid Zarate. All rights reserved.
//

import SwiftUI

struct TripStopListView: View {
    var trip: Trip
    
    var body: some View {
        List(trip.stops!, id: \.id) { stop in
            VStack(alignment: .leading, spacing: 10.0) {
                Text(stop.name)
                .bold()
                .foregroundColor(Color(red:0.29, green:0.75, blue:0.66))
                
                Text(stop.address)
                .foregroundColor(Color(red:0.49, green:0.50, blue:0.50))
                
                Text("Horario de Salida")
                .bold()
                .foregroundColor(Color(red:0.49, green:0.50, blue:0.50))
                
                Text(stop.departureTime!)
                .foregroundColor(Color(red:0.29, green:0.75, blue:0.66))
            }
        }
        .navigationBarTitle(Text("Paradas del viaje"))
    }
}
