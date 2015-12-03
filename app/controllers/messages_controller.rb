class MessagesController < ApplicationController
    def messages_write
        @user_id = User.find(params[:id])
        @message_communications = Message.where(sender: [current_user.id, params[:id]], receiver: [params[:id], current_user.id])
        
        @flags_drop =  Message.where(sender: params[:id], receiver: current_user.id)
        @flags_drop.each do |f|
            f.flags = true
            f.save
        end
    end
    
    def sending
        m = Message.new
        m.sender = params[:user_id]
        m.content = params[:content]
        m.receiver = params[:receiver_id]
        m.flags = false
        m.save
        
        redirect_to :back
    end
    
    def mymessages
        @sending_message = Message.where(sender: current_user.id)
        @sentm_message = Message.where(receiver: current_user.id)
    end
end
