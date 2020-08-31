class ShippingMethod < ActiveHash::Base
  self.data = [
      {id: 1, name: '普通郵便'}, {id: 2, name: 'レターパック'}
  ]
end