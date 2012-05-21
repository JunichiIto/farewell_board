# -*- encoding: utf-8 -*-
namespace :seed do
  desc "Add default messages"
  task :default_messages => :environment do
    User.all.each do |item|
      User.all.each do |other|
        if item != other && item.messages.find_by_to_user_id(other.id).blank?
          item.messages.create! to_user_id: other.id, text: "この豚野郎！"
        end
      end
    end
  end
end

