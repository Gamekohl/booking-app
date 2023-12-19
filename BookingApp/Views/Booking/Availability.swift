//
//  CalendarView.swift
//  BookingApp
//
//  Created by Julian on 19.12.23.
//

import SwiftUI
import HorizonCalendar

struct Availability: View {
    var body: some View {
        HorizonView()
            .padding(.horizontal, 24)
    }
}

struct HorizonView: UIViewRepresentable {
    @State private var selectedDay: Day?
    
    func makeUIView(context: Context) -> CalendarView {
        let calendarView = CalendarView(initialContent: makeContent())
        
        calendarView.daySelectionHandler = { day in
            self.selectedDay = day
        }
        
        return calendarView
    }
    
    func updateUIView(_ uiView: CalendarView, context: UIViewRepresentableContext<HorizonView>) {}
    
    private func makeContent() -> CalendarViewContent {
        let calendar = Calendar.current
        let startDate = calendar.date(from: calendar.dateComponents([.day, .month, .year], from: Date.now))!
        let endDate = calendar.date(from: DateComponents(year: 2024, month: 12, day: 31))!
        return CalendarViewContent(
            calendar: calendar,
            visibleDateRange: startDate...endDate,
            monthsLayout: .vertical(options: VerticalMonthsLayoutOptions()))
        .dayItemProvider { day in
            var invariantProperties = DayLabel.InvariantViewProperties(font: UIFont.systemFont(ofSize: 18), textColor: .black, backgroundColor: .clear)
            
            if day == selectedDay {
                invariantProperties.textColor = .white
                invariantProperties.backgroundColor = .black
            }
            
            
            return DayLabel.calendarItemModel(invariantViewProperties: invariantProperties, content: .init(day: day))
        }
        .interMonthSpacing(24)
    }
    
}

struct DayLabel: CalendarItemViewRepresentable {

  /// Properties that are set once when we initialize the view.
  struct InvariantViewProperties: Hashable {
    var font: UIFont
    var textColor: UIColor
    var backgroundColor: UIColor
  }

  /// Properties that will vary depending on the particular date being displayed.
  struct Content: Equatable {
    let day: Day
  }

  static func makeView(
    withInvariantViewProperties invariantViewProperties: InvariantViewProperties)
    -> UILabel
  {
    let label = UILabel()

    label.backgroundColor = invariantViewProperties.backgroundColor
    label.font = invariantViewProperties.font
    label.textColor = invariantViewProperties.textColor

    label.textAlignment = .center
    label.clipsToBounds = true
    label.layer.cornerRadius = 12
    
    return label
  }

  static func setContent(_ content: Content, on view: UILabel) {
    view.text = "\(content.day.day)"
  }

}

#Preview {
    Availability()
}
