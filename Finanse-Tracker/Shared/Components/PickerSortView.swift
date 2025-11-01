
import SwiftUI

struct PickerSortView: View {
    @Binding var groupingType: GroupingType

    var body: some View {
        Picker("Group by", selection: $groupingType) {
            ForEach(GroupingType.allCases, id: \.self) { type in
                Text(type.localizedTitle).tag(type)
            }
        }
        .pickerStyle(.segmented)
    }
}

