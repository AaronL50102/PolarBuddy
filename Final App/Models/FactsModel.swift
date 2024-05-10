//
//  FactsView.swift
//  Final App
//
//  Created by Jordan Levinson (student LM) on 4/12/24.
//

import SwiftUI

struct Result: Codable{
    var co2: [Co2] = [Co2()]
}

struct Co2: Codable{
    var year: String = ""
    var month: String = "5"
    var day: String = "7"
    var trend: String = ""
    
}

extension Co2: Identifiable {
    var id: String {year + month + day}
}

extension Co2: Equatable {
    static func == (a: Co2, b: Co2) -> Bool {
            return
                a.month == b.month &&
                a.day == b.day
        }
}

@MainActor
class FactsModel: ObservableObject{
    
    @Published var result = Result()
    

    
    
    init(){

        print("initializing")
        Task{
            await loadData()
        }
    }
  
    func loadData() async{
        print("function started")
        let urlString = "https://global-warming.org/api/co2-api"
        
        guard let url = URL(string: urlString) else{
            print("url failed")
            return
        }
        print("created url")
        guard let (data, _) = try? await URLSession.shared.data(from: url) else{
            print("data failed")
            return
        }
        print("created data")
        guard var t = try? JSONDecoder().decode(Result.self, from: data) else {
            print("json failed")
            return
        }
        print("decoded JSON")
        // start by creating a co2 object with today's date.
        let currentDateTime = Date()

        // get the user's calendar
        let userCalendar = Calendar.current

        // choose which date and time components are needed
        let requestedComponents: Set<Calendar.Component> = [
            .year,
            .month,
            .day,
            .hour,
            .minute,
            .second
        ]
        
        let dateTimeComponents = userCalendar.dateComponents(requestedComponents, from: currentDateTime)
//
        var today = Co2()
        today.month = String(describing: dateTimeComponents.month ?? 5)
        today.day = String(describing: dateTimeComponents.day ?? 7)
        print("today \(today.day)")
        
        for index in stride(from: t.co2.count-2, through: 0, by: -1){
            if t.co2[index] != today{
                t.co2.remove(at: index)
            }
        }
        
        print(result)
        result = t
        print("updated result")
    }
}
