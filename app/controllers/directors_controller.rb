class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")
    matching_records = Director.where({ :id => the_id})
    @the_director = matching_records.at(0)
    render({ :template => "director_templates/details"})

  end

  def youngest
    sorted_directors = Director.where.not({ :dob => nil }).order({ :dob => :desc })
    @youngest_director = sorted_directors.at(0)
    dob = @youngest_director.dob
    @formatted_date = dob.strftime("%B %d, %Y")
    render({ :template => "director_templates/youngest"})

  end

  def eldest
    sorted_directors = Director.where.not({ :dob => nil }).order({ :dob => :asc })
    @oldest_director = sorted_directors.at(0)
    dob = @oldest_director.dob
    @formatted_date = dob.strftime("%B %d, %Y")

    render({ :template => "director_templates/eldest"})

  end

end
