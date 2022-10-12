class TestController < ApplicationController
    protect_from_forgery
    skip_before_action :verify_authenticity_token
    def create
        binding.pry
        logger.warn "this is new"
        test = {test:"ok"}
        params_for_evora = []
        transaction_params.each do |param|
            params_for_evora << {
                id: param[:id],
                amount: { value: param.dig(:amount, :value) },
                content: param[:content],
              }
        end
        
        render :json => params_for_evora
    end

    def index
        test = {test:"ok"}
        render :json => test
    end

    def transaction_params
        @p ||= params.require(:transactions).each.with_index(1) { |param, i| param[:id] = i }
    end
end
