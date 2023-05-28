//
//  CalendarView.swift
//  festivalSeoul
//
//  Created by 권순형 on 2023/04/03.
//

import SwiftUI

struct CalendarView: View {
    @State private var date = Date()
    var body: some View {
        HStack {
            DatePicker(
                    "Start Date",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
            .padding(30)
        }
        .frame(alignment: .topLeading)
        
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
