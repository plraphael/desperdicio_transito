class StaticPagesController < ApplicationController

  def home
    @daily = daily_wasted
    @weekly = weekly_wasted
    @monthly = monthly_wasted
  end

  private

    def daily_wasted
      medicoes = get_all_medicoes_day
      total_wasted = 0.0
      medicoes.each do |m|
        total_wasted += wasted_by_medicao(m)
      end
      return total_wasted
    end

    def weekly_wasted
      medicoes = get_all_medicoes_week
      total_wasted = 0.0
      medicoes.each do |m|
        total_wasted += wasted_by_medicao(m)
      end
      return total_wasted
    end

    def monthly_wasted
      medicoes = get_all_medicoes_month
      total_wasted = 0.0
      medicoes.each do |m|
        total_wasted += wasted_by_medicao(m)
      end
      return total_wasted
    end

    def wasted_by_medicao(medicao)
      car_number = medicao.km * 1000 / 8
      total_gas_consumption = car_number * 0.025 * 10
      total_money = total_gas_consumption * 2.5
      return total_money
    end

    def get_all_medicoes_day
      medicoes = Medicao.find(:all, :conditions => [" created_at between ? AND ?", Time.zone.now.beginning_of_day, Time.zone.now.end_of_day])
      medicoes
    end

    def get_all_medicoes_week
      medicoes = Medicao.find(:all, :conditions => [" created_at between ? AND ?", Time.zone.now.beginning_of_week, Time.zone.now.end_of_week])
      medicoes
    end

    def get_all_medicoes_month
      medicoes = Medicao.find(:all, :conditions => [" created_at between ? AND ?", Time.zone.now.beginning_of_month, Time.zone.now.end_of_month])
      medicoes
    end
end
