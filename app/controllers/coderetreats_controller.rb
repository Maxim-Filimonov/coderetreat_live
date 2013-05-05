require 'coderetreats/presenters/collection'

class CoderetreatsController < ApplicationController
  Coderetreat = Struct.new :status, :location
  def running_today
    coderetreats = 
      [
        Coderetreat.new('not_started', 'Chicago'),
        Coderetreat.new('not_started', 'Seattle'),
        Coderetreat.new('in_session', 'Sydney')
      ]

    @coderetreats = CoderetreatLive::Coderetreats.running_today
  end
end
