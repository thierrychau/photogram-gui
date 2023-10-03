class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all.order({ :posted_at => :desc })

    render({ :template => "photo_templates/index" })
  end

  def show
    photo_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => photo_id })

    if matching_photos == nil
      redirect_to("/404")
    else
      @the_photo = matching_photos.first

      render({ :template => "photo_templates/show" })
    end
  end

  def create
    new_photo = Photo.new

    new_photo.image = params.fetch("input_image")
    new_photo.caption = params.fetch("input_caption")
    new_photo.owner_id = params.fetch("input_owner_id")

    if new_photo.valid?
      new_photo.save
      redirect_to("/photos/#{new_photo.id}")
    else
      redirect_to("/photos")
    end
  end


  def update
    photo_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => photo_id })
    the_photo = matching_photos.first

    the_photo.image = params.fetch("input_image")
    the_photo.caption = params.fetch("input_caption")

    if the_photo.valid?
      the_photo.save
      redirect_to("/photos/#{the_photo.id}")
    else

    end
  end

  def delete
    photo_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => photo_id })
    the_photo = matching_photos.first
    the_photo.destroy

    redirect_to("/photos")
  end

end
