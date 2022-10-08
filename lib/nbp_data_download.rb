class NbpDataDownload

    def self.download(date)
        @day = Day.create(date: date)
        for code in Currency::CODES
            @day.currencies.create(code: code, value: ExchangeRatesNBP.exchange_rate(date, code))
        end
    end
end