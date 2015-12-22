class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :confirmable,
		:recoverable, :rememberable, :trackable, :validatable
	has_many :messages
	has_many :usercomments
	mount_uploader :my_image, S3uploaderUploader
	validates_format_of :email, with: /\@snu\.ac\.kr/, message: 'We require your MySNU mail. The email address should end with @snu.ac.kr'


	# 별점 평균 매소드
	def avg
		sum = 0
		usercomments.each do |u|
			sum += u.score
		end
		if usercomments.count == 0
			0
		else
			sum.to_f / usercomments.count
		end
	end
end
