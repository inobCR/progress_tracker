class AddFieldsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :pearson_id,    :string
    add_column :students, :username,      :string
    add_column :students, :first_name,    :string
    add_column :students, :last_name,     :string
    add_column :students, :email_address, :string
    add_column :students, :client_string, :string
  end
end
