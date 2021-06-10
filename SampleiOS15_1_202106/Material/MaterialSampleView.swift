//
//  MaterialSampleView.swift
//  SampleiOS15_1_202106
//
//  Created by 61-201507-2184 on 2021/06/10.
//

import SwiftUI

struct MaterialSampleView: View {
    var body: some View {
        TabView {
            MaterialSampleContentView(background: Color.teal.ignoresSafeArea())
                .environment(\.colorScheme, .light)
            MaterialSampleContentView(background: Color.teal.ignoresSafeArea())
                .environment(\.colorScheme, .dark)
            MaterialSampleContentView(background:
                                        AsyncImage(url: URL(string:"https://images.unsplash.com/photo-1506905925346-21bda4d32df4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"))
                                        .ignoresSafeArea()
            )
                .environment(\.colorScheme, .dark)
        }
        .tabViewStyle(PageTabViewStyle())
        .ignoresSafeArea()
        .navigationTitle("Material")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct MaterialSampleContentView<Background>: View where Background: View{
    
    var background: Background
    
    
    var body: some View {
        ZStack {
            background
            VStack {
                Group {
                    Label("No Material", systemImage: "flag.fill")
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .padding(.horizontal)
                Group {
                    Label("UltraThinMaterial", systemImage: "flag.fill")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
                }
                .padding(.horizontal)
                Group {
                    Label("RegularMaterial", systemImage: "flag.fill")
                        .frame(maxWidth: .infinity)
                    
                        .padding()
                        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 10))
                }
                .padding(.horizontal)
                Group {
                    Label("ThickMaterial", systemImage: "flag.fill")
                        .frame(maxWidth: .infinity)
                    
                        .padding()
                        .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 10))
                }
                .padding(.horizontal)
                Group {
                    Label("UltraThickMaterial", systemImage: "flag.fill")
                        .frame(maxWidth: .infinity)
                    
                        .padding()
                        .background(.ultraThickMaterial, in: RoundedRectangle(cornerRadius: 10))
                }
                .padding(.horizontal)
                Group {
                    Label("RegularMaterial ForegroundStyle", systemImage: "flag.fill")
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(
                            .linearGradient(
                                colors: [.yellow, .blue],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .padding()
                        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 10))
                }
                .padding(.horizontal)
            }
        }
    }
}


struct MaterialSampleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MaterialSampleView()
        }
    }
}
