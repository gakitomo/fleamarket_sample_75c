require 'rails_helper'
describe Address do
  describe '#create' do
    it "address_first_name address_last_name address_first_name_kana address_last_name_kana address_number address_prefecture address_name address_block address_building address_phone_number が存在する場合は登録できること" do
      address = build(:address)
      expect(address).to be_valid
    end
    it "address_first_nameがない場合は登録できないこと" do
      address = build(:address, address_first_name: nil)
      address.valid?
      expect(address.errors[:address_first_name]).to include()
    end
    it "address_first_name_kanaがない場合は登録できないこと" do
      address = build(:address, address_last_name: nil)
      address.valid?
      expect(address.errors[:address_last_name]).to include()
    end
    it "address_last_name_kanaがない場合は登録できないこと" do
      address = build(:address, address_first_name_kana: nil)
      address.valid?
      expect(address.errors[:address_first_name_kana]).to include()
    end
    it "address_last_name_kanaがない場合は登録できないこと" do
      address = build(:address, address_last_name_kana: nil)
      address.valid?
      expect(address.errors[:address_last_name_kana]).to include()
    end
    it "address_numberがない場合は登録できないこと" do
      address = build(:address, address_number: nil)
      address.valid?
      expect(address.errors[:address_number]).to include()
    end
    it "address_prefectureがない場合は登録できないこと" do
      address = build(:address, address_prefecture: nil)
      address.valid?
      expect(address.errors[:address_prefecture]).to include()
    end
    it "address_nameがない場合は登録できないこと" do
      address = build(:address, address_name: nil)
      address.valid?
      expect(address.errors[:address_name]).to include()
    end
    it "address_blockがない場合は登録できないこと" do
      address = build(:address, address_block: nil)
      address.valid?
      expect(address.errors[:address_block]).to include()
    end
    it "address_buildingがなくても登録できること" do
      address = build(:address, address_building: nil)
      expect(address).to be_valid
    end
    it "address_phone_numberがなくても登録できること" do
      address = build(:address, address_phone_number: nil)
      expect(address).to be_valid
    end
  end
end
