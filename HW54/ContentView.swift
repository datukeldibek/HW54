//
//  ContentView.swift
//  HW54
//
//  Created by Jarae on 10/4/23.
//

import SwiftUI

struct ContentView: View {
    
var tabbarItems: [String]
@State var selectedIndex = 0
    
var svItems: [String]
@State var selectedIndex2 = 0
    
@State var flag:Bool = false
@State private var myNumber: Int?
    
var body: some View {
    ZStack {
        //main vstack
        VStack {
        //line 1 (Manas ave)
            HStack {
                Button { } label: { Image(systemName: "car") }
                Spacer()
                VStack {
                    Text("Delivering to")
                        .font(.system(size: 12, weight: .light, design: .serif))
                    Text("Manas Ave")
                        .font(.system(size: 20, weight: .bold, design: .serif))
                        .italic()
                }
                Spacer()
                Button { } label: { Image(systemName: "cart") }
            }
            .padding(.horizontal, 20)
            
        //line 2 (buttons)
    ScrollViewReader { scrollView in
        ScrollView(.horizontal, showsIndicators: true) {
            HStack {
                ForEach(svItems.indices, id: \.self) { index2 in
                    HStack {
                        Button{ selectedIndex2 = index2 } label: {Image(systemName: "star")}
                            if selectedIndex2 == index2 {
                                Text(svItems[index2])
                                .font(.subheadline)
                            }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .foregroundColor(selectedIndex2 == index2 ? .white : .black)
                    .background(Capsule().foregroundColor(selectedIndex2 == index2 ? .pink : .clear))
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                        }
                    }
                            
                }
            }
                
        }
        .padding()
    }
        //line 3 (text)
            Text("56 stores open")
                .font(.system(size: 14, weight: .bold, design: .serif))
                .frame(width: 380, alignment: .leading)
                .padding(.top, 20)
                
        //line 4 (searchbar)
            HStack {
            TextField("\tEnter a Number", value: $myNumber, formatter: numberFormatter)
                .frame(width: 277, height: 55)
                .background(Color.pink.opacity(0.2))
                .cornerRadius(10)
            Spacer()
            Button { } label: { Image(systemName: "car") }
            }
            .padding(.horizontal, 30)
            .padding(.top, 20)
                
            
        //line 5
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                //1
                ForEach(0..<5) {_ in
                    VStack {
                        Image("1")
                            .resizable()
                            .frame(width: 150, height: 150)
                        Text("Tony Roma’s")
                            .font(.system(size: 16, weight: .bold, design: .serif))
                        Text("Ribs & Steaks\nDelivery: FREE • Minimum: $20")
                            .font(.system(size: 10, weight: .light, design: .serif))
                        HStack {
                            Image(systemName: "star.fill")
                            Text("4,5")
                                .font(.system(size: 12, weight: .bold, design: .serif))
                            Image(systemName: "clock")
                            Text("35 mins")
                                .font(.system(size: 12, weight: .bold, design: .serif))
                        }
                    }
                    .padding(.horizontal)
                        
                }
                .frame(width: 160, height: 250, alignment: .center)
            }
            .padding(.top, 20)
            
        }
        //line 6
        VStack {
            VStack {
                HStack {
                    VStack(alignment: .leading){
                        Text("Paul")
                            .font(.system(size: 16, weight: .bold, design: .serif))
                        Text("French Pasta\nDelivery: FREE • Minimum: $0")
                            .font(.system(size: 12, weight: .light, design: .serif))
                    }
                    //Spacer()
                    Image("2")
                        .resizable()
                        .frame(width: 120, height: 120, alignment: .center)
                }
                .padding(.bottom, 20)
                .frame(height: 100)
                HStack {
                    Image(systemName: "star.fill")
                    Text("4,5")
                        .font(.system(size: 12, weight: .bold, design: .serif))
                    Image(systemName: "clock")
                    Text("25 mins")
                        .font(.system(size: 12, weight: .bold, design: .serif))
                }
                .padding(.bottom,10)
            }
            .padding(.horizontal, 20)
            .background(Color.pink.opacity(0.1))
        }
        .padding(20)
        
        .cornerRadius(10)
        
        //line 7
    ScrollViewReader { scrollView in
        ScrollView(.horizontal, showsIndicators: false) {
        HStack {
            ForEach(tabbarItems.indices, id: \.self) { index in
             
                Text(tabbarItems[index])
                .font(.subheadline)
                .padding(.horizontal)
                .padding(.vertical, 4)
                .foregroundColor(selectedIndex == index ? .white : .black)
                .background(Capsule().foregroundColor(selectedIndex == index ? .pink : .clear))
                .onTapGesture {
                    withAnimation(.easeInOut) {
                    selectedIndex = index
                }
            }
        }
        }
    }
    .padding()
    .background(Color(.systemGray6))
    .cornerRadius(25)
             
    }
    }//end of main vstack
    }
}//body
    
}//contentview

private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
        ContentView(tabbarItems: [ "Random", "Travel", "Wallpaper", "Food", "Interior Design" ], svItems: ["Delivery", "Luch", "Package", "Rating", "Order", "Time"]).previewDisplayName("TabBarView")
    }
}
