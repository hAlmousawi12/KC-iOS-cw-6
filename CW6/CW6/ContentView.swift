//
//  ContentView.swift
//  CW6
//
//  Created by Hussain Almousawi on 10/26/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var height = ""
    @State var weight = ""
    
    @State var BMI = ""
    @State var Status = ""
    
    var body: some View {

        VStack {
            Image("calculator")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()
            Text("ادخل الطول و الوزن")
                .font(.title)
                .fontWeight(.semibold)
            
            TextField("Enter your height in meters", text: $height)
            
            TextField("Enter your weight in KG", text: $weight)
            
            
            Button(action: {
                BMICalculator(height: Double(height) ?? 1.0, weight: Double(weight) ?? 1.0)
            }, label: {
                Text("احسب")
                    .font(.title)
                    .foregroundColor(.white)
            })
            .frame(width: 350, height: 65)
            .background(Color.gray)
            .cornerRadius(10)
            
            Text("BMI = \(BMI)")
            Text("Status = \(Status)")
        }
    }
    func BMICalculator(height: Double, weight: Double) {
        var eyad = weight / (height * height)
        if eyad <= 20 {
            Status = "ضعيف"
        } else if eyad <= 25 {
            Status = "جيد"
        } else {
            Status = "سمين"
        }
        BMI = "\(eyad)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
