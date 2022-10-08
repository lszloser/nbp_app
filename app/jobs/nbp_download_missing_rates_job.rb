class NbpDownloadMissingRatesJob < ApplicationJob
  queue_as :urgent

  def perform(dates)
    for date in dates do
      NbpDataDownload.download(date)
    end
  end
end
