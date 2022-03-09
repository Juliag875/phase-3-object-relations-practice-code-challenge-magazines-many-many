class Subscription < ActiveRecord::Base
  belongs_to :magazine
  belongs_to :reader 

  def print_details
    "#{self.reader.name} subscribed to #{self.magazine.title} for #{self.price}"
  end

  


  # TEST
  # Subsctiption.first.print_details
end