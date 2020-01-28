//
//  TripItemView.swift
//  DriversTrips
//
//  Created by Yarid Zarate on 25/01/20.
//  Copyright © 2020 Yarid Zarate. All rights reserved.
//

import SwiftUI

struct TripItem: View {
    var trip: Trip
        
    var body: some View {
        VStack(alignment: .leading, spacing: 15.0) {

            Text(trip.name)
            .bold()
            .foregroundColor(Color(red:0.29, green:0.75, blue:0.66))
            
            VStack(alignment: .leading, spacing: 5.0) {
                Text("Horario de Salida")
                .bold()
                .foregroundColor(Color(red:0.49, green:0.50, blue:0.50))
                
                Text(trip.time)
                .foregroundColor(Color(red:0.29, green:0.75, blue:0.66))
            }
            
            VStack(alignment: .leading, spacing: 10.0) {
                Text(trip.stops!.first!.address)
                .foregroundColor(Color(red:0.49, green:0.50, blue:0.50))
                
                Text(trip.stops!.last!.address)
                .foregroundColor(Color(red:0.49, green:0.50, blue:0.50))
            }
            
            VStack(alignment: .leading, spacing: 5.0) {
                Text("Vehículo")
                .bold()
                .foregroundColor(Color(red:0.49, green:0.50, blue:0.50))
                
                Text("\(trip.vehicle.brand) \(trip.vehicle.model) \(trip.vehicle.year)")
                .foregroundColor(Color(red:0.29, green:0.75, blue:0.66))
                
                Text(trip.vehicle.plate)
                .foregroundColor(Color(red:0.49, green:0.50, blue:0.50))
            }
        }
    }
}
