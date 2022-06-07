//
//  AthanView.swift
//  Adl
//

import SwiftUI
import Adhan


private let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .none
    dateFormatter.timeStyle = .short
    return dateFormatter
}()


struct AthanView: View {
    @State private var times = LocationManager().prayerTimes
    var body: some View {
        VStack {
            PrayerTimeView(times: $times)
        }
    }
}

struct PrayerTimeView: View {
    
    @Binding var times: PrayerTimes?
    let prayers: [Prayer] = [.fajr, .sunrise, .dhuhr, .asr, .maghrib, .isha]
    
    let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }()
    
    @State private var location = LocationManager()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                
                    VStack {
                       Text("\(location.lati())")
                    }
                    Section("Harita") {
                        ZStack(alignment: .bottom) {
                            VStack {
                                MapView()
                                    .disabled(true)
                                    .cornerRadius(13)
                            }
                            VStack {
                                VStack {
                                    Text("\(location.countPrayer(), style: .relative)")
                                }
                           
                            }
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                        }
                    }
                    Section("Ezan Saatleri") {
                        ForEach(prayers, id: \.self) { prayer in
                            HStack {
                                self.formattedPrayerName(prayer: prayer)
                                self.formattedPrayerTime(prayer: prayer, times: self.times)
                            }
                        }
                    }
                }
                .listStyle(.grouped)
            }
            .navigationTitle("Ezan Saatleri")
        }
    }
    

//    func timeUntilNextPrayer(_ nextPrayer: Date) {
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
//            let difference = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: nextPrayer)
//            print(difference)
//            if nextPrayer == Date() {
//                timer.invalidate()
//            }
//        }
//    }
    
    func formattedPrayerTime(prayer: Prayer, times: PrayerTimes?) -> some View {
        guard let time = times?.time(for: prayer) else {
            return Text("-")
        }
        return Text(time, formatter: dateFormatter)
    }

    func formattedPrayerName(prayer: Prayer) -> some View {
        switch prayer {
        case .fajr:
            return Text("Fajr")
        case .sunrise:
            return Text("Sunrise")
        case .dhuhr:
            return Text("Dhuhr")
        case .asr:
            return Text("Asr")
        case .maghrib:
            return Text("Maghrib")
        case .isha:
            return Text("Isha")
        }
    }
}

struct AthanView_Previews: PreviewProvider {
    static var previews: some View {
        AthanView()
    }
}


//    let allFontNames = UIFont.familyNames
//      .flatMap { UIFont.fontNames(forFamilyName: $0) }
//        VStack {
//            List(allFontNames, id: \.self) { name in
//              Text(name)
//                    .font(.custom(name, size: 20))
//                    .multilineTextAlignment(.trailing)
//            }
