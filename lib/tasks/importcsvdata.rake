namespace :csvimport do
  desc "Import CSV Data."
  task :import_csv_word_data => :environment do
    require 'csv'
    csv_file_path = Constant.word_csv_path

    Word.transaction do 
      CSV.foreach(csv_file_path) do |row|
        if ::Category.exists?(row[0])
          Word.create!(
              category_id: row[0],
              text: row[1],
              answers_attributes: [
                {text: row[2], is_correct: true},
                {text: row[3], is_correct: false},
                {text: row[4], is_correct: false},
                {text: row[5], is_correct: false}
              ]
          )
        else
          puts 'Invalid category ' + row[0] + '. Operation aborted. Please check input file again.'
          raise ActiveRecord::Rollback
        end
      end
    end
  end
end