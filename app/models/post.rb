class Post < ActiveRecord::Base
    validates :title, presence:
                    { message: "제목을 입력 해주세요"}
    has_many:replies
    belongs_to:user
end
