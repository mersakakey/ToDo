import SwiftUI

struct DoneButton: View {
    var body: some View {
        GeometryReader { geometry in

            RoundedRectangle(cornerRadius: 40)
                .fill(Color.green)
                .opacity(0.8)
                .overlay(            Text("Done")
                    .font(.system(size: geometry.size.width*0.3, weight: .black, design: .default))
                    .foregroundColor(.white)
                )
        }.aspectRatio(2, contentMode: .fit)
    
    }

}


struct DoneButton_Previews: PreviewProvider {
    static var previews: some View {
        DoneButton()
    }
}
