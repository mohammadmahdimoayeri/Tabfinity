import SwiftUI

public struct TabLightContainer<Content: View>: View {
    @Binding public var selection: TabLightItem
    public let content: Content
    @State private var tabs: [TabLightItem] = []
    
    public init(selection: Binding<TabLightItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            content
                .ignoresSafeArea()
            TabLight(tabs: tabs, selection: $selection, localSelection: selection, showLight: selection)
        }
        .onPreferenceChange(TabLightPreferencedKey.self, perform: { value in
            self.tabs = value
        })
    }
}
