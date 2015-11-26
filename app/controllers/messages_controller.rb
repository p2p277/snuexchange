class MessagesController < ApplicationController
    def messages_write
        @user_id = User.find(params[:id])
    end
    
    def sending
        m = Message.new
        m.sender = params[:user_id]
        m.content = params[:content]
        m.receiver = params[:receiver_id]
        m.flags = false
        m.save
        
        redirect_to "/home/language"
    end
    
    def mymessages
    end
    
    def sendm
        @sending_message = Message.where(sender: params[:user_id])
    end
    
    def sendm_detail
        @sendm_detail_message = Message.find(params[:sendm_detail])
    end
    
    def sentm
        @sentm_message = Message.where(receiver: params[:receiver_id])
    end
    
    def sentm_detail
        @sentm_detail_message = Message.find(params[:sentm_detail])
        m = Message.find(params[:sentm_detail])
        m.flags = true
        m.save
    end
end
