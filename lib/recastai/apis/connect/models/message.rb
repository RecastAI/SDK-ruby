# encoding: utf-8

module RecastAI
  class Msg
    attr_reader :content, :type, :conversation_id

    def initialize(request)
      request = JSON.parse(request)
      request.each do |k, v|
        self.instance_variable_set("@#{k}", v)
        self.define_singleton_method(k.to_sym){ v }
      end

      @conversation_id = request['message']['conversation']
      @content = request['message']['attachment']['content']
      @type = request['message']['attachment']['type']
    end
  end
end
