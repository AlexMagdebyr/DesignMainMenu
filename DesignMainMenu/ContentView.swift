import SwiftUI

struct ContentView: View {
    
    @State var index = MyList.playstation
    
    @State var show = true
        
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    Image("photo")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 200,height: 250)
                        .clipShape(Circle())
                    
                    Text("Hello,")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    Text("User")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Button(action: {
                        self.index = MyList.playstation
                        
                        withAnimation {
                            self.show.toggle()
                        }
                    }) {
                        HStack(spacing: 25) {
                            Image(systemName: "logo.playstation")
                                .foregroundColor(self.index == MyList.playstation ? Color.red : Color.white)
                            Text("Playstation")
                                .bold()
                                .foregroundColor(self.index == MyList.playstation ? Color.red : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == MyList.playstation ? Color.black.opacity(0.3) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    Button(action: {
                        self.index = MyList.xbox
                        
                        withAnimation {
                            self.show.toggle()
                        }
                    })  {
                        HStack(spacing: 25) {
                            Image(systemName: "xbox.logo")
                                .foregroundColor(self.index == MyList.xbox ? Color.red : Color.white)
                            Text("Xbox")
                                .bold()
                                .foregroundColor(self.index == MyList.xbox ? Color.red : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == MyList.xbox ? Color.black.opacity(0.3) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    Button(action: {
                        self.index = MyList.player
                        
                        withAnimation {
                            self.show.toggle()
                        }
                    })  {
                        HStack(spacing: 25) {
                            Image(systemName: "livephoto.play")
                                .foregroundColor(self.index == MyList.player ? Color.red : Color.white)
                            Text("Player")
                                .bold()
                                .foregroundColor(self.index == MyList.player ? Color.red : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == MyList.player ? Color.black.opacity(0.3) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    Button(action: {
                        self.index = MyList.other
                        
                        withAnimation {
                            self.show.toggle()
                        }
                    })  {
                        HStack(spacing: 25) {
                            Image(systemName: "play.tv.fill")
                                .foregroundColor(self.index == MyList.other ? Color.red : Color.white)
                            Text("Other")
                                .bold()
                                .foregroundColor(self.index == MyList.other ? Color.red : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == MyList.other ? Color.black.opacity(0.3) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    Divider()
                        .frame(width: 150, height: 1)
                        .padding(.vertical, 30)
                    Button(action: {
                        //
                    }) {
                        HStack {
                            Image(systemName: "pip.exit")
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                    }
                }.padding(.top, 25)
                    .padding(.horizontal, 20)
                Spacer(minLength: 0)
            }
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            
            VStack(alignment: .leading) {
                
                HStack() {
                    Button(action: {
                        withAnimation {
                            self.show.toggle()
                        }
                    }) {
                        Image(systemName: self.show ? "xmark" : "line.horizontal.3")
                            .resizable()
                            .frame(width: self.show ? 18 : 22, height: 18)
                            .foregroundColor(Color.black.opacity(0.4))
                    }
                    .padding(.trailing, 20)
                    .padding(.leading, 20)
                    
                    switch index {
                    case .playstation:
                        Text("Playstation")
                    case .xbox:
                        Text("Xbox")
                    case .player:
                        Text("Player")
                    case .other:
                        Text("Other")
                    }
                }
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                
                GeometryReader { _ in
                    VStack {
                        switch index {
                        case .playstation:
                            Playstation()
                        case .xbox:
                            Xbox()
                        case .player:
                            Player()
                        case .other:
                            Other()
                        }
                    }.padding(.top, 25)
                        .padding(.leading, 25)
                }
            }
            .background(Color.white)
            .cornerRadius(self.show ? 30 : 0)
            .scaleEffect(self.show ? 0.85 : 1)
            .offset(x: self.show ? (UIScreen.main.bounds.width / 2) + 30 : 0, y: self.show ? 20 : 0)
            .rotationEffect(.init(degrees:  self.show ? -5 : 0))
        }
        .edgesIgnoringSafeArea(.all)
        .background(Image("playstation"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
