import SwiftUI

struct ContentView: View {
    @State var defaultImage = ["door","door","door"]
    @State var buttonNumber = 0
    @State var number = [0,0]
    @State var number2 = 0
    @State var tapCount = 0
    @State var count1 = 0
    @State var accurate1 = 0
    @State var count2 = 0
    @State var accurate2 = 0
    @State var apCount = 0
    @State var rust = 0
    @State var ratio1 = 0
    @State var ratio2 = 0
    var body: some View {
        ZStack {
            Image(.back)
            
            VStack(spacing: 50) {
                Text("モンティホール問題")
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .fontWeight(.black)
                
                HStack(spacing: 15){
                    Button { //１番目のドア
                        if defaultImage[0] != "yagi" {
                            var newNumber0 = 0
                            var newNumber1 = 0
                            if number == [0,0] {
                                buttonNumber = 1
                                apCount += 1
                                repeat {
                                    number[0] = Int.random(in: 0...2)
                                    number[1] = Int.random(in: 0...2)
                                } while number[0] == number[1]
                                if number[0] > number[1] {
                                    newNumber0 = number[0]
                                    newNumber1 = number[1]
                                    number[0] = newNumber1
                                    number[1] = newNumber0
                                }
                                if number[0] == 0 {
                                    defaultImage[number[1]] = "yagi"
                                    number2 += 1
                                } else {
                                    if let randomIndex = number.randomElement() {
                                        defaultImage[randomIndex] = "yagi"
                                    }
                                    number2 += 1
                                }
                                print(number)
                                print(number2)
                            } else {
                                if buttonNumber != 1 && apCount == 1 {
                                    apCount += 1
                                    count1 += 1
                                    rust += 1
                                } else if buttonNumber == 1 && apCount == 1 {
                                    apCount += 1
                                    count2 += 1
                                }
                                if number[0] == 0 {
                                    defaultImage[0] = "yagi"
                                    number2 += 1
                                    apCount += 1
                                    if count1 > 0 {
                                        ratio1 = Int(Double(accurate1) / Double(count1) * 100.0)
                                    } else {
                                        ratio1 = 0
                                    }
                                    
                                    if count2 > 0 {
                                        ratio2 = Int(Double(accurate2) / Double(count2) * 100.0)
                                    } else {
                                        ratio2 = 0
                                    }
                                } else {
                                    if apCount == 2 && rust == 1 {
                                        accurate1 += 1
                                    } else if apCount == 2 && rust == 0 {
                                        accurate2 += 1
                                    }
                                    defaultImage[0] = "atari"
                                    number2 += 1
                                    apCount += 1
                                    if count1 > 0 {
                                        ratio1 = Int(Double(accurate1) / Double(count1) * 100.0)
                                    } else {
                                        ratio1 = 0
                                    }
                                    
                                    if count2 > 0 {
                                        ratio2 = Int(Double(accurate2) / Double(count2) * 100.0)
                                    } else {
                                        ratio2 = 0
                                    }
                                }
                            }
                        }
                    } label: {
                        Image(defaultImage[0])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 150)
                    }
                    
                    Button { //２番目のドア
                        if defaultImage[1] != "yagi" {
                            var newNumber0 = 0
                            var newNumber1 = 0
                            if number == [0,0] {
                                buttonNumber = 2
                                apCount += 1
                                repeat {
                                    number[0] = Int.random(in: 0...2)
                                    number[1] = Int.random(in: 0...2)
                                } while number[0] == number[1]
                                if number[0] > number[1] {
                                    newNumber0 = number[0]
                                    newNumber1 = number[1]
                                    number[0] = newNumber1
                                    number[1] = newNumber0
                                }
                                if number[0] == 1 {
                                    defaultImage[number[1]] = "yagi"
                                    number2 += 1
                                } else if number[1] == 1 {
                                    defaultImage[number[0]] = "yagi"
                                    number2 += 1
                                } else {
                                    if let randomIndex = number.randomElement() {
                                        defaultImage[randomIndex] = "yagi"
                                    }
                                    number2 += 1
                                }
                                print(number)
                                print(number2)
                            } else {
                                if buttonNumber != 2 && apCount == 1 {
                                    count1 += 1
                                    apCount += 1
                                    rust += 1
                                } else if buttonNumber == 2 && apCount == 1 {
                                    count2 += 1
                                    apCount += 1
                                }
                                if number[0] == 1 || number[1] == 1 {
                                    defaultImage[1] = "yagi"
                                    number2 += 1
                                    apCount += 1
                                    if count1 > 0 {
                                        ratio1 = Int(Double(accurate1) / Double(count1) * 100.0)
                                    } else {
                                        ratio1 = 0
                                    }
                                    
                                    if count2 > 0 {
                                        ratio2 = Int(Double(accurate2) / Double(count2) * 100.0)
                                    } else {
                                        ratio2 = 0
                                    }
                                } else {
                                    if apCount == 2 && rust == 1 {
                                        accurate1 += 1
                                    } else if apCount == 2 && rust == 0 {
                                        accurate2 += 1
                                    }
                                    defaultImage[1] = "atari"
                                    number2 += 1
                                    apCount += 1
                                    if count1 > 0 {
                                        ratio1 = Int(Double(accurate1) / Double(count1) * 100.0)
                                    } else {
                                        ratio1 = 0
                                    }
                                    
                                    if count2 > 0 {
                                        ratio2 = Int(Double(accurate2) / Double(count2) * 100.0)
                                    } else {
                                        ratio2 = 0
                                    }
                                }
                            }
                        }
                    } label: {
                        Image(defaultImage[1])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 150)
                    }
                    
                    Button { //３番目のドア
                        if defaultImage[2] != "yagi" {
                            var newNumber0 = 0
                            var newNumber1 = 0
                            if number == [0,0] {
                                buttonNumber = 3
                                apCount += 1
                                repeat {
                                    number[0] = Int.random(in: 0...2)
                                    number[1] = Int.random(in: 0...2)
                                } while number[0] == number[1]
                                if number[0] > number[1] {
                                    newNumber0 = number[0]
                                    newNumber1 = number[1]
                                    number[0] = newNumber1
                                    number[1] = newNumber0
                                }
                                if number[1] == 2 {
                                    defaultImage[number[0]] = "yagi"
                                    number2 += 1
                                } else {
                                    if let randomIndex = number.randomElement() {
                                        defaultImage[randomIndex] = "yagi"
                                    }
                                    number2 += 1
                                }
                                print(number)
                                print(number2)
                            } else {
                                if buttonNumber != 3 && apCount == 1 {
                                    count1 += 1
                                    apCount += 1
                                    rust += 1
                                } else if buttonNumber == 3 && apCount == 1 {
                                    count2 += 1
                                    apCount += 1
                                }
                                if number[1] == 2 {
                                    defaultImage[2] = "yagi"
                                    number2 += 1
                                    apCount += 1
                                    if count1 > 0 {
                                        ratio1 = Int(Double(accurate1) / Double(count1) * 100.0)
                                    } else {
                                        ratio1 = 0
                                    }
                                    
                                    if count2 > 0 {
                                        ratio2 = Int(Double(accurate2) / Double(count2) * 100.0)
                                    } else {
                                        ratio2 = 0
                                    }
                                } else {
                                    if apCount == 2 && rust == 1 {
                                        accurate1 += 1
                                    } else if apCount == 2 && rust == 0 {
                                        accurate2 += 1
                                    }
                                    defaultImage[2] = "atari"
                                    number2 += 1
                                    apCount += 1
                                    if count1 > 0 {
                                        ratio1 = Int(Double(accurate1) / Double(count1) * 100.0)
                                    } else {
                                        ratio1 = 0
                                    }
                                    
                                    if count2 > 0 {
                                        ratio2 = Int(Double(accurate2) / Double(count2) * 100.0)
                                    } else {
                                        ratio2 = 0
                                    }
                                }
                            }
                        }
                    } label: {
                        Image(defaultImage[2])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 150)
                    }
                }
                Button {
                    if number2 >= 2 {
                        defaultImage = ["door","door","door"]
                        number = [0,0]
                        number2 = 0
                        buttonNumber = 0
                        apCount = 0
                        rust = 0
                    }
                } label: {
                    Text("リセット")
                        .font(.title)
                        .frame(width: 250, height: 50)
                        .foregroundColor(Color(.blue))
                                .background(Color(.white))
                                .cornerRadius(24)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 24)
                                        .stroke(Color(.blue), lineWidth: 1.0)
                                )
                }
                
                Text("選択を変えた\n回数：\(count1)　的中：\(accurate1)　確率：\(ratio1)%")
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                    .fontWeight(.semibold)
                
                Text("選択を変えなかった\n回数：\(count2)　的中：\(accurate2)　確率：\(ratio2)%")
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                    .fontWeight(.semibold)
                
                Button {
                    count1 = 0
                    count2 = 0
                    accurate1 = 0
                    accurate2 = 0
                    ratio1 = 0
                    ratio2 = 0
                } label: {
                    Text("数字のリセット")
                        .font(.title)
                        .frame(width: 250, height: 50)
                        .foregroundColor(Color(.red))
                                .background(Color(.white))
                                .cornerRadius(24)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 24)
                                        .stroke(Color(.red), lineWidth: 1.0)
                                )
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
