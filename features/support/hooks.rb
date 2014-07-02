# create a logs file before each suite run
Before do |logs|
  Dir.mkdir('logs') unless File.exists?('logs')
  logfile=logs.name.gsub(/\s+/, "")
  $log=Logger.new("logs/#{logfile}.log")
  $log.debug("Start:  #{logs.name}")
end

# on failed scenarios take a screenshot
After do |logs|
  $log.debug("Status:  #{logs.status}")
  if logs.status == :failed
    pic=logs.name.gsub(/\s+/, "")
    page.save_screenshot "logs/#{pic}.jpg"
    print page.html >> index.html
  end
end
