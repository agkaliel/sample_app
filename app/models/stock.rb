class Stock < ApplicationRecord
  belongs_to :user
  belongs_to :ingredient
  validates :user_id, presence: true
  validates :ingredient_id, presence: true
  validates_numericality_of :quantity, :in => 0..2

  def toggle
  	quant = self.quantity
  	if quant > 0
  	  quant -= 1
  	self.quantity = quant
  	self.save
    end
  end

  def refill
  	if self.quantity < 2
  		self.quantity = 2
  		self.save
  	end
  end
end
