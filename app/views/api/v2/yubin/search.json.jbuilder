# json.set! :results do
#   json.array! @yubins do |yubin|
#     json.zipcode yubin.zipcode
#     json.region yubin.region
#     json.locality yubin.locality
#     json.street_address yubin.street_address
#   end
# end
json.set! :results do
  json.merge! @yubins
end
json.count @yubins.size
json.message @message ||= ''
json.status @status
