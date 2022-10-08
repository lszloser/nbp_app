class NbpWorker
  include Sidekiq::Worker

  def perform
    NbpDataDownload.download(Date.today)
  end
end