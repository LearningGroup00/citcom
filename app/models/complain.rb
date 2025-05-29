class Complain < ApplicationRecord
   belongs_to :category, optional: true
end
