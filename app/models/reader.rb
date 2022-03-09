class Reader < ActiveRecord::Base
  has_many :subscriptions
  has_many :magazines, through: :subscriptions

  def subscribe(magazine, price)
    Subscription.create(reader_id: self.id, magazine_id: magazine.id, price: price)
  end

  def total_subscription_price
    self.subscriptions.sum(:price)
# or
    # self.subscriptions.pluck(:price).sum
# or
    # self.subscriptions.map{|s| s.price}.sum
# or
    # total=0
    # self.subscriptions.each do |sub|
    #   total += 10
    # end
    # total
  end

  def cancel_subscription(magazine)
    self.subscriptions.find{|sub| sub.magazine_id == magazine.id}.destroy

    # self.subscriptions.where(magazine_id: magazine.id).destroy_all
  end
end

# TEST 
# Reader.first.subscribe(Magazine.first, 10)