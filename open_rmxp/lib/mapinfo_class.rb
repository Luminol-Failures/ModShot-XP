MAP_ATTRIBUTES = [
  :id, :name, :parent_id, :order, :expanded,
]

MapInfoStruct ||= Struct.new(*MAP_ATTRIBUTES, keyword_init: true)

class MapInfoClass < MapInfoStruct
  require "json"
  @mapinfos = JSON.load(File.open("Data_JSON/MapInfos.json"))["mapinfos"]
end
