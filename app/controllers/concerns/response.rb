module Response
  def json_response(object, status = :ok)
    render json: { data: object }, status: status
  end
end
