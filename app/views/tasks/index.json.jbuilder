json.array!(@tasks) do |task|
  json.extract! task, :id, :url, :words, :email, :status
  json.url task_url(task, format: :json)
end
