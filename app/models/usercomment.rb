class Usercomment < ActiveRecord::Base
    belongs_to :user
    # 별점 평균 매소드
      def avg
            sum = 0
            Usercomment.each do |u|
              sum += u.score
            end
            if Usercomment.count == 0
                0
            else
               sum.to_f / Usercomment.count
            end
      end
end
