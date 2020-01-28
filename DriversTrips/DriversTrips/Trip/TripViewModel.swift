//
//  TripFetcher.swift
//  DriversTrips
//
//  Created by Yarid Zarate on 24/01/20.
//  Copyright © 2020 Yarid Zarate. All rights reserved.
//

import Foundation

extension Sequence {
    func groupSort(ascending: Bool = true, byDate dateKey: (Iterator.Element) -> Date) -> [[Iterator.Element]] {
        var categories: [[Iterator.Element]] = []
        for element in self {
            let key = dateKey(element)
            guard let dayIndex = categories.firstIndex(where: { $0.contains(where: { Calendar.current.isDate(dateKey($0), inSameDayAs: key) }) }) else {
                guard let nextIndex = categories.firstIndex(where: { $0.contains(where: { dateKey($0).compare(key) == (ascending ? .orderedDescending : .orderedAscending) }) }) else {
                    categories.append([element])
                    continue
                }
                categories.insert([element], at: nextIndex)
                continue
            }
            guard let nextIndex = categories[dayIndex].firstIndex(where: { dateKey($0).compare(key) == (ascending ? .orderedDescending : .orderedAscending) }) else {
                categories[dayIndex].append(element)
                continue
            }
            categories[dayIndex].insert(element, at: nextIndex)
        }
        return categories
    }
}

public enum LoadableState {
    case success(Any)
    case failure(String)
    case loading
}

class TripViewModel: ObservableObject {
    
    @Published var state: LoadableState = .loading
    
    init() {
        
        JettyApi.getTrips({ (result) in
            DispatchQueue.main.async {
                let resultSorted = result.groupSort(byDate: { ("\($0.date) \($0.time)".toDate(withFormat: "yyyy-MM-dd HH:mm a")!) })
                self.state = .success(resultSorted)
            }
        }) { (error) in
            DispatchQueue.main.async {
                self.state = .failure(error.localizedDescription)
            }
        }
    }
}
