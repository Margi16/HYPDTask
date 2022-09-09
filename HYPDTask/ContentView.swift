//
//  ContentView.swift
//  HYPDTask
//
//  Created by Margi  Bhatt on 09/09/22.
//

import SwiftUI

struct ContentView: View {
    @State var index: Int = 0
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color.init(hex: "#FAFAFA"))
                
                HStack(alignment: .center, spacing: 20){
                    VStack(alignment: .center, spacing: 10) {
                        
                        Text("₹51.3K")
                            .font(Font.custom("Edmondsans", size: 30))
                            .foregroundColor(Color.init(hex: "#17181F"))
                        
                        Text("Total Sales")
                            .font(Font.custom("Gilroy", size: 16))
                            .foregroundColor(Color.init(hex: "#585858"))
                    }
                    
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 1, height: 80, alignment: .center)
                        .foregroundColor(Color.init(hex: "#0000001A"))
                    
                    VStack(alignment: .center, spacing: 10) {
                        
                        Text("₹3.4K")
                            .font(Font.custom("Edmondsans", size: 30))
                            .foregroundColor(Color.init(hex: "#17181F"))
                        
                        Text("My Commissions")
                            .font(Font.custom("Gilroy", size: 16))
                            .foregroundColor(Color.init(hex: "#585858"))
                        
                    }
                }
            }
            .frame(height: 122)
            .padding([.top,.bottom],32)
            .padding([.leading,.trailing],16)
            
            ZStack {
                
                HStack {
                    
                    Button {
                        print("Pending orders")
                        index = 1
                    } label: {
                        Text("Pending Orders")
                            .font(Font.custom("Gilroy", size: 11))
                            .bold()
                            .foregroundColor(index == 1 ? Color.init(hex: "#FFFFFF") : .init(hex: "#A9A9A9"))
                            .padding([.top,.bottom],8)
                            .padding([.leading,.trailing],12)
                            .background(index == 1 ? Color.init(hex: "#17181F") : .clear)
                            .cornerRadius(10)
                    }
                    .padding(5)
                    .cornerRadius(10)
                    
                    Button {
                        print("Successful orders")
                        index = 2
                    } label: {
                        Text("Successful Orders")
                            .font(Font.custom("Gilroy", size: 11))
                            .bold()
                            .foregroundColor(index == 2 ? Color.init(hex: "#FFFFFF") : .init(hex: "#A9A9A9"))
                            .padding([.top,.bottom],8)
                            .padding([.leading,.trailing],12)
                            .background(index == 2 ? Color.init(hex: "#17181F") : .clear)
                            .cornerRadius(10)
                    }
                    .padding(5)
                    .cornerRadius(10)
                    
                    Button {
                        print("Failed orders")
                        index = 3
                    } label: {
                        Text("Failed Orders")
                            .font(Font.custom("Gilroy", size: 11))
                            .bold()
                            .foregroundColor(index == 3 ? Color.init(hex: "#FFFFFF") : .init(hex: "#A9A9A9"))
                            .padding([.top,.bottom],8)
                            .padding([.leading,.trailing],12)
                            .background(index == 3 ? Color.init(hex: "#17181F") : .clear)
                            .cornerRadius(10)
                    }
                    .padding(5)
                    .cornerRadius(10)
                    
                }
                .background(Color.init(hex: "#F4F4F4"))
                
            }
            .cornerRadius(10)
            .frame(height: 40)
            .padding([.leading,.trailing],13)
            
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        
        let length = hexSanitized.count
        
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
        
        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
            
        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0
            
        } else {
            return nil
        }
        
        self.init(red: r, green: g, blue: b, opacity: a)
    }
}
