module PayjpMock
  def self.payjp_mock_data
    {
      "cards": {
        "count": 0,
        "data": [],
        "has_more": false,
        "object": "list",
        "url": "/v1/customers/cus_121673955bd7aa144de5a8f6c262/cards"
      },
      "created": 1433127983,
      "default_card": null,
      "description": "test",
      "email": null,
      "id": "cus_121673955bd7aa144de5a8f6c262",
      "livemode": false,
      "metadata": null,
      "object": "customer",
      "subscriptions": {
        "count": 0,
        "data": [],
        "has_more": false,
        "object": "list",
        "url": "/v1/customers/cus_121673955bd7aa144de5a8f6c262/subscriptions"
      }
    }
  end
end
