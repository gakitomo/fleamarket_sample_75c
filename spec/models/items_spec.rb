require 'rails_helper'
describe Item do
  describe'#create' do
    it 'name condition_id shipping_burden_id shipping_method_id shipping_area_id category_id priceが存在する場合は登録できること' do
      item = build(:item)
      expect(item).to be_valid
    end

    it 'nameがない場合は登録できないこと'   do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include()
    end

    it 'descriptionがない場合は登録できないこと'  do  
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include()
    end

    it 'condition_idがない場合は登録できないこと'  do  
      item = build(:item, condition_id: nil)
      item.valid?
      expect(item.errors[:condition_id]).to include()
    end

    it 'shipping_burden_idがない場合は登録できないこと'  do    
      item = build(:item, shipping_burden_id: nil)
      item.valid?
      expect(item.errors[:shipping_burden_id]).to include()
    end

    it 'shipping_method_idがない場合は登録できないこと'  do
      item = build(:item, shipping_method_id: nil)
      item.valid?
      expect(item.errors[:shipping_method_id ]).to include()
    end

    it 'shipping_area_idがない場合は登録できないこと'   do
      item = build(:item, shipping_area_id: nil)
      item.valid?
      expect(item.errors[:shipping_area_id]).to include()
    end

    it 'category_idがない場合は登録できないこと'  do  
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include()
    end

    it 'priceがない場合は登録できないこと'  do  
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include()
      end
    end

  describe'#update' do
    it 'name condition_id shipping_burden_id shipping_method_id shipping_area_id category_id priceが存在する場合は登録できること' do
      item = build(:item)
      expect(item).to be_valid
    end
    it 'nameがない場合は登録できないこと'   do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include()
    end
    it 'descriptionがない場合は登録できないこと'  do  
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include()
    end

    it 'condition_idがない場合は登録できないこと'  do  
      item = build(:item, condition_id: nil)
      item.valid?
      expect(item.errors[:condition_id]).to include()
    end

    it 'shipping_burden_idがない場合は登録できないこと ' do    
      item = build(:item, shipping_burden_id: nil)
      item.valid?
      expect(item.errors[:shipping_burden_id]).to include()
    end

    it 'shipping_method_id がない場合は登録できないこと'  do
      item = build(:item, shipping_method_id: nil)
      item.valid?
      expect(item.errors[:shipping_method_id ]).to include()
    end

    it 'shipping_area_idがない場合は登録できないこと'   do
      item = build(:item, shipping_area_id: nil)
      item.valid?
      expect(item.errors[:shipping_area_id]).to include()
    end

    it 'category_idがない場合は登録できないこと'  do  
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include()
    end

    it 'priceがない場合は登録できないこと'  do  
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include()
      end

    it 'nameがない場合は登録できないこと'   do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include()
    end

    it 'descriptionがない場合は登録できないこと'  do  
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include()
    end

    it 'condition_idがない場合は登録できないこと'  do  
      item = build(:item, condition_id: nil)
      item.valid?
      expect(item.errors[:condition_id]).to include()
    end

    it 'shipping_burden_idがない場合は登録できないこと ' do    
      item = build(:item, shipping_burden_id: nil)
      item.valid?
      expect(item.errors[:shipping_burden_id]).to include()
    end

    it 'shipping_method_id がない場合は登録できないこと'  do
      item = build(:item, shipping_method_id: nil)
      item.valid?
      expect(item.errors[:shipping_method_id ]).to include()
    end

    it 'shipping_area_idがない場合は登録できないこと'   do
      item = build(:item, shipping_area_id: nil)
      item.valid?
      expect(item.errors[:shipping_area_id]).to include()
    end

    it 'category_idがない場合は登録できないこと'  do  
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include()
    end

    it 'priceがない場合は登録できないこと'  do  
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include()
    end
  end
end
