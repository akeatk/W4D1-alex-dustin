class ArtworksController < ApplicationController
  def index
    artworks = User.find(params[:user_id]).artworks
    if artworks
      render json: artworks
    else
      render json: artworks.errors.full_messages, status: 404
    end
  end

  def show
    artwork = Artwork.find(params[:id])
    if artwork
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 404
    end
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork, status: 201
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.save
      render json: artwork, status: 200
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    if artwork
      artwork.destroy
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 404
    end
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :artist_id, :image_url)
  end
end