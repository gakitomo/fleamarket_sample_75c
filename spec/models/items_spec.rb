require 'rails_helper'
describe Item do
  describe'#create' do
    it 'nameがない場合は登録できないこと' do
      item = Item.new
    end
  end
end