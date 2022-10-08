module RatesHelper

    def check_missing(params)
        @oldest_day = Day.oldest_day.date
        @date_from = Date.parse(params[:date_from])
        @date_to = Date.parse(params[:date_to])
        if @oldest_day > @date_from
            if @oldest_day > @date_to
                NbpDownloadMissingRatesJob.perform_later (@date_from..@date_to).to_a
            else
                NbpDownloadMissingRatesJob.perform_later (@date_from..@oldest_day - 1).to_a
            end
            return true
        end
        return false
    end
end