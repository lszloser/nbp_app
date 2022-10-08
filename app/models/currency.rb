class Currency < ApplicationRecord
    belongs_to :day
    CODES = ['USD', 'CHF', 'EUR'].freeze
end
