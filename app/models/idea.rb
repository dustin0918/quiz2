class Idea < ApplicationRecord
    belongs_to :user
    validates(
        :title,presence:true, uniqueness: true
    )
    validates(
        :description,
        presence:{message:"must exist"},
        length:{minimum:10}
    )
end