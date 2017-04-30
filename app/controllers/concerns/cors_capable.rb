module Concerns::CorsCapable
  extend ActiveSupport::Concern
  # Based on https://gist.github.com/aphexddb/5663894
  # For all responses in this controller, return the CORS access control headers.

  def cors_set_access_control_headers
   headers['Access-Control-Allow-Origin'] = '*'
   headers['Access-Control-Allow-Methods'] = 'POST, GET, DELETE, PUT, PATCH'
   headers['Access-Control-Max-Age'] = "1728000"
  end

  # If this is a preflight OPTIONS request, then short-circuit the
  # request, return only the necessary headers and return an empty
  # text/plain.

  def cors_preflight_check
   if request.method == 'OPTIONS'
     headers['Access-Control-Allow-Origin'] = '*'
     headers['Access-Control-Allow-Methods'] = 'POST, GET, DELETE, PUT, PATCH'
     headers['Access-Control-Allow-Headers'] = '*, Content-Type, X-Requested-With, X-Prototype-Version, X-CSRF-Token'
     headers['Access-Control-Max-Age'] = '1728000'
     render :text => '', :content_type => 'text/plain'
   end
  end
end
