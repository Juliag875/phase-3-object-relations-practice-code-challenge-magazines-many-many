class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions

  def email_list
    self.reader.map {|reader| reader.email}.join(",")
#or
    # self.reader.pluck(:email).join(";")
  end

  def self.most_popular
    # Magazine.all
    # top_mag = Magazine.first
    # self.all.each do |mag|
    #   if mag.subscriptions.count > top_mag.subscriptions.count
    #     top_mag = mag
    #   end
    # end
    # top_mag

    self.all.max_by{|mag| mag.subscriptions.count}
  end
end

# TEST
# Magazine.most_popular

