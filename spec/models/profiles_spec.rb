require 'rails_helper'
describe Profile do
  describe '#create' do
    it "family_name given_name family_name_kana given_name_kana birthdayが存在する場合は登録できること" do
      profile = build(:profile)
      expect(profile).to be_valid
    end
    it "family_nameがない場合は登録できないこと" do
      profile = build(:profile, family_name: nil)
      profile.valid?
      expect(profile.errors[:family_name]).to include()
    end
    it "family_nameが全角でない場合は登録できないこと" do
      profile = build(:profile)
      expect(profile.family_name).to match(/\A[一-龥ぁ-ん]/)
    end
    it "given_nameがない場合は登録できないこと" do
      profile = build(:profile, given_name: nil)
      profile.valid?
      expect(profile.errors[:given_name]).to include()
    end
    it "given_nameが全角でない場合は登録できないこと" do
      profile = build(:profile)
      expect(profile.given_name).to match(/\A[一-龥ぁ-ん]/)
    end
    it "family_name_kanaがない場合は登録できないこと" do
      profile = build(:profile, family_name_kana: nil)
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include()
    end
    it "family_name_kanaが全角でない場合は登録できないこと" do
      profile = build(:profile)
      expect(profile.family_name_kana).to match(/\A[一-龥ぁ-ん]/)
    end
    it "given_name_kanaがない場合は登録できないこと" do
      profile = build(:profile, given_name_kana: nil)
      profile.valid?
      expect(profile.errors[:given_name_kana]).to include()
    end
    it "given_name_kanaが全角でない場合は登録できないこと" do
      profile = build(:profile)
      expect(profile.given_name_kana).to match(/\A[一-龥ぁ-ん]/)
    end
    it "birthdayがない場合は登録できないこと" do
      profile = build(:profile, birthday: nil)
      profile.valid?
      expect(profile.errors[:birthday]).to include()
    end
  end
end