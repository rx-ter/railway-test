json.extract! transaction, :id, :cost, :description, :user_name, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
