json.set! :results do
  json.array! @yubins do |yubin|
    json.zipcode yubin.zipcode
    json.region yubin.region
    json.locality yubin.locality
    json.street_address yubin.street_address
  end
end
json.count @yubins.length
json.message @message ||= ''
json.status 200
