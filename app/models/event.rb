class Event < ApplicationRecord


  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :event_admin, class_name: "User"


  validates :start_date, presence: true, inclusion: { in: (Date.today..Date.today+5.years) }

  validate :only_valid_duration
  validates :duration, presence: true

  validates :title, presence: true, length: { in: 5..40 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, :inclusion => 1..1000
  validates :location, presence: true


  def only_valid_duration
    if (self.duration % 5) != 0 || self.duration < 0
        self.errors[:base] << "La durée doit être un multiple de 5 !"
    end
end

end
