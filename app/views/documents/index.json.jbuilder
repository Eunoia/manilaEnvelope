json.array!(@documents) do |document|
  json.extract! document, :case_number, :filepicker_url, :uploader, :date_opened, :case_name, :paid
  json.url document_url(document, format: :json)
end
