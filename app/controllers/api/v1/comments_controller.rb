class Api::V1::CommentsController < Api::V1::BaseController
  before_action :find_restaurant

  def index
    @comments = @restaurant.comments.order(created_at: :desc)
  end

  def create
    # @comment = Comment.new(content: params["data"]["attributes"]["content"])

    @comment = Comment.new(comment_params)
    @comment.restaurant = @restaurant
    @comment.user = current_user

    render json: { errors: @comment.errors }, status: :unprocessable_entity unless @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end

#  curl --location --request POST "http://localhost:3000/api/v1/restaurants/1/comments" \
#   --header "Content-Type: application/json"       \
#   --header "X-User-Email: arthur.dhuy@gmail.com"  \
#   --header "X-User-Token: _Vr-DhDse5YJgZE4AGLx"   \
#   --data "{
#         \"data\": {
#                 \"attributes\": {
#                         \"content\": \"Restaurant avec une vue fantastique\"
#                 }
#         }
# }"

# curl -i -X POST                                                              \
#      -H 'Content-Type: application/json'                                     \
#      -H 'X-User-Email: arthur.dhuy@gmail.com'                                \
#      -H 'X-User-Token: _Vr-DhDse5YJgZE4AGLx'                                 \
#      -d '{ "comment": { "content": "ENFIN ?" } }' \
#      http://localhost:3000/api/v1/restaurants/3/comments







