class MapDisplay
  include Glimmer::UI::CustomWidget

  body {
    @selected_map = swt_style
    @map = canvas(:double_buffered, :border) {
      layout_data :fill, :fill, true, true
      background :widget_background
    }
  }
end
