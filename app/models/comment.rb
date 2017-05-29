class Comment < ActiveRecord::Base
    #post에 속해 있다.
    belongs_to :post
end
