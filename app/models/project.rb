class Project < ApplicationRecord
    #Need to require the title and description of the project
    validates_presence_of :title, :description
end
