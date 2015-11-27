class MessagesController < ApplicationController
    def messages_write
        @user_id = User.find(params[:id])
    end
    
    def sending
        m = Message.new
        m.sender = params[:user_id]
        m.content = params[:content]
        m.receiver = params[:receiver_id]
        m.receiver_flags = false
        m.sender_flags = false
        m.receiver_destroy = false
        m.sender_destroy = false
        m.save
        
        redirect_to "/home/language"
    end
    
    def mymessages
    end
    
    def sendm
        @sending_message = Message.where(sender: current_user.id)
    end
    
    def sendm_detail
        @sendm_detail_message = Message.find(params[:sendm_detail])
        m = Message.find(params[:sendm_detail])
        m.sender_flags = true
        m.save
    end
    
    def sendm_delete
        m = Message.find(params[:sendm_delete])
        m.sender_destroy = true
        m.save
        if m.receiver_destroy == true && m.sender_destroy == true
           m.destroy
        else
        end
        
        redirect_to "/sendm"
    end
    
    def sentm
        @sentm_message = Message.where(receiver: current_user.id)
    end
    
    def sentm_detail
        @sentm_detail_message = Message.find(params[:sentm_detail])
        m = Message.find(params[:sentm_detail])
        m.receiver_flags = true
        m.save
    end
    
    def sentm_delete
        m = Message.find(params[:sentm_delete])
        m.receiver_destroy = true
        m.save
        if m.receiver_destroy == true && m.sender_destroy == true
           m.destroy
        else
        end
        
        redirect_to "/sentm"
    end
end
