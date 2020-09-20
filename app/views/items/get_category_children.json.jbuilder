json.array! @category_children do |child|
  json.id child.id
  json.name child.name
end
# 子カテゴリーidとnameを取得