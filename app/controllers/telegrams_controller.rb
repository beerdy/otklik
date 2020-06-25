require 'net/http'

class TelegramsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :parse_telegrama, only: [:web_hook_proxy]
  
  def web_hook_proxy
    # Net::HTTP.post_form( URI.parse('http://192.168.20.187:3000/api_chats/telegrams/web_hook'), @telegrama )
    Net::HTTP.post_form( URI.parse('https://support.citykrepost.ru/api_chats/telegrams/web_hook'), @telegrama )

    render json: { status: true }, status: :ok
  end

  def send_message
    Net::HTTP.post_form( URI.parse('https://api.telegram.org/bot925758676:AAFmWDq4w8UXpnSmgHKj1sg8jd0RT_oslo0/sendMessage'), {
      'chat_id' => params[:chat_id],
      'text'    => params[:text]
    })

    render json: { status: true }, status: :ok
  end

  private
    def parse_telegrama
      begin
        text_arr   = params[:message][:reply_to_message][:text].split ':'
        @telegrama = {
          :chat_id    => params[:message][:chat][:id],
          :text       => params[:message][:text],
          :text_reply => text_arr[1],
          :support_id => text_arr[0].to_i,
          :error      => false
        }
      rescue Exception => e
        @telegrama = {
          error: true,
          info:  "Error parse reply - #{e}"
        }
      end
    end
end
