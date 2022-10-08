class Day < ApplicationRecord
    has_many :currencies, dependent: :destroy
    validates :date, presence: true, uniqueness: true

    def self.oldest_day()
        order(:date).first
    end
end
