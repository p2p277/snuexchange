class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :confirmable,
		:recoverable, :rememberable, :trackable, :validatable
	has_many :messages
	has_many :usercomments

	validates_format_of :email, with: /\@snu\.ac\.kr/, message: 'We require your MySNU mail. The email address should end with @snu.ac.kr'
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

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
