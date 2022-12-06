# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :users do
      # we've had to specify the primary_key here, because ROM
      # does not assume that all primary_keys are id by default
      # unlike a certain other framework
      primary_key :id
      column  :first_name, String
      column  :last_name, String
      column  :age, Integer

      column  :created_at, DateTime, null: false
      column  :updated_at, DateTime, null: false
    end
  end
end
