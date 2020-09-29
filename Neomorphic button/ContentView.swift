//
//  ContentView.swift
//  Neomorphic button
//
//  Created by Mauro Canhao on 22/09/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 50) {
            LineButton()
            CircleButton()
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color(#colorLiteral(red: 0.8486280441, green: 0.9037795663, blue: 0.9840080142, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
        .animation(.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}


struct CircleButton: View {
    
    @State var tap = false
    @State var press = false
    
    var body: some View {
        ZStack{
            Image(systemName: "sun.max")
                .font(.system(size: 44, weight: .light))
                .offset(x: press ? -90 : 0, y: press ? -90 : 0)
                .rotation3DEffect(Angle(degrees: press ? 20 : 0), axis: (x: 10, y: -10, z: 0))
            
            Image(systemName: "moon")
                .font(.system(size: 44, weight: .light))
                .offset(x: press ? 0 : 90, y: press ? 0 : 90)
                .rotation3DEffect(Angle(degrees: press ? 0 : 20), axis: (x: -10, y: 10, z: 0))
        }
        .frame(width: 100, height: 100)
        .background(
            ZStack{
                LinearGradient(gradient: Gradient(colors: press ? [Color.white, Color(#colorLiteral(red: 0.8486280441, green: 0.9037795663, blue: 0.9840080142, alpha: 1))] : [Color(#colorLiteral(red: 0.8486280441, green: 0.9037795663, blue: 0.9840080142, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                
                Circle()
                    .stroke(Color.clear, lineWidth: 10)
                    .shadow(color: Color(press ? .white : #colorLiteral(red: 0.7152195573, green: 0.7906422615, blue: 0.908705771, alpha: 1)), radius: 5, x: -5, y: -5)
                
                Circle()
                    .stroke(Color.clear, lineWidth: 10)
                    .shadow(color: Color(press ? #colorLiteral(red: 0.7152195573, green: 0.7906422615, blue: 0.908705771, alpha: 1) : .white), radius: 5, x: 5, y: 5)
            }
        )
        .clipShape(Circle())
        .shadow(color: Color(press ? #colorLiteral(red: 0.7152195573, green: 0.7906422615, blue: 0.908705771, alpha: 1) : .white ), radius: 20, x: -20, y: -20)
        .shadow(color: Color(press ? .white : #colorLiteral(red: 0.7152195573, green: 0.7906422615, blue: 0.908705771, alpha: 1) ), radius: 20, x: 20, y: 20)
        .scaleEffect(tap ? 1.2 : 1)
        .onTapGesture(count: 1, perform: {
            self.tap = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.tap = false
            }
            self.press.toggle()
        })
    }
}

struct LineButton: View {
    
    @State var tap = false
    @State var press = false
    
    var body: some View {
        VStack {
            Text("Button")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .frame(width: 200, height: 60)
                
                .background(
                    ZStack{
                        press ? Color.white : Color(#colorLiteral(red: 0.7152195573, green: 0.7906422615, blue: 0.908705771, alpha: 1))
                        RoundedRectangle(cornerRadius: 16, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                            .foregroundColor( press ? Color(#colorLiteral(red: 0.7152195573, green: 0.7906422615, blue: 0.908705771, alpha: 1)) : .white)
                            .blur(radius: 4)
                            .offset(x: -8, y: -8)
                        
                        RoundedRectangle(cornerRadius: 16, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                            .fill(
                                LinearGradient(gradient: Gradient(colors: press ? [Color(#colorLiteral(red: 0.8486280441, green: 0.9037795663, blue: 0.9840080142, alpha: 1)), Color.white] : [Color.white, Color(#colorLiteral(red: 0.8486280441, green: 0.9037795663, blue: 0.9840080142, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            ).animation(.default)
                            .padding(2)
                            .blur(radius: 2)
                    }
                )
                
                .clipShape(RoundedRectangle(cornerRadius: 16, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                .overlay(
                    HStack{
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 24, weight: .light, design: .rounded))
                            .foregroundColor(Color.white.opacity(press ? 0 : 1))
                            .frame(width: press ? 64 : 54, height: press ? 4 : 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.purple)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: Color.purple.opacity(0.3), radius: 10, x: 10, y: 10)
                            .offset(x: press ? 70 : -10, y: press ? 16 : 0)
                        
                        Spacer()
                    }
                )
                .shadow(color: Color(press ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.7152195573, green: 0.7906422615, blue: 0.908705771, alpha: 1) ), radius: 20, x: 20, y: 20)
                .shadow(color: Color(press ? #colorLiteral(red: 0.7152195573, green: 0.7906422615, blue: 0.908705771, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), radius: 20, x: -20, y: -20)
                .scaleEffect(tap ? 1.2 : 1)
                .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                    print("tap")
                    self.tap = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.tap = false
                    }
                    self.press.toggle()
                })
            
            
        }.scaleEffect(1)
    }
}
