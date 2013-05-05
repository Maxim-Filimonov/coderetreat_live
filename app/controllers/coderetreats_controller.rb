class CoderetreatsController < ApplicationController
  Coderetreat = Struct.new :status, :location
  def running_today
    @coderetreats = Object.new
    def @coderetreats.not_started(&block)
      [
        Coderetreat.new('not_started', 'Chicago'),
        Coderetreat.new('not_started', 'Seattle')
      ].each(&block)
    end
    def @coderetreats.in_session(&block)
      [
        Coderetreat.new('in_session', 'Sydney')
      ].each(&block)
    end
  end
end
