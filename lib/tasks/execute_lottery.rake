# frozen_string_literal: true

namespace :lottery do
  desc 'lottery_in_midnight'
  task execute_lottery: :environment do
    Lottery.closed_lottery.find_each(&:run)
  end
end
