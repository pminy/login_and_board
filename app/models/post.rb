class Post < ActiveRecord::Base
    validates :title, presence:
                    { message: "제목을 입력 해주세요"}
end
