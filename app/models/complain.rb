class Complain < ApplicationRecord
   belongs_to :category, optional: true
   belongs_to :user
   has_many_attached :attachments
end
