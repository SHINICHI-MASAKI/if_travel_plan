=begin
仕様
・旅行プランの選択を要求（getsを使用）
・人数の入力を要求（getsを使用）
・5人以上なら10%割引
実行例
旅行プランを選択してください
1. 沖縄旅行（¥10,000）
2. 北海道旅行（¥20,000）
3. 九州旅行（¥15,000）
プランを選択 > 1

沖縄旅行ですね、何人で行きますか？

人数を入力 > 5

5人以上なので10%割引となります

合計料金：¥45,000


(:delimited, delimiter: ',') Railsでなければデフォルトでは使用できない、Rubyで使用する場合は必要なものをrequireしなければならない。
require 'active_support'
require 'active_support/core_ext/numeric/conversions'

(:delimited, delimiter: ',') = 金額を３桁に区切る
floor = 小数点を切り捨てる

=end



require 'active_support'
require 'active_support/core_ext/numeric/conversions'

puts <<~TEXT 
旅行プランを選択してください

1. 沖縄旅行（¥10,000）
2. 北海道旅行（¥20,000）
3. 九州旅行（¥15,000）

TEXT
puts ""

puts "プランを選択"
while true
  plan = gets.to_i
  break if (1..3).include?(plan)

puts <<~TEXT
  選択した番号はございません
  正しい番号を入力してください
TEXT

end

case plan
when 1
  price = 10000
  puts "沖縄旅行ですね、何人で行きますか？"
when 2
  price = 20000
  puts "北海道旅行ですね、何人で行きますか？"
when 3
  price = 15000
  puts "九州旅行ですね、何人で行きますか？"
end

puts "------------------------"
puts "人数を入力"
people = gets.to_i
puts "------------------------"
puts ""

if people >= 5
  puts "5人以上なので10%割引となります"
  total_price = people * price * 0.9
else
  total_price = people * price
end
puts ""

puts "合計金額:" "¥#{total_price.floor.to_s(:delimited, delimiter: ',')}円"

