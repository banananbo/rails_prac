class HomeController < ApplicationController
    class ApiError < StandardError
        attr_reader :error_code, :status, :messages, :extra
        def initialize(status: :bad_request, messages: [], extra: [])
          @status = status
          @messages = messages
          @extra = extra
          super(messages.first)
        end
    end
    before_action :authenticate_user!, only: %i[index]
    rescue_from ApiError, with: :render_error
    def index
    end
    def hoge
        redirect_to "https://qiita.com/japwork", test: "test"
        # raise ApiError.new, muge:true
    end
    private
    def render_error e
        binding.pry
    end
end
