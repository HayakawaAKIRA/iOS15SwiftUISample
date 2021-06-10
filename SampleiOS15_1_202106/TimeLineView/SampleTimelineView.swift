//
//  SampleTimelineView.swift
//  SampleiOS15_1_202106
//
//  Created by 61-201507-2184 on 2021/06/09.
//

import SwiftUI

struct SampleTimelineView: View {
    @State var paused1: Bool = true
    @State var paused2: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Text("EveryMinuteTimelineSchedule").font(.title).bold()
                    TimelineView(EveryMinuteTimelineSchedule()) { context in
                        Text("\(context.date)")
                    }
                    .padding(.bottom)
                }
                .task {
                    
                }
                
                
                VStack {
                    Divider()
                    Text("EveryMinuteTimelineSchedule.everyMinute").font(.title).bold()
                    TimelineView(EveryMinuteTimelineSchedule.everyMinute) { context in
                        Text("\(context.date)")
                    }
                    .padding(.bottom)
                }
                
                VStack {
                    Divider()
                    Text("PeriodicTimelineSchedule by 1 seconds").font(.title).bold()
                    TimelineView(PeriodicTimelineSchedule(from: Date(), by: 1)) { context in
                        Text("\(context.date)")
                    }
                    .padding(.bottom)
                }
                
                VStack {
                    Divider()
                    Text("Animation").font(.title).bold()
                    TimelineView(.animation) { context in
                        Text("\(context.date)")
                    }
                    .padding(.bottom)
                }
                
                VStack {
                    Divider()
                    Text("Animation interval 2").font(.title).bold()
                    Toggle("Pause", isOn: $paused1)
                    TimelineView(.animation(minimumInterval: 2, paused: paused1)) { context in
                        Text("\(context.date)")
                    }
                    .padding(.bottom)
                }
                
                VStack {
                    Divider()
                    Text("Animation interval 1.5").font(.title).bold()
                    Toggle("Pause", isOn: $paused2)
                    TimelineView(.animation(minimumInterval: 1.5, paused: paused2)) { context in
                        Text("\(context.date)")
                    }
                    .padding(.bottom)
                }
                
                
                VStack {
                    Divider()
                    Text("ExplicitTimelineSchedule").font(.title).bold()
                    TimelineView(ExplicitTimelineSchedule([
                        Date(),
                        Date().addingTimeInterval(2),
                        Date().addingTimeInterval(10),
                        Date().addingTimeInterval(15),
                        Date().addingTimeInterval(25),
                        Date().addingTimeInterval(35), ])) { context in
                        Text("\(context.date)")
                    }
                        .padding(.bottom)
                }
            }
            .padding()
        }
    }
}

struct SampleTimelineView_Previews: PreviewProvider {
    static var previews: some View {
        SampleTimelineView()
    }
}
