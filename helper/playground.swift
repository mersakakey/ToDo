import SwiftUI

struct playground: View {
    @State var weather = ""

var body: some View {
RoundedRectangle(cornerRadius: 40)
        .fill(.red)
        .frame(width:200, height: 150)
}

    
    //https://api.openweathermap.org/data/3.0/onecall?lat=41.7687&lon=140.7288&appid=a4e547e63dfcf51da3c7a213cd6071f5
}


struct playground_Previews: PreviewProvider {
    static var previews: some View {
        playground()

    }
}
