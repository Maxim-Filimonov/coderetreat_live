require 'coderetreats'
class CoderetreatsController < ApplicationController
  Coderetreat = Struct.new :status, :location
  def running_today

    @coderetreats = CoderetreatLive::Coderetreats.running_today
  end
end
