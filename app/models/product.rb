class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates_presence_of :title
  validates_presence_of :price
  validates_presence_of :description
  validates :price, :format => { :with => /\A\d+(?:\.\d{1,2})?\z/ }

  def average_rating
    self.reviews.average(:rating)
  end

end
